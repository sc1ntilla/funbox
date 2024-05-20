#ifndef logger_c
#define logger_c

#include <stdarg.h>
#include <stdio.h>
#include "types.h"
#include "text.c"

static char logger_path[256];

static uint32_t logger_log(char *string, ...) {

	FILE *handle = fopen(logger_path, "a");
		
	if (handle == 0) {
		printf("logger_log: invalid logger path (did you initialize it correctly?).\n");
		return 1;
	}
	
	va_list list;
	va_start(list, string);
	
	char buffer[4096] = {0};
	
	int32_t count = vsprintf(buffer, string, list);
	
	va_end(list);
	
	if (count > 0) {
		fwrite(buffer, text_length(buffer), 1, handle);
		printf("%s\n", buffer);
	}
	
	fclose(handle);
	
	return 0;
	
}

static uint32_t logger_init(
	char *log_file_path,
	uint8_t reset
) {

	if (log_file_path == 0) {
		printf("logger_init: invalid argument\n");
		return 1;
	}

	if (reset) remove(log_file_path);
	
	text_copy(log_file_path, logger_path, text_length(log_file_path), sizeof(logger_path));
	
	FILE *handle = fopen(log_file_path, "a+");
	
	if (handle != 0) fclose(handle);
	
	return 0;
	
}

#endif
