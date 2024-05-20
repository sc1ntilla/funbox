
struct memory {
  long max;
  long cur;
  char *bytes;
};

static void memory_init(
  long size,
  char *memory,
  struct memory *output
) {

	output->bytes = memory;
	output->max = size;
	output->cur = 0;

}

static int memory_alloc(
	long size,
	struct memory *memory,
	char **output
) {

	if (memory->cur + size > memory->max)
		return 1;
		
	long bytes_free = 0;
	long byte = 0;
	
	size += 8;
	
	while (byte < memory->max) {
	
		if (memory->bytes[byte] == 0) {
		
			++bytes_free;
			++byte;
			
			if (bytes_free == size) {
				
				*(long*)(memory->bytes + byte - size) = size;
				
				memory->cur += size;
				
				*output = memory->bytes + byte - size + 8;
				
				return 0;
				
			}
			
		}
		
		else {
		
			bytes_free = 0;
			
			byte += *(long*)(memory->bytes + byte);

		}
	
	}
	
	return 2;

}

static int memory_free(
  char *ptr,
  struct memory *memory
) {

	long size = *(long*)(ptr - 8);
	
	if (memory->cur - size < 0)
	  return 1;
	
	char *ptr2 = ptr - 8;
	
	long byte = 0;
	
	while (byte < size) {
		ptr2[byte] = 0;
		++byte;
	}
	
	memory->cur -= size;
	
	*ptr = 0;
	
	return 0;

}

#include <malloc.h>

struct file_data {
  long  size;
  char *src;
};

static int c_read_file(
  char *path, 
  struct memory *memory,
  struct file_data *output
) {

  FILE *handle = fopen(path, "r");
  
  if (handle == 0)
    return 1;
  
  /* Get file size: */
  fseek(handle, 0, SEEK_END);
  output->size = ftell(handle);
  rewind(handle);
  
  if (memory_alloc(output->size, memory, &output->src) != 0) {
    fclose(handle);
    return 2;
  }
    
  fread(output->src, output->size, 1, handle);
  
  fclose(handle);
  
  return 0;

}

static int c_free_file(
  struct file_data *file,
  struct memory *memory
) {

  if (memory_free(file->src, memory) != 0)
    return 1;
    
  file->size = 0;
  file->src = 0;
  
  return 0;
  
}

struct image_file_data {
  struct file_data base;
  int width, height, *pixels;
};

static int c_read_image_file(
  char *path,
  struct memory *memory,
  struct image_file_data *output
) {

  struct file_data file = {0};

  if (c_read_file(path, memory, &file) != 0)
    return 1;

  if (*(short*)file.src != 0x4d42) {
    if (c_free_file(&file, memory) != 0)
      return 3;
    return 2;
  }
  
  output->base   = file;
  output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
  output->width  = *(int*)(file.src + 18);
  output->height = *(int*)(file.src + 22);
  
  return 0;

}

static int c_free_image_file(
  struct image_file_data *file,
  struct memory *memory
) {

  if (c_free_file(&file->base, memory) != 0)
    return 1;
    
  file->base.src  = 0;
  file->base.size = 0;
  file->width     = 0;
  file->height    = 0;
  file->pixels    = 0;

  return 0;

}

static void *c_alloc(long size) {
  return calloc(1, size);
}

#include <string.h>
#include <stdio.h>

#include <X11/Xlib.h>
#include <X11/XKBlib.h>

struct x11_window {
  Display *display;
  Window   window;
  int      screen;
  Visual  *visual;
  GC       gc;
  int      depth;
  XImage  *image;
  int      width;
  int      height;
  int     *pixels;
};

static int xlib_open_window(
  int x, 
  int y, 
  int width, 
  int height,
  struct memory *memory,
  struct x11_window *output
) {

  int events = KeyPressMask | KeyReleaseMask | ButtonPressMask | ButtonReleaseMask | EnterWindowMask | LeaveWindowMask | PointerMotionMask | ExposureMask;

  Display *display = XOpenDisplay(0);
  Window window = XCreateSimpleWindow(display, XDefaultRootWindow(display), x, y, width, height, 0, 0, 0);

  XkbSetDetectableAutoRepeat(display, 1, 0);
  XSelectInput(display, window, events);
  XMapWindow(display, window);
  XSync(display, 0);
  
  int     screen = XDefaultScreen(display);
  Visual *visual = XDefaultVisual(display, screen);
  GC      gc     = XDefaultGC(display, screen);
  int     depth  = XDefaultDepth(display, screen);
  
  char *pixels = 0;
  
  if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
    return 1;
  
  XImage *image = XCreateImage(display, visual, depth, ZPixmap, 0, pixels, width, height, 32, 0);
  
  struct x11_window ret = {
    .display = display,
    .window = window,
    .screen = screen,
    .visual = visual,
    .gc = gc,
    .depth = depth,
    .image = image,
    .pixels = (int*)pixels,
    .width = width,
    .height = height
  };
  
  *output = ret;

  return 0;

}

