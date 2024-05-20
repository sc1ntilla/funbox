#ifndef platform_c
#define platform_c

#include "logger.c"
#include "types.h"
#include "memory.c"

static uint32_t platform_init(
	uint64_t memory_size,
	uint32_t window_x,
	uint32_t window_y,
	uint32_t window_width,
	uint32_t window_height
) {
	
	#ifdef x11_c

	uint32_t result = x11_open(
		window_x,
		window_y,
		window_width,
		window_height
	);
	
	if (result != 0) {
		logger_log("platform_init: x11_open failed\n");
		return 1;
	}
	
	#endif
	
	if (memory_init(memory_size, calloc(1, memory_size), 0) != 0) {
		logger_log("platform_init: memory_init failed\n");
		return 2;
	}
	
	return 0;

}

static void platform_update() {

	#ifdef x11_c
	
	x11_update();
	
	#endif

}

static uint32_t plaform_alloc(
	uint64_t size,
	uint8_t **ptr_out
) {
	
	if (ptr_out == 0) {
		logger_log("platform_alloc: invalid argument\n");
		return 1;
	}
	
	if (memory_alloc(size, ptr_out) != 0) {
		logger_log("platform_alloc: memory_alloc failed\n");
		return 2;
	}
	
	return 0; 
	
}

static void platform_free(uint8_t *ptr) {

	memory_free(ptr);

}

struct platform_file {
	uint32_t size;
	uint8_t *src;
};

static void platform_free_file(struct platform_file *file) {

	memory_free(file->src);
	
	struct platform_file zero = {0};
	
	*file = zero;

}

static uint32_t platform_read_file(
	char *path,
	struct platform_file *output
) {

	if (path == 0 || output == 0) {
		logger_log("platform_read_file: invalid argument\n");
		return 1;
	}

	FILE *handle = fopen(path, "r");
	
	if (handle == 0) {
		printf("platform_read_file: couldn't open file \"%s\"\n", path);
		return 2;
	}
	
	fseek(handle, 0, SEEK_END);
	uint32_t size = ftell(handle);
	rewind(handle);
	
	uint8_t *src = 0;
	
	
	if (memory_alloc(size, &src) || src == 0) {
		printf("platform_read_file: memory_alloc failed\n");
		return 3;
	}
	
	fread(src, 1, size, handle);
	
	struct platform_file ret = {
		.size = size,
		.src = src
	};
	
	*output = ret;
	
	fclose(handle);

	return 0;

}

struct platform_image {
	uint32_t width;
	uint32_t height;
	uint32_t *pixels;
};

static uint32_t platform_read_image(
	char *path,
	struct platform_image *output
) {

	if (path == 0 || output == 0) {
		logger_log("platform_read_image: invalid argument\n");
		return 1;
	}

	uint32_t error = 0;
	
	struct platform_file file = {0};

	if (platform_read_file(path, &file) != 0) {
		logger_log("platform_read_image: platform_read_file failed\n");
		return 2;
	}
	
	if (*(uint16_t*)file.src != 0x4d42) {
		logger_log("platform_read_image: invalid file type for file \"%s\"\n", path);
		platform_free_file(&file);
		return 3;
	}
	
	uint32_t offbits = *(uint32_t*)(file.src + 10);
	uint32_t width = *(uint32_t*)(file.src + 18);
	uint32_t height = *(uint32_t*)(file.src + 22);
	uint32_t *pixels = file.src + offbits;
	
	struct platform_image pimage = {
		.width = width,
		.height = height,
		.pixels = pixels
	};
	
	*output = pimage;
	
	return 0;

}

static uint32_t platform_get_pixels_rect(
	uint32_t *width_out,
	uint32_t *height_out,
	uint32_t **pixels_out
) {

	if (width_out == 0 || height_out == 0 || pixels_out == 0) {
		logger_log("platform_get_pixels_rect: invalid argument\n");
		return 1;
	}

	#ifdef x11_c
	
	x11_window_getdrawrect(width_out, height_out, pixels_out);
	
	#endif

	return 0;

}

#endif
