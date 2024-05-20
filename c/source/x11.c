
#ifndef x11_c
#define x11_c

#include "types.h"

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/XKBlib.h>

#include "logger.c"

static Display  *x11_connection;

static uint32_t  x11_cursor_x;
static uint32_t  x11_cursor_y;

static KeySym    x11_keys_pressed[255];
static uint32_t  x11_buttons_pressed[8];

static Window    x11_window_handle;
static uint32_t  x11_window_events;
static uint32_t  x11_window_width;
static uint32_t  x11_window_height;
static uint32_t *x11_window_pixels;
static XImage	*x11_window_image;

static uint32_t  x11_screen_id;
static GC	 x11_screen_gc;
static Visual	*x11_screen_visual;

static uint32_t x11_open(
	uint32_t x,
	uint32_t y,
	uint32_t width,
	uint32_t height
) {

	x11_connection = XOpenDisplay(0);
	
	if (x11_connection == 0) {
		logger_log("x11_open: XOpenDisplay failed\n");
		return 1;
	}

	x11_window_width = width;
	x11_window_height = height;

	x11_window_handle = XCreateSimpleWindow(x11_connection, XDefaultRootWindow(x11_connection), x, y, x11_window_width, x11_window_height, 0, 0, 0);

	x11_screen_id 	  = XDefaultScreen(x11_connection);
	x11_screen_visual = XDefaultVisual(x11_connection, x11_screen_id);
	x11_screen_gc 	  = XDefaultGC(x11_connection, x11_screen_id);

	x11_window_events = 
		KeyPressMask 	  | KeyReleaseMask    | 
		ButtonPressMask   | ButtonReleaseMask | 
		EnterWindowMask   | LeaveWindowMask   | 
		PointerMotionMask |
		ExposureMask	  ;

	XkbSetDetectableAutoRepeat(x11_connection, 1, 0);
	XSelectInput(x11_connection, x11_window_handle, x11_window_events);
	XMapWindow(x11_connection, x11_window_handle);
	XSync(x11_connection, 0);

	x11_window_pixels = calloc(width * height, 4);

	if (x11_window_pixels == 0) {
		logger_log("x11_open: calloc failed to allocate pixels\n");
		return 2;
	}

	x11_window_image = XCreateImage(x11_connection, x11_screen_visual, DefaultDepth(x11_connection, x11_screen_id), 
			   		ZPixmap, 0, (char*)x11_window_pixels, x11_window_width, x11_window_height, 32, 0);

	return 0;

}

static void x11_update(void) {
	
	XPutImage(x11_connection, x11_window_handle, x11_screen_gc, x11_window_image, 0, 0, 0, 0, x11_window_width, x11_window_height);
	
	XEvent event;
	
	while (XPending(x11_connection) > 0) {
	
		XNextEvent(x11_connection, &event);
		
		switch (event.type) {

			case Expose: {
		       	 	break;
			}

			case KeyRelease: {
			
				KeySym keysym = XkbKeycodeToKeysym(x11_connection, event.xkey.keycode, 0, 0);
				uint32_t index = keysym % 255;
				
				x11_keys_pressed[index] = 0;
				
				break;
			}
			
			case KeyPress: {
			
				
				uint32_t index = keysym % 255;
				
				x11_keys_pressed[index] = keysym;
				
				break;
			}

			case ButtonRelease: {
				
				uint32_t button = event.xbutton.button;
				uint32_t index = button % 8;
				
				x11_buttons_pressed[index] = 0;
				
				break;
			}
			
			case ButtonPress: {
				
				uint32_t button = event.xbutton.button;
				uint32_t index = button % 8;
				
				x11_buttons_pressed[index] = button;
					
				break;
			}
			
			case MotionNotify: {
			
				
				
				break;
			}
			
			default: {
				break;
			}
			
		}
		
	}
	
}

static uint32_t x11_key_ispressed(char *name) {
	KeySym code = XStringToKeysym(name);
	uint32_t index = code % 255;
	return x11_keys_pressed[index] != 0;
}

static uint32_t x11_button_ispressed(uint32_t button) {
	uint32_t index = button % 8;
	return x11_buttons_pressed[index] != 0;
}

static uint32_t x11_window_getdrawrect(
	uint32_t  *width_out,
	uint32_t  *height_out,
	uint32_t **pixels_out
) {
	if (width_out == 0 || height_out == 0 || pixels_out == 0) {
		logger_log("x11_window_getdrawrect: invalid argument\n");
		return 1;
	}
	
	*width_out  = x11_window_width;
	*height_out = x11_window_height;
	*pixels_out = x11_window_pixels;
	
	return 0;
}

#endif