struct xlib_update_window_output {

  int    keys_down_count;
  KeySym keys_down[8];
  
  int    buttons_down_count;
  int    buttons_down[8];
  
  int    cursor_x;
  int    cursor_y;
  
};

static int xlib_update_window(
  struct x11_window *window, 
  struct xlib_update_window_output *output
) {

  XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);

  if (XPending(window->display) > 0) {
  
    XEvent event;
    XNextEvent(window->display, &event);
    
    switch (event.type) {
    
      case KeyPress: {
      
        KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
        
        int slot_free = -1;
        int slot_max = sizeof(output->keys_down) / sizeof(output->keys_down[0]);
        int slot_cur = 0; 
        
        while (slot_cur < slot_max) {

          if (output->keys_down[slot_cur] == 0 && slot_free == -1)
            slot_free = slot_cur;
        
          else if (output->keys_down[slot_cur] == keysym) {
            slot_free = -1;
            break;
          }
        
          ++slot_cur;
           
        }

        if (slot_free != -1) {
          output->keys_down[slot_free] = keysym;
          output->keys_down_count++;
        }
	
        break;
        
      };
    
      case KeyRelease: {
      
        KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
        
        int slot_cur = 0;
        int slot_max = sizeof(output->keys_down) / sizeof(output->keys_down[0]);
        
        while (slot_cur < slot_max) {
        
          if (output->keys_down[slot_cur] == keysym) {
          
            output->keys_down[slot_cur] = 0;
            output->keys_down_count--;
            
            break;
            
          }
          
          ++slot_cur;
        }
        
        break;
        
      };
      
      case ButtonPress: {
      
        int button = event.xbutton.button;
        
        int slot_free = -1;
        int slot_max = sizeof(output->buttons_down) / sizeof(output->buttons_down[0]);
        int slot_cur = 0; 
        
        while (slot_cur < slot_max) {

          if (output->buttons_down[slot_cur] == 0 && slot_free == -1)
            slot_free = slot_cur;
        
          else if (output->buttons_down[slot_cur] == button) {
            slot_free = -1;
            break;
          }
        
          ++slot_cur;
           
        }

        if (slot_free != -1) {
          output->buttons_down[slot_free] = button;
          output->buttons_down_count++;
        }
	
        break;
        
      };
      
      case ButtonRelease: {
      
        int button = event.xbutton.button;
        
        int slot_cur = 0;
        int slot_max = sizeof(output->buttons_down) / sizeof(output->buttons_down[0]);
        
        while (slot_cur < slot_max) {
        
          if (output->buttons_down[slot_cur] == button) {
          
            output->buttons_down[slot_cur] = 0;
            output->buttons_down_count--;
            
            break;
            
          }
          
          ++slot_cur;
        }
        
        break;
        
      };
      
      
      case MotionNotify: {
      
        output->cursor_x = event.xmotion.x;
        output->cursor_y = event.xmotion.y;
        
        break;
        
      };
      
      default: break;
      
    }
    
  }

  return 0;

}

#include <math.h>

struct vec5 {
  float x, y, z, u, v;
};

static inline struct vec5 add_vec5(
  struct vec5 v1,
  struct vec5 v2
) {

  struct vec5 v3;
  
  v3.x = v1.x + v2.x;
  v3.y = v1.y + v2.y;
  v3.z = v1.z + v2.z;
  v3.u = v1.u + v2.u;
  v3.v = v1.v + v2.v;
  
  return v3;

}

static struct vec5 sub_vec5(
  struct vec5 v1,
  struct vec5 v2
) {

  struct vec5 v3;
  
  v3.x = v1.x - v2.x;
  v3.y = v1.y - v2.y;
  v3.z = v1.z - v2.z;
  v3.u = v1.u - v2.u;
  v3.v = v1.v - v2.v;
  
  return v3;

}

static inline struct vec5 scl_vec5(
  struct vec5 v1,
  float sclr
) {

  struct vec5 v2;
  
  v2.x = v1.x * sclr;
  v2.y = v1.y * sclr;
  v2.z = v1.z * sclr;
  v2.u = v1.u * sclr;
  v2.v = v1.v * sclr;
  
  return v2;

}

