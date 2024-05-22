
#include <malloc.h>
#include <stdio.h>

/* ------------------------------------------------------------------------------------------------------- file read, free*/

struct file {

	long size;
	char *src;

};

void c_free_file(struct file *file) {

	struct file zero = {0};

	free(file->src);

	*file = zero;

}

long c_read_file(char *file_name, struct file *output) {

	FILE *file_handle = 0;
	long  file_size		= 0;
	char *file_src		= 0;

	/* Open file. */

	file_handle = fopen(file_name, "r");

	if (file_handle == 0) {
		printf("\nERROR: c_read_file failed to open file '%s'.", file_name);
		return 1;
	}

	/* Get file size. */

	fseek(file_handle, 0, SEEK_END);
	file_size = ftell(file_handle);
	rewind(file_handle);

	/* Allocate memory for file. */

	file_src = malloc(file_size);

	if (file_src == 0) {
		printf("\nERROR: c_read_file failed to allocate enough memory to hold file: '%s'.", file_name);
		return 2;
	}

	/* Read file's content into memory. */

	fread(file_src, 1, file_size, file_handle);

	fclose(file_handle);

	/* Output data. */

	struct file ret = {
		.size = file_size,
		.src = file_src
	};

	* output = ret;

	return 0;

}

/* ------------------------------------------------------------------------------------------------------- ttf */

struct table_directory {

	long  sfnt_version;
	short tables_count;
	short search_range;
	short entry_selector;
	short range_shift;

};

struct table_record {

	long tag;
	long checksum;
	long offset;
	long length;

};

struct ttf {
	struct table_directory table_directory;
	struct table_record *table_records;
};

void endian_flip(void *src, long size) {

	char *data = src;

	long itr = 0;

	while (itr < size / 2) {

		char tmp = data[itr];

		data[itr] = data[size - 1 - itr];

		data[size - 1 - itr] = tmp;

		++itr;

	}

}

void ttf_read_table_directory(char *data, struct table_directory *output) {

	struct table_directory dir = * (struct table_directory *) data;

	endian_flip(&dir.sfnt_version, 4);
	endian_flip(&dir.tables_count, 2);
	endian_flip(&dir.search_range, 2);
	endian_flip(&dir.entry_selector, 2);
	endian_flip(&dir.range_shift, 2);

	* output = dir;

}

void ttf_read_file(char *data, struct ttf *output) {

	struct ttf ttf = {0};

	ttf_read_table_directory(data, &ttf.table_directory);

	printf("\ntable directory:\n sfnt_version: 0x%x\n tables_count: %d\n search_range: %d\n entry_selector: %d\n range_shift: %d\n",
		ttf.table_directory.sfnt_version, 
		ttf.table_directory.tables_count, 
		ttf.table_directory.search_range, 
		ttf.table_directory.entry_selector,
		ttf.table_directory.range_shift
	);

}

/* ------------------------------------------------------------------------------------------------------- entry point */

int main(int argc, char **argv) {

	struct file noto_sans_black = {0};
	struct ttf ttf = {0};

	c_read_file("/usr/share/fonts/noto/NotoSans-Black.ttf", &noto_sans_black);

	ttf_read_file(noto_sans_black.src, &ttf);

	return 0;

}
