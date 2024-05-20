#ifndef platform_linux
#define platform_linux

/* Provides functionality to open, close and display pixels on windows and read keyboard and mouse input. */

#include <malloc.h>
#include <X11/Xlib.h>
#include <X11/XKBlib.h>

static Display *x11_display;

static uint32_t x11_default_screen;
static Visual  *x11_default_visual;
static GC       x11_default_graphics_context;
static Window   x11_default_root_window;

static uint32_t x11_window_eventmask;
static Window   x11_window;
static XImage  *x11_window_image;

static uint32_t x11_window_open(
  uint32_t x,
  uint32_t y,
  uint32_t width,
  uint32_t height
) {

  /* Open window and enable it to register system events and display pixels. */

  x11_display = XOpenDisplay(0);
	
  x11_default_screen           = XDefaultScreen(x11_display);
  x11_default_visual           = XDefaultVisual(x11_display, x11_default_screen);
  x11_default_graphics_context = XDefaultGC(x11_display, x11_default_screen);
  x11_default_root_window      = XDefaultRootWindow(x11_display);
	
  x11_window_eventmask = KeyPressMask | KeyReleaseMask | ButtonPressMask | ButtonReleaseMask | EnterWindowMask | LeaveWindowMask | PointerMotionMask | ExposureMask;
	
  x11_window = XCreateSimpleWindow(x11_display, x11_default_root_window, x, y, width, height, 0, 0, 0);

  XkbSetDetectableAutoRepeat(x11_display, 1, 0);
  XSelectInput(x11_display, x11_window, x11_window_eventmask);
  XMapWindow(x11_display, x11_window);
  XSync(x11_display, 0);

  char *pixels = calloc(1, width*height*4);

  x11_window_image = XCreateImage(x11_display, x11_default_visual, DefaultDepth(x11_display, x11_default_screen), ZPixmap, 0, pixels, width, height, 32, 0);

}

#endif