static inline float dot_vec5(
  struct vec5 v1,
  struct vec5 v2
) {
  
  float dot = 
    (v1.x * v2.x) + 
    (v1.y * v2.y) + 
    (v1.z * v2.z) + 
    (v1.u * v2.u) + 
    (v1.v * v2.v) ;
  
  return dot;

}

struct triangle {

	struct vec5 v1, v2, v3;
	
};

static int rotate_triangle(
	struct triangle *t,
	float degrees_x,
	float degrees_y,
	float degrees_z,
	float origin_x,
	float origin_y,
	float origin_z
) {

	if (degrees_x > 0.0f && degrees_x < 360.0f) {
		
		t->v1.y -= origin_y;
		t->v2.y -= origin_y;
		t->v3.y -= origin_y;
		
		t->v1.z -= origin_z;
		t->v2.z -= origin_z;
		t->v3.z -= origin_z;
		
		float 
			rads = 3.14f / 180.0f * degrees_x,
			cosine = cosf(rads),
			sine = sinf(rads);
		
		float 
			ny1 = cosine * t->v1.y - sine * t->v1.z,
			ny2 = cosine * t->v2.y - sine * t->v2.z,
			ny3 = cosine * t->v3.y - sine * t->v3.z;
			
		float 
			nz1 = sine * t->v1.y + cosine * t->v1.z,
			nz2 = sine * t->v2.y + cosine * t->v2.z,
			nz3 = sine * t->v3.y + cosine * t->v3.z;
		
		t->v1.y = ny1 + origin_y;
		t->v2.y = ny2 + origin_y;
		t->v3.y = ny3 + origin_y;
		
		t->v1.z = nz1 + origin_z;
		t->v2.z = nz2 + origin_z;
		t->v3.z = nz3 + origin_z;
		
	}
	
	if (degrees_y > 0.0f && degrees_y < 360.0f) {
		
		t->v1.x -= origin_x;
		t->v2.x -= origin_x;
		t->v3.x -= origin_x;
		
		t->v1.z -= origin_z;
		t->v2.z -= origin_z;
		t->v3.z -= origin_z;
		
		float 
			rads = 3.14f / 180.0f * degrees_y,
			cosine = cosf(rads),
			sine = sinf(rads);
		
		float 
			nx1 = cosine * t->v1.x + sine * t->v1.z,
			nx2 = cosine * t->v2.x + sine * t->v2.z,
			nx3 = cosine * t->v3.x + sine * t->v3.z;
			
		float 
			nz1 = cosine * t->v1.z - sine * t->v1.x,
			nz2 = cosine * t->v2.z - sine * t->v2.x,
			nz3 = cosine * t->v3.z - sine * t->v3.x;
		
		t->v1.x = nx1 + origin_x;
		t->v2.x = nx2 + origin_x;
		t->v3.x = nx3 + origin_x;
		
		t->v1.z = nz1 + origin_z;
		t->v2.z = nz2 + origin_z;
		t->v3.z = nz3 + origin_z;
		
	}
	
	if (degrees_z > 0.0f && degrees_z < 360.0f) {
		
		t->v1.x -= origin_x;
		t->v2.x -= origin_x;
		t->v3.x -= origin_x;
		
		t->v1.y -= origin_y;
		t->v2.y -= origin_y;
		t->v3.y -= origin_y;
		
		float 
			rads = 3.14f / 180.0f * degrees_z,
			cosine = cosf(rads),
			sine = sinf(rads);
		
		float 
			nx1 = cosine * t->v1.x - sine * t->v1.y,
			nx2 = cosine * t->v2.x - sine * t->v2.y,
			nx3 = cosine * t->v3.x - sine * t->v3.y;
			
		float 
			ny1 = sine * t->v1.x + cosine * t->v1.y,
			ny2 = sine * t->v2.x + cosine * t->v2.y,
			ny3 = sine * t->v3.x + cosine * t->v3.y;
		
		t->v1.x = nx1 + origin_x;
		t->v2.x = nx2 + origin_x;
		t->v3.x = nx3 + origin_x;
		
		t->v1.y = ny1 + origin_y;
		t->v2.y = ny2 + origin_y;
		t->v3.y = ny3 + origin_y;
		
	}

  return 0;

}

static inline float get_triangle_area(struct triangle *t) {

	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	
	if (res < 0) res = -res;
	
	return res;
	
}

struct barycentric_ratio {
	float r1, r2, r3;
};

