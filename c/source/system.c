#ifndef system_c
#define system_c

#include <stdarg.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int system_write_file(const char *file_path, char append, const char *text, long text_size) {
	
	FILE *handle = append ? fopen(file_path, "a") : fopen(file_path, "w");
	
	if (handle == 0) {
		printf("system_write_file: fopen failed ('%s').\n", file_path);
		return 1;
	}
	
	fwrite(text, text_size, 1, handle);
		
	fclose(handle);

	if (append)
		printf("system_write_file: appended %ld bytes to file '%s'.\n", text_size, file_path);
	else
		printf("system_write_file: written file '%s' with %ld bytes.\n", file_path, text_size);

	return 0;

}

struct system_file {
	char *src;
	long size;
};

int system_read_file(const char *file_path, struct system_file *output) {

	FILE *handle = fopen(file_path, "r");
	
	if (handle == 0) {
		printf("system_read_file: fopen failed ('%s').\n", file_path);
		return 1;
	}

	fseek(handle, 0, SEEK_END);	
	long size = ftell(handle);
	rewind(handle);

	char *src = malloc(size);
	
	if (src == 0) {
		printf("system_read_file: malloc failed ('%s').\n", file_path);
		return 2;
	}

	fread(src, size, 1, handle);
	
	struct system_file ret = {
		.src = src,
		.size = size
	};
	
	*output = ret;
	
	fclose(handle);

	return 0;

}

void system_free_file(struct system_file *file) {
	if (file->src) {
		free(file->src);
		struct system_file zero = {0};
		*file = zero;
	}
}

#endif
