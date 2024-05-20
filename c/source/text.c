#ifndef text_c
#define text_c

#include "types.h"

static uint32_t text_length(char *text) {
	
	uint32_t length = 0;
	
	while (text[length] != 0) ++length;
	
	return length;
	
}

static void text_copy(
	char *src,
	char *dst,
	uint32_t src_size,
	uint32_t dst_size
) {

	uint32_t itr = 0;
	
	while (itr < src_size && itr < dst_size) {
	
		dst[itr] = src[itr];
		
		++itr;
	
	}

}

#endif