static inline int get_bary_ratio(
	struct triangle *t,
	struct vec5 *v,
	struct barycentric_ratio *output
) {

	if (t == 0 || v == 0 || output == 0)
	  return 1;

	float all = get_triangle_area(t);
	
	if (all == 0)
	  return 2;

	struct triangle 
	  t1 = {*v, t->v2, t->v3},
	  t2 = {t->v1, *v, t->v3},
		t3 = {t->v1, t->v2, *v};

	float r = 1.0f / all;
	
	struct barycentric_ratio ret = {0};
	
	ret.r1 = get_triangle_area(&t1) * r,
	ret.r2 = get_triangle_area(&t2) * r,
	ret.r3 = get_triangle_area(&t3) * r;
	
	*output = ret;
	
	return 0;

}

struct vertices_obscured {
	char v1, v2, v3;
};

static int triangle_obscured(
	struct triangle *t1,
	struct triangle *t2,
	struct vertices_obscured *output
) {

	struct barycentric_ratio v1, v2, v3;

	if (get_bary_ratio(t1, &t2->v1, &v1) != 0)
	  return 1;
	
	else if (get_bary_ratio(t1, &t2->v2, &v2) != 0)
	  return 2;
	
	else if (get_bary_ratio(t1, &t2->v3, &v3))
	  return 3;

	struct vertices_obscured ret = {0};

	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
		 
	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
		 
	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
		
	*output = ret;
		 
	return 0;

}

static int draw_triangle(
	struct triangle *t,
	int src_width, int src_height, int *src_pixels,
	int dst_width, int dst_height, int *dst_pixels
) {

	if (src_pixels == 0 || dst_pixels == 0)
	  return 1;
	
	struct vec5 
	  top = t->v1,
	  mid = t->v2,
	  bot = t->v3;

	if (top.y < mid.y) {
		struct vec5 temp = top;
		top = mid;
		mid = temp;
	}

	if (mid.y < bot.y) {
		struct vec5 temp = mid;
		mid = bot;
		bot = temp;
	}

	if (top.y < mid.y) {
	  struct vec5 temp = top;
		top = mid;
		mid = temp;
	}

	if (top.y == bot.y) return 2;

	struct vec5
	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));

  struct vec5
    topbotcur = top,
    topmidcur = top,
    midbotcur = mid;
	
	while (topmidcur.y > mid.y) {
	
		struct vec5 
		  start = topbotcur,
		  end   = topmidcur;
	
		if (end.x < start.x) {
		  struct vec5 temp = end;
		  end   = start;
		  start = temp;
		}
		
		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
		struct vec5 startendcur  = start;
		
		while (startendcur.x < end.x) {
		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
			startendcur = add_vec5(startendcur, startendstep);
		}
		
		topbotcur = sub_vec5(topbotcur, topbotstep);
	  topmidcur = sub_vec5(topmidcur, topmidstep);
	  
	}
	
	while (midbotcur.y > bot.y) {
	
		struct vec5 
		  start = topbotcur,
		  end   = midbotcur;
	
		if (end.x < start.x) {
		  struct vec5 temp = end;
		  end   = start;
		  start = temp;
		}
		
		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
		struct vec5 startendcur = start;
		
		while (startendcur.x < end.x) {
		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
			startendcur = add_vec5(startendcur, startendstep);
		}
		
		topbotcur = sub_vec5(topbotcur, topbotstep);
	  midbotcur = sub_vec5(midbotcur, midbotstep);
	  
	}

	return 0;

}

int main(int argc, char **argv) {

  struct memory                     memory        = {0};
  struct x11_window                 window        = {0};
  struct xlib_update_window_output  update        = {0};
  char                             *system_memory = calloc(1, 1024 * 1024 * 1024);
  
  if (system_memory == 0)
    return 1;
  
  memory_init(1024 * 1024 * 1024, system_memory, &memory);

  if (xlib_open_window(0, 0, 1920, 1080, &memory, &window) != 0)
    return 2;

  struct triangle test = {
    100.0f, 100.0f, 0.0f, 0.0f, 0.0f,
    100.0f, 200.0f, 0.0f, 0.0f, 1.0f,
    200.0f, 200.0f, 0.0f, 1.0f, 1.0f
  };

  struct image_file_data image;

  c_read_image_file(
    "../resources/game_assets/textures/test.bmp",
    &memory,
    &image
  );

  while(1) {
  
    int itr = 0;
    
    while (itr < window.width * window.height) {
      window.pixels[itr] = 0xffffffff;
      ++itr;
    }

    draw_triangle(
	    &test,
    	image.width, image.height, image.pixels,
	    window.width, window.height, window.pixels
    );

    xlib_update_window(&window, &update);
    
  }

  return 0;
}
