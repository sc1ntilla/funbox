	.file	"app.c"
# GNU C17 (Debian 12.2.0-14) version 12.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.1-p1, MPC version 1.3.1, isl version isl-0.25-GMP

# warning: MPFR header version 4.1.1-p1 differs from library version 4.2.0.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fasynchronous-unwind-tables
	.text
	.type	memory_init, @function
memory_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# size, size
	movq	%rsi, -16(%rbp)	# memory, memory
	movq	%rdx, -24(%rbp)	# output, output
# ../source/app.c:14: 	output->bytes = memory;
	movq	-24(%rbp), %rax	# output, tmp82
	movq	-16(%rbp), %rdx	# memory, tmp83
	movq	%rdx, 16(%rax)	# tmp83, output_2(D)->bytes
# ../source/app.c:15: 	output->max = size;
	movq	-24(%rbp), %rax	# output, tmp84
	movq	-8(%rbp), %rdx	# size, tmp85
	movq	%rdx, (%rax)	# tmp85, output_2(D)->max
# ../source/app.c:16: 	output->cur = 0;
	movq	-24(%rbp), %rax	# output, tmp86
	movq	$0, 8(%rax)	#, output_2(D)->cur
# ../source/app.c:18: }
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	memory_init, .-memory_init
	.type	memory_alloc, @function
memory_alloc:
.LFB1:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# size, size
	movq	%rsi, -32(%rbp)	# memory, memory
	movq	%rdx, -40(%rbp)	# output, output
# ../source/app.c:26: 	if (memory->cur + size > memory->max)
	movq	-32(%rbp), %rax	# memory, tmp109
	movq	8(%rax), %rdx	# memory_31(D)->cur, _1
# ../source/app.c:26: 	if (memory->cur + size > memory->max)
	movq	-24(%rbp), %rax	# size, tmp110
	addq	%rax, %rdx	# tmp110, _2
# ../source/app.c:26: 	if (memory->cur + size > memory->max)
	movq	-32(%rbp), %rax	# memory, tmp111
	movq	(%rax), %rax	# memory_31(D)->max, _3
# ../source/app.c:26: 	if (memory->cur + size > memory->max)
	cmpq	%rax, %rdx	# _3, _2
	jle	.L3	#,
# ../source/app.c:27: 		return 1;
	movl	$1, %eax	#, _28
	jmp	.L4	#
.L3:
# ../source/app.c:29: 	long bytes_free = 0;
	movq	$0, -8(%rbp)	#, bytes_free
# ../source/app.c:30: 	long byte = 0;
	movq	$0, -16(%rbp)	#, byte
# ../source/app.c:32: 	size += 8;
	addq	$8, -24(%rbp)	#, size
# ../source/app.c:34: 	while (byte < memory->max) {
	jmp	.L5	#
.L7:
# ../source/app.c:36: 		if (memory->bytes[byte] == 0) {
	movq	-32(%rbp), %rax	# memory, tmp112
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _4
# ../source/app.c:36: 		if (memory->bytes[byte] == 0) {
	movq	-16(%rbp), %rax	# byte, byte.0_5
	addq	%rdx, %rax	# _4, _6
	movzbl	(%rax), %eax	# *_6, _7
# ../source/app.c:36: 		if (memory->bytes[byte] == 0) {
	testb	%al, %al	# _7
	jne	.L6	#,
# ../source/app.c:38: 			++bytes_free;
	addq	$1, -8(%rbp)	#, bytes_free
# ../source/app.c:39: 			++byte;
	addq	$1, -16(%rbp)	#, byte
# ../source/app.c:41: 			if (bytes_free == size) {
	movq	-8(%rbp), %rax	# bytes_free, tmp113
	cmpq	-24(%rbp), %rax	# size, tmp113
	jne	.L5	#,
# ../source/app.c:43: 				*(long*)(memory->bytes + byte - size) = size;
	movq	-32(%rbp), %rax	# memory, tmp114
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _8
# ../source/app.c:43: 				*(long*)(memory->bytes + byte - size) = size;
	movq	-16(%rbp), %rcx	# byte, byte.1_9
	movq	-24(%rbp), %rax	# size, size.2_10
	subq	%rax, %rcx	# size.2_10, _11
	addq	%rcx, %rdx	# _11, _12
# ../source/app.c:43: 				*(long*)(memory->bytes + byte - size) = size;
	movq	-24(%rbp), %rax	# size, tmp115
	movq	%rax, (%rdx)	# tmp115, MEM[(long int *)_12]
# ../source/app.c:45: 				memory->cur += size;
	movq	-32(%rbp), %rax	# memory, tmp116
	movq	8(%rax), %rdx	# memory_31(D)->cur, _13
# ../source/app.c:45: 				memory->cur += size;
	movq	-24(%rbp), %rax	# size, tmp117
	addq	%rax, %rdx	# tmp117, _14
	movq	-32(%rbp), %rax	# memory, tmp118
	movq	%rdx, 8(%rax)	# _14, memory_31(D)->cur
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	movq	-32(%rbp), %rax	# memory, tmp119
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _15
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	movq	-16(%rbp), %rcx	# byte, byte.3_16
	movq	-24(%rbp), %rax	# size, size.4_17
	subq	%rax, %rcx	# size.4_17, _18
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	leaq	8(%rcx), %rax	#, _19
	addq	%rax, %rdx	# _19, _20
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	movq	-40(%rbp), %rax	# output, tmp120
	movq	%rdx, (%rax)	# _20, *output_43(D)
# ../source/app.c:49: 				return 0;
	movl	$0, %eax	#, _28
	jmp	.L4	#
.L6:
# ../source/app.c:57: 			bytes_free = 0;
	movq	$0, -8(%rbp)	#, bytes_free
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	movq	-32(%rbp), %rax	# memory, tmp121
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _21
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	movq	-16(%rbp), %rax	# byte, byte.5_22
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	addq	%rdx, %rax	# _21, _23
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	movq	(%rax), %rax	# MEM[(long int *)_23], _24
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	addq	%rax, -16(%rbp)	# _24, byte
.L5:
# ../source/app.c:34: 	while (byte < memory->max) {
	movq	-32(%rbp), %rax	# memory, tmp122
	movq	(%rax), %rax	# memory_31(D)->max, _25
# ../source/app.c:34: 	while (byte < memory->max) {
	cmpq	%rax, -16(%rbp)	# _25, byte
	jl	.L7	#,
# ../source/app.c:65: 	return 2;
	movl	$2, %eax	#, _28
.L4:
# ../source/app.c:67: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	memory_alloc, .-memory_alloc
	.type	memory_free, @function
memory_free:
.LFB2:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# ptr, ptr
	movq	%rsi, -48(%rbp)	# memory, memory
# ../source/app.c:74: 	long size = *(long*)(ptr - 8);
	movq	-40(%rbp), %rax	# ptr, tmp90
	movq	-8(%rax), %rax	# MEM[(long int *)ptr_12(D) + -8B], tmp91
	movq	%rax, -16(%rbp)	# tmp91, size
# ../source/app.c:76: 	if (memory->cur - size < 0)
	movq	-48(%rbp), %rax	# memory, tmp92
	movq	8(%rax), %rax	# memory_14(D)->cur, _1
# ../source/app.c:76: 	if (memory->cur - size < 0)
	subq	-16(%rbp), %rax	# size, _2
# ../source/app.c:76: 	if (memory->cur - size < 0)
	testq	%rax, %rax	# _2
	jns	.L9	#,
# ../source/app.c:77: 	  return 1;
	movl	$1, %eax	#, _8
	jmp	.L10	#
.L9:
# ../source/app.c:79: 	char *ptr2 = ptr - 8;
	movq	-40(%rbp), %rax	# ptr, tmp96
	subq	$8, %rax	#, tmp95
	movq	%rax, -24(%rbp)	# tmp95, ptr2
# ../source/app.c:81: 	long byte = 0;
	movq	$0, -8(%rbp)	#, byte
# ../source/app.c:83: 	while (byte < size) {
	jmp	.L11	#
.L12:
# ../source/app.c:84: 		ptr2[byte] = 0;
	movq	-8(%rbp), %rdx	# byte, byte.6_3
	movq	-24(%rbp), %rax	# ptr2, tmp97
	addq	%rdx, %rax	# byte.6_3, _4
# ../source/app.c:84: 		ptr2[byte] = 0;
	movb	$0, (%rax)	#, *_4
# ../source/app.c:85: 		++byte;
	addq	$1, -8(%rbp)	#, byte
.L11:
# ../source/app.c:83: 	while (byte < size) {
	movq	-8(%rbp), %rax	# byte, tmp98
	cmpq	-16(%rbp), %rax	# size, tmp98
	jl	.L12	#,
# ../source/app.c:88: 	memory->cur -= size;
	movq	-48(%rbp), %rax	# memory, tmp99
	movq	8(%rax), %rax	# memory_14(D)->cur, _5
# ../source/app.c:88: 	memory->cur -= size;
	subq	-16(%rbp), %rax	# size, _5
	movq	%rax, %rdx	# _5, _6
	movq	-48(%rbp), %rax	# memory, tmp100
	movq	%rdx, 8(%rax)	# _6, memory_14(D)->cur
# ../source/app.c:90: 	*ptr = 0;
	movq	-40(%rbp), %rax	# ptr, tmp101
	movb	$0, (%rax)	#, *ptr_12(D)
# ../source/app.c:92: 	return 0;
	movl	$0, %eax	#, _8
.L10:
# ../source/app.c:94: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	memory_free, .-memory_free
	.section	.rodata
.LC0:
	.string	"r"
	.text
	.type	c_read_file, @function
c_read_file:
.LFB3:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# path, path
	movq	%rsi, -32(%rbp)	# memory, memory
	movq	%rdx, -40(%rbp)	# output, output
# ../source/app.c:109:   FILE *handle = fopen(path, "r");
	movq	-24(%rbp), %rax	# path, tmp91
	leaq	.LC0(%rip), %rdx	#, tmp92
	movq	%rdx, %rsi	# tmp92,
	movq	%rax, %rdi	# tmp91,
	call	fopen@PLT	#
	movq	%rax, -8(%rbp)	# tmp93, handle
# ../source/app.c:111:   if (handle == 0)
	cmpq	$0, -8(%rbp)	#, handle
	jne	.L14	#,
# ../source/app.c:112:     return 1;
	movl	$1, %eax	#, _8
	jmp	.L15	#
.L14:
# ../source/app.c:115:   fseek(handle, 0, SEEK_END);
	movq	-8(%rbp), %rax	# handle, tmp94
	movl	$2, %edx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp94,
	call	fseek@PLT	#
# ../source/app.c:116:   output->size = ftell(handle);
	movq	-8(%rbp), %rax	# handle, tmp95
	movq	%rax, %rdi	# tmp95,
	call	ftell@PLT	#
# ../source/app.c:116:   output->size = ftell(handle);
	movq	-40(%rbp), %rdx	# output, tmp96
	movq	%rax, (%rdx)	# _1, output_16(D)->size
# ../source/app.c:117:   rewind(handle);
	movq	-8(%rbp), %rax	# handle, tmp97
	movq	%rax, %rdi	# tmp97,
	call	rewind@PLT	#
# ../source/app.c:119:   if (memory_alloc(output->size, memory, &output->src) != 0) {
	movq	-40(%rbp), %rax	# output, tmp98
	leaq	8(%rax), %rdx	#, _2
	movq	-40(%rbp), %rax	# output, tmp99
	movq	(%rax), %rax	# output_16(D)->size, _3
	movq	-32(%rbp), %rcx	# memory, tmp100
	movq	%rcx, %rsi	# tmp100,
	movq	%rax, %rdi	# _3,
	call	memory_alloc	#
# ../source/app.c:119:   if (memory_alloc(output->size, memory, &output->src) != 0) {
	testl	%eax, %eax	# _4
	je	.L16	#,
# ../source/app.c:120:     fclose(handle);
	movq	-8(%rbp), %rax	# handle, tmp101
	movq	%rax, %rdi	# tmp101,
	call	fclose@PLT	#
# ../source/app.c:121:     return 2;
	movl	$2, %eax	#, _8
	jmp	.L15	#
.L16:
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	-40(%rbp), %rax	# output, tmp102
	movq	(%rax), %rax	# output_16(D)->size, _5
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	%rax, %rsi	# _5, _6
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	-40(%rbp), %rax	# output, tmp103
	movq	8(%rax), %rax	# output_16(D)->src, _7
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	-8(%rbp), %rdx	# handle, tmp104
	movq	%rdx, %rcx	# tmp104,
	movl	$1, %edx	#,
	movq	%rax, %rdi	# _7,
	call	fread@PLT	#
# ../source/app.c:126:   fclose(handle);
	movq	-8(%rbp), %rax	# handle, tmp105
	movq	%rax, %rdi	# tmp105,
	call	fclose@PLT	#
# ../source/app.c:128:   return 0;
	movl	$0, %eax	#, _8
.L15:
# ../source/app.c:130: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE3:
	.size	c_read_file, .-c_read_file
	.type	c_free_file, @function
c_free_file:
.LFB4:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# file, file
	movq	%rsi, -16(%rbp)	# memory, memory
# ../source/app.c:137:   if (memory_free(file->src, memory) != 0)
	movq	-8(%rbp), %rax	# file, tmp86
	movq	8(%rax), %rax	# file_6(D)->src, _1
	movq	-16(%rbp), %rdx	# memory, tmp87
	movq	%rdx, %rsi	# tmp87,
	movq	%rax, %rdi	# _1,
	call	memory_free	#
# ../source/app.c:137:   if (memory_free(file->src, memory) != 0)
	testl	%eax, %eax	# _2
	je	.L18	#,
# ../source/app.c:138:     return 1;
	movl	$1, %eax	#, _3
	jmp	.L19	#
.L18:
# ../source/app.c:140:   file->size = 0;
	movq	-8(%rbp), %rax	# file, tmp88
	movq	$0, (%rax)	#, file_6(D)->size
# ../source/app.c:141:   file->src = 0;
	movq	-8(%rbp), %rax	# file, tmp89
	movq	$0, 8(%rax)	#, file_6(D)->src
# ../source/app.c:143:   return 0;
	movl	$0, %eax	#, _3
.L19:
# ../source/app.c:145: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4:
	.size	c_free_file, .-c_free_file
	.type	c_read_image_file, @function
c_read_image_file:
.LFB5:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# path, path
	movq	%rsi, -32(%rbp)	# memory, memory
	movq	%rdx, -40(%rbp)	# output, output
# ../source/app.c:158:   struct file_data file = {0};
	movq	$0, -16(%rbp)	#, file
	movq	$0, -8(%rbp)	#, file
# ../source/app.c:160:   if (c_read_file(path, memory, &file) != 0)
	leaq	-16(%rbp), %rdx	#, tmp98
	movq	-32(%rbp), %rcx	# memory, tmp99
	movq	-24(%rbp), %rax	# path, tmp100
	movq	%rcx, %rsi	# tmp99,
	movq	%rax, %rdi	# tmp100,
	call	c_read_file	#
# ../source/app.c:160:   if (c_read_file(path, memory, &file) != 0)
	testl	%eax, %eax	# _1
	je	.L21	#,
# ../source/app.c:161:     return 1;
	movl	$1, %eax	#, _15
	jmp	.L25	#
.L21:
# ../source/app.c:163:   if (*(short*)file.src != 0x4d42) {
	movq	-8(%rbp), %rax	# file.src, _2
# ../source/app.c:163:   if (*(short*)file.src != 0x4d42) {
	movzwl	(%rax), %eax	# MEM[(short int *)_2], _3
# ../source/app.c:163:   if (*(short*)file.src != 0x4d42) {
	cmpw	$19778, %ax	#, _3
	je	.L23	#,
# ../source/app.c:164:     if (c_free_file(&file, memory) != 0)
	movq	-32(%rbp), %rdx	# memory, tmp101
	leaq	-16(%rbp), %rax	#, tmp102
	movq	%rdx, %rsi	# tmp101,
	movq	%rax, %rdi	# tmp102,
	call	c_free_file	#
# ../source/app.c:164:     if (c_free_file(&file, memory) != 0)
	testl	%eax, %eax	# _4
	je	.L24	#,
# ../source/app.c:165:       return 3;
	movl	$3, %eax	#, _15
	jmp	.L25	#
.L24:
# ../source/app.c:166:     return 2;
	movl	$2, %eax	#, _15
	jmp	.L25	#
.L23:
# ../source/app.c:169:   output->base   = file;
	movq	-40(%rbp), %rcx	# output, tmp103
	movq	-16(%rbp), %rax	# file, tmp104
	movq	-8(%rbp), %rdx	# file,
	movq	%rax, (%rcx)	# tmp104, output_22(D)->base
	movq	%rdx, 8(%rcx)	#, output_22(D)->base
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movq	-8(%rbp), %rdx	# file.src, _5
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movq	-8(%rbp), %rax	# file.src, _6
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	addq	$10, %rax	#, _7
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movl	(%rax), %eax	# MEM[(int *)_7], _8
	cltq
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	addq	%rax, %rdx	# _9, _10
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movq	-40(%rbp), %rax	# output, tmp105
	movq	%rdx, 24(%rax)	# _10, output_22(D)->pixels
# ../source/app.c:171:   output->width  = *(int*)(file.src + 18);
	movq	-8(%rbp), %rax	# file.src, _11
# ../source/app.c:171:   output->width  = *(int*)(file.src + 18);
	movl	18(%rax), %edx	# MEM[(int *)_11 + 18B], _12
	movq	-40(%rbp), %rax	# output, tmp106
	movl	%edx, 16(%rax)	# _12, output_22(D)->width
# ../source/app.c:172:   output->height = *(int*)(file.src + 22);
	movq	-8(%rbp), %rax	# file.src, _13
# ../source/app.c:172:   output->height = *(int*)(file.src + 22);
	movl	22(%rax), %edx	# MEM[(int *)_13 + 22B], _14
	movq	-40(%rbp), %rax	# output, tmp107
	movl	%edx, 20(%rax)	# _14, output_22(D)->height
# ../source/app.c:174:   return 0;
	movl	$0, %eax	#, _15
.L25:
# ../source/app.c:176: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5:
	.size	c_read_image_file, .-c_read_image_file
	.type	c_free_image_file, @function
c_free_image_file:
.LFB6:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# file, file
	movq	%rsi, -16(%rbp)	# memory, memory
# ../source/app.c:183:   if (c_free_file(&file->base, memory) != 0)
	movq	-8(%rbp), %rax	# file, _1
	movq	-16(%rbp), %rdx	# memory, tmp86
	movq	%rdx, %rsi	# tmp86,
	movq	%rax, %rdi	# _1,
	call	c_free_file	#
# ../source/app.c:183:   if (c_free_file(&file->base, memory) != 0)
	testl	%eax, %eax	# _2
	je	.L27	#,
# ../source/app.c:184:     return 1;
	movl	$1, %eax	#, _3
	jmp	.L28	#
.L27:
# ../source/app.c:186:   file->base.src  = 0;
	movq	-8(%rbp), %rax	# file, tmp87
	movq	$0, 8(%rax)	#, file_5(D)->base.src
# ../source/app.c:187:   file->base.size = 0;
	movq	-8(%rbp), %rax	# file, tmp88
	movq	$0, (%rax)	#, file_5(D)->base.size
# ../source/app.c:188:   file->width     = 0;
	movq	-8(%rbp), %rax	# file, tmp89
	movl	$0, 16(%rax)	#, file_5(D)->width
# ../source/app.c:189:   file->height    = 0;
	movq	-8(%rbp), %rax	# file, tmp90
	movl	$0, 20(%rax)	#, file_5(D)->height
# ../source/app.c:190:   file->pixels    = 0;
	movq	-8(%rbp), %rax	# file, tmp91
	movq	$0, 24(%rax)	#, file_5(D)->pixels
# ../source/app.c:192:   return 0;
	movl	$0, %eax	#, _3
.L28:
# ../source/app.c:194: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	c_free_image_file, .-c_free_image_file
	.type	c_alloc, @function
c_alloc:
.LFB7:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# size, size
# ../source/app.c:197:   return calloc(1, size);
	movq	-8(%rbp), %rax	# size, size.7_1
	movq	%rax, %rsi	# size.7_1,
	movl	$1, %edi	#,
	call	calloc@PLT	#
# ../source/app.c:198: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	c_alloc, .-c_alloc
	.type	xlib_open_window, @function
xlib_open_window:
.LFB14:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r12	#
	pushq	%rbx	#
	subq	$176, %rsp	#,
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movl	%edi, -164(%rbp)	# x, x
	movl	%esi, -168(%rbp)	# y, y
	movl	%edx, -172(%rbp)	# width, width
	movl	%ecx, -176(%rbp)	# height, height
	movq	%r8, -184(%rbp)	# memory, memory
	movq	%r9, -192(%rbp)	# output, output
# ../source/app.c:228:   int events = KeyPressMask | KeyReleaseMask | ButtonPressMask | ButtonReleaseMask | EnterWindowMask | LeaveWindowMask | PointerMotionMask | ExposureMask;
	movl	$32895, -20(%rbp)	#, events
# ../source/app.c:230:   Display *display = XOpenDisplay(0);
	movl	$0, %edi	#,
	call	XOpenDisplay@PLT	#
	movq	%rax, -32(%rbp)	# tmp97, display
# ../source/app.c:231:   Window window = XCreateSimpleWindow(display, XDefaultRootWindow(display), x, y, width, height, 0, 0, 0);
	movl	-176(%rbp), %r12d	# height, height.8_1
	movl	-172(%rbp), %ebx	# width, width.9_2
	movq	-32(%rbp), %rax	# display, tmp98
	movq	%rax, %rdi	# tmp98,
	call	XDefaultRootWindow@PLT	#
	movq	%rax, %rsi	#, _3
	movl	-168(%rbp), %ecx	# y, tmp99
	movl	-164(%rbp), %edx	# x, tmp100
	movq	-32(%rbp), %rax	# display, tmp101
	subq	$8, %rsp	#,
	pushq	$0	#
	pushq	$0	#
	pushq	$0	#
	movl	%r12d, %r9d	# height.8_1,
	movl	%ebx, %r8d	# width.9_2,
	movq	%rax, %rdi	# tmp101,
	call	XCreateSimpleWindow@PLT	#
	addq	$32, %rsp	#,
	movq	%rax, -40(%rbp)	# tmp102, window
# ../source/app.c:233:   XkbSetDetectableAutoRepeat(display, 1, 0);
	movq	-32(%rbp), %rax	# display, tmp103
	movl	$0, %edx	#,
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp103,
	call	XkbSetDetectableAutoRepeat@PLT	#
# ../source/app.c:234:   XSelectInput(display, window, events);
	movl	-20(%rbp), %eax	# events, tmp104
	movslq	%eax, %rdx	# tmp104, _4
	movq	-40(%rbp), %rcx	# window, tmp105
	movq	-32(%rbp), %rax	# display, tmp106
	movq	%rcx, %rsi	# tmp105,
	movq	%rax, %rdi	# tmp106,
	call	XSelectInput@PLT	#
# ../source/app.c:235:   XMapWindow(display, window);
	movq	-40(%rbp), %rdx	# window, tmp107
	movq	-32(%rbp), %rax	# display, tmp108
	movq	%rdx, %rsi	# tmp107,
	movq	%rax, %rdi	# tmp108,
	call	XMapWindow@PLT	#
# ../source/app.c:236:   XSync(display, 0);
	movq	-32(%rbp), %rax	# display, tmp109
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp109,
	call	XSync@PLT	#
# ../source/app.c:238:   int     screen = XDefaultScreen(display);
	movq	-32(%rbp), %rax	# display, tmp110
	movq	%rax, %rdi	# tmp110,
	call	XDefaultScreen@PLT	#
	movl	%eax, -44(%rbp)	# tmp111, screen
# ../source/app.c:239:   Visual *visual = XDefaultVisual(display, screen);
	movl	-44(%rbp), %edx	# screen, tmp112
	movq	-32(%rbp), %rax	# display, tmp113
	movl	%edx, %esi	# tmp112,
	movq	%rax, %rdi	# tmp113,
	call	XDefaultVisual@PLT	#
	movq	%rax, -56(%rbp)	# tmp114, visual
# ../source/app.c:240:   GC      gc     = XDefaultGC(display, screen);
	movl	-44(%rbp), %edx	# screen, tmp115
	movq	-32(%rbp), %rax	# display, tmp116
	movl	%edx, %esi	# tmp115,
	movq	%rax, %rdi	# tmp116,
	call	XDefaultGC@PLT	#
	movq	%rax, -64(%rbp)	# tmp117, gc
# ../source/app.c:241:   int     depth  = XDefaultDepth(display, screen);
	movl	-44(%rbp), %edx	# screen, tmp118
	movq	-32(%rbp), %rax	# display, tmp119
	movl	%edx, %esi	# tmp118,
	movq	%rax, %rdi	# tmp119,
	call	XDefaultDepth@PLT	#
	movl	%eax, -68(%rbp)	# tmp120, depth
# ../source/app.c:243:   char *pixels = 0;
	movq	$0, -88(%rbp)	#, pixels
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	movl	-172(%rbp), %eax	# width, tmp121
	imull	-176(%rbp), %eax	# height, _5
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	sall	$2, %eax	#, _6
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	cltq
	leaq	-88(%rbp), %rdx	#, tmp122
	movq	-184(%rbp), %rcx	# memory, tmp123
	movq	%rcx, %rsi	# tmp123,
	movq	%rax, %rdi	# _7,
	call	memory_alloc	#
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	testl	%eax, %eax	# _8
	je	.L32	#,
# ../source/app.c:246:     return 1;
	movl	$1, %eax	#, _14
	jmp	.L34	#
.L32:
# ../source/app.c:248:   XImage *image = XCreateImage(display, visual, depth, ZPixmap, 0, pixels, width, height, 32, 0);
	movl	-176(%rbp), %edi	# height, height.10_9
	movl	-172(%rbp), %ecx	# width, width.11_10
	movq	-88(%rbp), %r8	# pixels, pixels.12_11
	movl	-68(%rbp), %edx	# depth, depth.13_12
	movq	-56(%rbp), %rsi	# visual, tmp124
	movq	-32(%rbp), %rax	# display, tmp125
	pushq	$0	#
	pushq	$32	#
	pushq	%rdi	# height.10_9
	pushq	%rcx	# width.11_10
	movq	%r8, %r9	# pixels.12_11,
	movl	$0, %r8d	#,
	movl	$2, %ecx	#,
	movq	%rax, %rdi	# tmp125,
	call	XCreateImage@PLT	#
	addq	$32, %rsp	#,
	movq	%rax, -80(%rbp)	# tmp126, image
# ../source/app.c:250:   struct x11_window ret = {
	movq	-32(%rbp), %rax	# display, tmp127
	movq	%rax, -160(%rbp)	# tmp127, ret.display
	movq	-40(%rbp), %rax	# window, tmp128
	movq	%rax, -152(%rbp)	# tmp128, ret.window
	movl	-44(%rbp), %eax	# screen, tmp129
	movl	%eax, -144(%rbp)	# tmp129, ret.screen
	movq	-56(%rbp), %rax	# visual, tmp130
	movq	%rax, -136(%rbp)	# tmp130, ret.visual
	movq	-64(%rbp), %rax	# gc, tmp131
	movq	%rax, -128(%rbp)	# tmp131, ret.gc
	movl	-68(%rbp), %eax	# depth, tmp132
	movl	%eax, -120(%rbp)	# tmp132, ret.depth
	movq	-80(%rbp), %rax	# image, tmp133
	movq	%rax, -112(%rbp)	# tmp133, ret.image
	movl	-172(%rbp), %eax	# width, tmp134
	movl	%eax, -104(%rbp)	# tmp134, ret.width
	movl	-176(%rbp), %eax	# height, tmp135
	movl	%eax, -100(%rbp)	# tmp135, ret.height
	movq	-88(%rbp), %rax	# pixels, pixels.14_13
	movq	%rax, -96(%rbp)	# pixels.14_13, ret.pixels
# ../source/app.c:263:   *output = ret;
	movq	-192(%rbp), %rax	# output, tmp136
	movq	-160(%rbp), %rcx	# ret, tmp137
	movq	-152(%rbp), %rbx	# ret,
	movq	%rcx, (%rax)	# tmp137, *output_54(D)
	movq	%rbx, 8(%rax)	#, *output_54(D)
	movq	-144(%rbp), %rcx	# ret, tmp138
	movq	-136(%rbp), %rbx	# ret,
	movq	%rcx, 16(%rax)	# tmp138, *output_54(D)
	movq	%rbx, 24(%rax)	#, *output_54(D)
	movq	-128(%rbp), %rcx	# ret, tmp139
	movq	-120(%rbp), %rbx	# ret,
	movq	%rcx, 32(%rax)	# tmp139, *output_54(D)
	movq	%rbx, 40(%rax)	#, *output_54(D)
	movq	-112(%rbp), %rcx	# ret, tmp140
	movq	-104(%rbp), %rbx	# ret,
	movq	%rcx, 48(%rax)	# tmp140, *output_54(D)
	movq	%rbx, 56(%rax)	#, *output_54(D)
	movq	-96(%rbp), %rdx	# ret, tmp141
	movq	%rdx, 64(%rax)	# tmp141, *output_54(D)
# ../source/app.c:265:   return 0;
	movl	$0, %eax	#, _14
.L34:
# ../source/app.c:267: }
	leaq	-16(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	xlib_open_window, .-xlib_open_window
	.type	xlib_update_window, @function
xlib_update_window:
.LFB15:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$288, %rsp	#,
	movq	%rdi, -280(%rbp)	# window, window
	movq	%rsi, -288(%rbp)	# output, output
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movq	-280(%rbp), %rax	# window, tmp122
	movl	60(%rax), %eax	# window_56(D)->height, _1
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movl	%eax, %r8d	# _1, _2
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movq	-280(%rbp), %rax	# window, tmp123
	movl	56(%rax), %eax	# window_56(D)->width, _3
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movl	%eax, %edi	# _3, _4
	movq	-280(%rbp), %rax	# window, tmp124
	movq	48(%rax), %rcx	# window_56(D)->image, _5
	movq	-280(%rbp), %rax	# window, tmp125
	movq	32(%rax), %rdx	# window_56(D)->gc, _6
	movq	-280(%rbp), %rax	# window, tmp126
	movq	8(%rax), %rsi	# window_56(D)->window, _7
	movq	-280(%rbp), %rax	# window, tmp127
	movq	(%rax), %rax	# window_56(D)->display, _8
	pushq	%r8	# _2
	pushq	%rdi	# _4
	pushq	$0	#
	pushq	$0	#
	movl	$0, %r9d	#,
	movl	$0, %r8d	#,
	movq	%rax, %rdi	# _8,
	call	XPutImage@PLT	#
	addq	$32, %rsp	#,
# ../source/app.c:289:   if (XPending(window->display) > 0) {
	movq	-280(%rbp), %rax	# window, tmp128
	movq	(%rax), %rax	# window_56(D)->display, _9
	movq	%rax, %rdi	# _9,
	call	XPending@PLT	#
# ../source/app.c:289:   if (XPending(window->display) > 0) {
	testl	%eax, %eax	# _10
	jle	.L36	#,
# ../source/app.c:292:     XNextEvent(window->display, &event);
	movq	-280(%rbp), %rax	# window, tmp129
	movq	(%rax), %rax	# window_56(D)->display, _11
	leaq	-272(%rbp), %rdx	#, tmp130
	movq	%rdx, %rsi	# tmp130,
	movq	%rax, %rdi	# _11,
	call	XNextEvent@PLT	#
# ../source/app.c:294:     switch (event.type) {
	movl	-272(%rbp), %eax	# event.type, _12
# ../source/app.c:294:     switch (event.type) {
	cmpl	$6, %eax	#, _12
	ja	.L66	#,
	movl	%eax, %eax	# _12, tmp131
	leaq	0(,%rax,4), %rdx	#, tmp132
	leaq	.L39(%rip), %rax	#, tmp133
	movl	(%rdx,%rax), %eax	#, tmp134
	cltq
	leaq	.L39(%rip), %rdx	#, tmp137
	addq	%rdx, %rax	# tmp137, tmp136
	jmp	*%rax	# tmp136
	.section	.rodata
	.align 4
	.align 4
.L39:
	.long	.L66-.L39
	.long	.L66-.L39
	.long	.L43-.L39
	.long	.L42-.L39
	.long	.L41-.L39
	.long	.L40-.L39
	.long	.L38-.L39
	.text
.L43:
# ../source/app.c:298:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movl	-188(%rbp), %eax	# event.xkey.keycode, _13
# ../source/app.c:298:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movzbl	%al, %esi	# _14, _15
	movq	-280(%rbp), %rax	# window, tmp138
	movq	(%rax), %rax	# window_56(D)->display, _16
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# _16,
	call	XkbKeycodeToKeysym@PLT	#
	movq	%rax, -64(%rbp)	# tmp139, keysym
# ../source/app.c:300:         int slot_free = -1;
	movl	$-1, -4(%rbp)	#, slot_free
# ../source/app.c:301:         int slot_max = sizeof(output->keys_down) / sizeof(output->keys_down[0]);
	movl	$8, -68(%rbp)	#, slot_max
# ../source/app.c:302:         int slot_cur = 0; 
	movl	$0, -8(%rbp)	#, slot_cur
# ../source/app.c:304:         while (slot_cur < slot_max) {
	jmp	.L44	#
.L48:
# ../source/app.c:306:           if (output->keys_down[slot_cur] == 0 && slot_free == -1)
	movq	-288(%rbp), %rax	# output, tmp140
	movl	-8(%rbp), %edx	# slot_cur, tmp142
	movslq	%edx, %rdx	# tmp142, tmp141
	movq	8(%rax,%rdx,8), %rax	# output_60(D)->keys_down[slot_cur_42], _17
# ../source/app.c:306:           if (output->keys_down[slot_cur] == 0 && slot_free == -1)
	testq	%rax, %rax	# _17
	jne	.L45	#,
# ../source/app.c:306:           if (output->keys_down[slot_cur] == 0 && slot_free == -1)
	cmpl	$-1, -4(%rbp)	#, slot_free
	jne	.L45	#,
# ../source/app.c:307:             slot_free = slot_cur;
	movl	-8(%rbp), %eax	# slot_cur, tmp143
	movl	%eax, -4(%rbp)	# tmp143, slot_free
	jmp	.L46	#
.L45:
# ../source/app.c:309:           else if (output->keys_down[slot_cur] == keysym) {
	movq	-288(%rbp), %rax	# output, tmp144
	movl	-8(%rbp), %edx	# slot_cur, tmp146
	movslq	%edx, %rdx	# tmp146, tmp145
	movq	8(%rax,%rdx,8), %rax	# output_60(D)->keys_down[slot_cur_42], _18
# ../source/app.c:309:           else if (output->keys_down[slot_cur] == keysym) {
	cmpq	%rax, -64(%rbp)	# _18, keysym
	jne	.L46	#,
# ../source/app.c:310:             slot_free = -1;
	movl	$-1, -4(%rbp)	#, slot_free
# ../source/app.c:311:             break;
	jmp	.L47	#
.L46:
# ../source/app.c:314:           ++slot_cur;
	addl	$1, -8(%rbp)	#, slot_cur
.L44:
# ../source/app.c:304:         while (slot_cur < slot_max) {
	movl	-8(%rbp), %eax	# slot_cur, tmp147
	cmpl	-68(%rbp), %eax	# slot_max, tmp147
	jl	.L48	#,
.L47:
# ../source/app.c:318:         if (slot_free != -1) {
	cmpl	$-1, -4(%rbp)	#, slot_free
	je	.L67	#,
# ../source/app.c:319:           output->keys_down[slot_free] = keysym;
	movq	-288(%rbp), %rax	# output, tmp148
	movl	-4(%rbp), %edx	# slot_free, tmp150
	movslq	%edx, %rdx	# tmp150, tmp149
	movq	-64(%rbp), %rcx	# keysym, tmp151
	movq	%rcx, 8(%rax,%rdx,8)	# tmp151, output_60(D)->keys_down[slot_free_41]
# ../source/app.c:320:           output->keys_down_count++;
	movq	-288(%rbp), %rax	# output, tmp152
	movl	(%rax), %eax	# output_60(D)->keys_down_count, _19
# ../source/app.c:320:           output->keys_down_count++;
	leal	1(%rax), %edx	#, _20
	movq	-288(%rbp), %rax	# output, tmp153
	movl	%edx, (%rax)	# _20, output_60(D)->keys_down_count
# ../source/app.c:323:         break;
	jmp	.L67	#
.L42:
# ../source/app.c:329:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movl	-188(%rbp), %eax	# event.xkey.keycode, _21
# ../source/app.c:329:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movzbl	%al, %esi	# _22, _23
	movq	-280(%rbp), %rax	# window, tmp154
	movq	(%rax), %rax	# window_56(D)->display, _24
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# _24,
	call	XkbKeycodeToKeysym@PLT	#
	movq	%rax, -48(%rbp)	# tmp155, keysym
# ../source/app.c:331:         int slot_cur = 0;
	movl	$0, -12(%rbp)	#, slot_cur
# ../source/app.c:332:         int slot_max = sizeof(output->keys_down) / sizeof(output->keys_down[0]);
	movl	$8, -52(%rbp)	#, slot_max
# ../source/app.c:334:         while (slot_cur < slot_max) {
	jmp	.L51	#
.L54:
# ../source/app.c:336:           if (output->keys_down[slot_cur] == keysym) {
	movq	-288(%rbp), %rax	# output, tmp156
	movl	-12(%rbp), %edx	# slot_cur, tmp158
	movslq	%edx, %rdx	# tmp158, tmp157
	movq	8(%rax,%rdx,8), %rax	# output_60(D)->keys_down[slot_cur_43], _25
# ../source/app.c:336:           if (output->keys_down[slot_cur] == keysym) {
	cmpq	%rax, -48(%rbp)	# _25, keysym
	jne	.L52	#,
# ../source/app.c:338:             output->keys_down[slot_cur] = 0;
	movq	-288(%rbp), %rax	# output, tmp159
	movl	-12(%rbp), %edx	# slot_cur, tmp161
	movslq	%edx, %rdx	# tmp161, tmp160
	movq	$0, 8(%rax,%rdx,8)	#, output_60(D)->keys_down[slot_cur_43]
# ../source/app.c:339:             output->keys_down_count--;
	movq	-288(%rbp), %rax	# output, tmp162
	movl	(%rax), %eax	# output_60(D)->keys_down_count, _26
# ../source/app.c:339:             output->keys_down_count--;
	leal	-1(%rax), %edx	#, _27
	movq	-288(%rbp), %rax	# output, tmp163
	movl	%edx, (%rax)	# _27, output_60(D)->keys_down_count
# ../source/app.c:341:             break;
	nop	
# ../source/app.c:348:         break;
	jmp	.L36	#
.L52:
# ../source/app.c:345:           ++slot_cur;
	addl	$1, -12(%rbp)	#, slot_cur
.L51:
# ../source/app.c:334:         while (slot_cur < slot_max) {
	movl	-12(%rbp), %eax	# slot_cur, tmp164
	cmpl	-52(%rbp), %eax	# slot_max, tmp164
	jl	.L54	#,
# ../source/app.c:348:         break;
	jmp	.L36	#
.L41:
# ../source/app.c:354:         int button = event.xbutton.button;
	movl	-188(%rbp), %eax	# event.xbutton.button, _28
# ../source/app.c:354:         int button = event.xbutton.button;
	movl	%eax, -36(%rbp)	# _28, button
# ../source/app.c:356:         int slot_free = -1;
	movl	$-1, -16(%rbp)	#, slot_free
# ../source/app.c:357:         int slot_max = sizeof(output->buttons_down) / sizeof(output->buttons_down[0]);
	movl	$8, -40(%rbp)	#, slot_max
# ../source/app.c:358:         int slot_cur = 0; 
	movl	$0, -20(%rbp)	#, slot_cur
# ../source/app.c:360:         while (slot_cur < slot_max) {
	jmp	.L55	#
.L59:
# ../source/app.c:362:           if (output->buttons_down[slot_cur] == 0 && slot_free == -1)
	movq	-288(%rbp), %rax	# output, tmp165
	movl	-20(%rbp), %edx	# slot_cur, tmp167
	movslq	%edx, %rdx	# tmp167, tmp166
	addq	$16, %rdx	#, tmp168
	movl	12(%rax,%rdx,4), %eax	# output_60(D)->buttons_down[slot_cur_47], _29
# ../source/app.c:362:           if (output->buttons_down[slot_cur] == 0 && slot_free == -1)
	testl	%eax, %eax	# _29
	jne	.L56	#,
# ../source/app.c:362:           if (output->buttons_down[slot_cur] == 0 && slot_free == -1)
	cmpl	$-1, -16(%rbp)	#, slot_free
	jne	.L56	#,
# ../source/app.c:363:             slot_free = slot_cur;
	movl	-20(%rbp), %eax	# slot_cur, tmp169
	movl	%eax, -16(%rbp)	# tmp169, slot_free
	jmp	.L57	#
.L56:
# ../source/app.c:365:           else if (output->buttons_down[slot_cur] == button) {
	movq	-288(%rbp), %rax	# output, tmp170
	movl	-20(%rbp), %edx	# slot_cur, tmp172
	movslq	%edx, %rdx	# tmp172, tmp171
	addq	$16, %rdx	#, tmp173
	movl	12(%rax,%rdx,4), %eax	# output_60(D)->buttons_down[slot_cur_47], _30
# ../source/app.c:365:           else if (output->buttons_down[slot_cur] == button) {
	cmpl	%eax, -36(%rbp)	# _30, button
	jne	.L57	#,
# ../source/app.c:366:             slot_free = -1;
	movl	$-1, -16(%rbp)	#, slot_free
# ../source/app.c:367:             break;
	jmp	.L58	#
.L57:
# ../source/app.c:370:           ++slot_cur;
	addl	$1, -20(%rbp)	#, slot_cur
.L55:
# ../source/app.c:360:         while (slot_cur < slot_max) {
	movl	-20(%rbp), %eax	# slot_cur, tmp174
	cmpl	-40(%rbp), %eax	# slot_max, tmp174
	jl	.L59	#,
.L58:
# ../source/app.c:374:         if (slot_free != -1) {
	cmpl	$-1, -16(%rbp)	#, slot_free
	je	.L68	#,
# ../source/app.c:375:           output->buttons_down[slot_free] = button;
	movq	-288(%rbp), %rax	# output, tmp175
	movl	-16(%rbp), %edx	# slot_free, tmp177
	movslq	%edx, %rdx	# tmp177, tmp176
	leaq	16(%rdx), %rcx	#, tmp178
	movl	-36(%rbp), %edx	# button, tmp179
	movl	%edx, 12(%rax,%rcx,4)	# tmp179, output_60(D)->buttons_down[slot_free_46]
# ../source/app.c:376:           output->buttons_down_count++;
	movq	-288(%rbp), %rax	# output, tmp180
	movl	72(%rax), %eax	# output_60(D)->buttons_down_count, _31
# ../source/app.c:376:           output->buttons_down_count++;
	leal	1(%rax), %edx	#, _32
	movq	-288(%rbp), %rax	# output, tmp181
	movl	%edx, 72(%rax)	# _32, output_60(D)->buttons_down_count
# ../source/app.c:379:         break;
	jmp	.L68	#
.L40:
# ../source/app.c:385:         int button = event.xbutton.button;
	movl	-188(%rbp), %eax	# event.xbutton.button, _33
# ../source/app.c:385:         int button = event.xbutton.button;
	movl	%eax, -28(%rbp)	# _33, button
# ../source/app.c:387:         int slot_cur = 0;
	movl	$0, -24(%rbp)	#, slot_cur
# ../source/app.c:388:         int slot_max = sizeof(output->buttons_down) / sizeof(output->buttons_down[0]);
	movl	$8, -32(%rbp)	#, slot_max
# ../source/app.c:390:         while (slot_cur < slot_max) {
	jmp	.L61	#
.L64:
# ../source/app.c:392:           if (output->buttons_down[slot_cur] == button) {
	movq	-288(%rbp), %rax	# output, tmp182
	movl	-24(%rbp), %edx	# slot_cur, tmp184
	movslq	%edx, %rdx	# tmp184, tmp183
	addq	$16, %rdx	#, tmp185
	movl	12(%rax,%rdx,4), %eax	# output_60(D)->buttons_down[slot_cur_48], _34
# ../source/app.c:392:           if (output->buttons_down[slot_cur] == button) {
	cmpl	%eax, -28(%rbp)	# _34, button
	jne	.L62	#,
# ../source/app.c:394:             output->buttons_down[slot_cur] = 0;
	movq	-288(%rbp), %rax	# output, tmp186
	movl	-24(%rbp), %edx	# slot_cur, tmp188
	movslq	%edx, %rdx	# tmp188, tmp187
	addq	$16, %rdx	#, tmp189
	movl	$0, 12(%rax,%rdx,4)	#, output_60(D)->buttons_down[slot_cur_48]
# ../source/app.c:395:             output->buttons_down_count--;
	movq	-288(%rbp), %rax	# output, tmp190
	movl	72(%rax), %eax	# output_60(D)->buttons_down_count, _35
# ../source/app.c:395:             output->buttons_down_count--;
	leal	-1(%rax), %edx	#, _36
	movq	-288(%rbp), %rax	# output, tmp191
	movl	%edx, 72(%rax)	# _36, output_60(D)->buttons_down_count
# ../source/app.c:397:             break;
	nop	
# ../source/app.c:404:         break;
	jmp	.L36	#
.L62:
# ../source/app.c:401:           ++slot_cur;
	addl	$1, -24(%rbp)	#, slot_cur
.L61:
# ../source/app.c:390:         while (slot_cur < slot_max) {
	movl	-24(%rbp), %eax	# slot_cur, tmp192
	cmpl	-32(%rbp), %eax	# slot_max, tmp192
	jl	.L64	#,
# ../source/app.c:404:         break;
	jmp	.L36	#
.L38:
# ../source/app.c:411:         output->cursor_x = event.xmotion.x;
	movl	-208(%rbp), %edx	# event.xmotion.x, _37
# ../source/app.c:411:         output->cursor_x = event.xmotion.x;
	movq	-288(%rbp), %rax	# output, tmp193
	movl	%edx, 108(%rax)	# _37, output_60(D)->cursor_x
# ../source/app.c:412:         output->cursor_y = event.xmotion.y;
	movl	-204(%rbp), %edx	# event.xmotion.y, _38
# ../source/app.c:412:         output->cursor_y = event.xmotion.y;
	movq	-288(%rbp), %rax	# output, tmp194
	movl	%edx, 112(%rax)	# _38, output_60(D)->cursor_y
# ../source/app.c:414:         break;
	jmp	.L36	#
.L66:
# ../source/app.c:418:       default: break;
	nop	
	jmp	.L36	#
.L67:
# ../source/app.c:323:         break;
	nop	
	jmp	.L36	#
.L68:
# ../source/app.c:379:         break;
	nop	
.L36:
# ../source/app.c:424:   return 0;
	movl	$0, %eax	#, _96
# ../source/app.c:426: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	xlib_update_window, .-xlib_update_window
	.type	add_vec5, @function
add_vec5:
.LFB16:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# .result_ptr, .result_ptr
# ../source/app.c:441:   v3.x = v1.x + v2.x;
	movss	16(%rbp), %xmm1	# v1.x, _1
# ../source/app.c:441:   v3.x = v1.x + v2.x;
	movss	40(%rbp), %xmm0	# v2.x, _2
# ../source/app.c:441:   v3.x = v1.x + v2.x;
	addss	%xmm1, %xmm0	# _1, _3
# ../source/app.c:441:   v3.x = v1.x + v2.x;
	movss	%xmm0, -32(%rbp)	# _3, v3.x
# ../source/app.c:442:   v3.y = v1.y + v2.y;
	movss	20(%rbp), %xmm1	# v1.y, _4
# ../source/app.c:442:   v3.y = v1.y + v2.y;
	movss	44(%rbp), %xmm0	# v2.y, _5
# ../source/app.c:442:   v3.y = v1.y + v2.y;
	addss	%xmm1, %xmm0	# _4, _6
# ../source/app.c:442:   v3.y = v1.y + v2.y;
	movss	%xmm0, -28(%rbp)	# _6, v3.y
# ../source/app.c:443:   v3.z = v1.z + v2.z;
	movss	24(%rbp), %xmm1	# v1.z, _7
# ../source/app.c:443:   v3.z = v1.z + v2.z;
	movss	48(%rbp), %xmm0	# v2.z, _8
# ../source/app.c:443:   v3.z = v1.z + v2.z;
	addss	%xmm1, %xmm0	# _7, _9
# ../source/app.c:443:   v3.z = v1.z + v2.z;
	movss	%xmm0, -24(%rbp)	# _9, v3.z
# ../source/app.c:444:   v3.u = v1.u + v2.u;
	movss	28(%rbp), %xmm1	# v1.u, _10
# ../source/app.c:444:   v3.u = v1.u + v2.u;
	movss	52(%rbp), %xmm0	# v2.u, _11
# ../source/app.c:444:   v3.u = v1.u + v2.u;
	addss	%xmm1, %xmm0	# _10, _12
# ../source/app.c:444:   v3.u = v1.u + v2.u;
	movss	%xmm0, -20(%rbp)	# _12, v3.u
# ../source/app.c:445:   v3.v = v1.v + v2.v;
	movss	32(%rbp), %xmm1	# v1.v, _13
# ../source/app.c:445:   v3.v = v1.v + v2.v;
	movss	56(%rbp), %xmm0	# v2.v, _14
# ../source/app.c:445:   v3.v = v1.v + v2.v;
	addss	%xmm1, %xmm0	# _13, _15
# ../source/app.c:445:   v3.v = v1.v + v2.v;
	movss	%xmm0, -16(%rbp)	# _15, v3.v
# ../source/app.c:447:   return v3;
	movq	-40(%rbp), %rcx	# .result_ptr, tmp97
	movq	-32(%rbp), %rax	# v3, tmp98
	movq	-24(%rbp), %rdx	# v3,
	movq	%rax, (%rcx)	# tmp98, <retval>
	movq	%rdx, 8(%rcx)	#, <retval>
	movl	-16(%rbp), %eax	# v3, tmp99
	movl	%eax, 16(%rcx)	# tmp99, <retval>
# ../source/app.c:449: }
	movq	-40(%rbp), %rax	# .result_ptr,
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE16:
	.size	add_vec5, .-add_vec5
	.type	sub_vec5, @function
sub_vec5:
.LFB17:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# .result_ptr, .result_ptr
# ../source/app.c:458:   v3.x = v1.x - v2.x;
	movss	16(%rbp), %xmm0	# v1.x, _1
# ../source/app.c:458:   v3.x = v1.x - v2.x;
	movss	40(%rbp), %xmm1	# v2.x, _2
# ../source/app.c:458:   v3.x = v1.x - v2.x;
	subss	%xmm1, %xmm0	# _2, _3
# ../source/app.c:458:   v3.x = v1.x - v2.x;
	movss	%xmm0, -32(%rbp)	# _3, v3.x
# ../source/app.c:459:   v3.y = v1.y - v2.y;
	movss	20(%rbp), %xmm0	# v1.y, _4
# ../source/app.c:459:   v3.y = v1.y - v2.y;
	movss	44(%rbp), %xmm1	# v2.y, _5
# ../source/app.c:459:   v3.y = v1.y - v2.y;
	subss	%xmm1, %xmm0	# _5, _6
# ../source/app.c:459:   v3.y = v1.y - v2.y;
	movss	%xmm0, -28(%rbp)	# _6, v3.y
# ../source/app.c:460:   v3.z = v1.z - v2.z;
	movss	24(%rbp), %xmm0	# v1.z, _7
# ../source/app.c:460:   v3.z = v1.z - v2.z;
	movss	48(%rbp), %xmm1	# v2.z, _8
# ../source/app.c:460:   v3.z = v1.z - v2.z;
	subss	%xmm1, %xmm0	# _8, _9
# ../source/app.c:460:   v3.z = v1.z - v2.z;
	movss	%xmm0, -24(%rbp)	# _9, v3.z
# ../source/app.c:461:   v3.u = v1.u - v2.u;
	movss	28(%rbp), %xmm0	# v1.u, _10
# ../source/app.c:461:   v3.u = v1.u - v2.u;
	movss	52(%rbp), %xmm1	# v2.u, _11
# ../source/app.c:461:   v3.u = v1.u - v2.u;
	subss	%xmm1, %xmm0	# _11, _12
# ../source/app.c:461:   v3.u = v1.u - v2.u;
	movss	%xmm0, -20(%rbp)	# _12, v3.u
# ../source/app.c:462:   v3.v = v1.v - v2.v;
	movss	32(%rbp), %xmm0	# v1.v, _13
# ../source/app.c:462:   v3.v = v1.v - v2.v;
	movss	56(%rbp), %xmm1	# v2.v, _14
# ../source/app.c:462:   v3.v = v1.v - v2.v;
	subss	%xmm1, %xmm0	# _14, _15
# ../source/app.c:462:   v3.v = v1.v - v2.v;
	movss	%xmm0, -16(%rbp)	# _15, v3.v
# ../source/app.c:464:   return v3;
	movq	-40(%rbp), %rcx	# .result_ptr, tmp97
	movq	-32(%rbp), %rax	# v3, tmp98
	movq	-24(%rbp), %rdx	# v3,
	movq	%rax, (%rcx)	# tmp98, <retval>
	movq	%rdx, 8(%rcx)	#, <retval>
	movl	-16(%rbp), %eax	# v3, tmp99
	movl	%eax, 16(%rcx)	# tmp99, <retval>
# ../source/app.c:466: }
	movq	-40(%rbp), %rax	# .result_ptr,
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE17:
	.size	sub_vec5, .-sub_vec5
	.type	scl_vec5, @function
scl_vec5:
.LFB18:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# .result_ptr, .result_ptr
	movss	%xmm0, -44(%rbp)	# sclr, sclr
# ../source/app.c:475:   v2.x = v1.x * sclr;
	movss	16(%rbp), %xmm0	# v1.x, _1
# ../source/app.c:475:   v2.x = v1.x * sclr;
	mulss	-44(%rbp), %xmm0	# sclr, _2
# ../source/app.c:475:   v2.x = v1.x * sclr;
	movss	%xmm0, -32(%rbp)	# _2, v2.x
# ../source/app.c:476:   v2.y = v1.y * sclr;
	movss	20(%rbp), %xmm0	# v1.y, _3
# ../source/app.c:476:   v2.y = v1.y * sclr;
	mulss	-44(%rbp), %xmm0	# sclr, _4
# ../source/app.c:476:   v2.y = v1.y * sclr;
	movss	%xmm0, -28(%rbp)	# _4, v2.y
# ../source/app.c:477:   v2.z = v1.z * sclr;
	movss	24(%rbp), %xmm0	# v1.z, _5
# ../source/app.c:477:   v2.z = v1.z * sclr;
	mulss	-44(%rbp), %xmm0	# sclr, _6
# ../source/app.c:477:   v2.z = v1.z * sclr;
	movss	%xmm0, -24(%rbp)	# _6, v2.z
# ../source/app.c:478:   v2.u = v1.u * sclr;
	movss	28(%rbp), %xmm0	# v1.u, _7
# ../source/app.c:478:   v2.u = v1.u * sclr;
	mulss	-44(%rbp), %xmm0	# sclr, _8
# ../source/app.c:478:   v2.u = v1.u * sclr;
	movss	%xmm0, -20(%rbp)	# _8, v2.u
# ../source/app.c:479:   v2.v = v1.v * sclr;
	movss	32(%rbp), %xmm0	# v1.v, _9
# ../source/app.c:479:   v2.v = v1.v * sclr;
	mulss	-44(%rbp), %xmm0	# sclr, _10
# ../source/app.c:479:   v2.v = v1.v * sclr;
	movss	%xmm0, -16(%rbp)	# _10, v2.v
# ../source/app.c:481:   return v2;
	movq	-40(%rbp), %rcx	# .result_ptr, tmp92
	movq	-32(%rbp), %rax	# v2, tmp93
	movq	-24(%rbp), %rdx	# v2,
	movq	%rax, (%rcx)	# tmp93, <retval>
	movq	%rdx, 8(%rcx)	#, <retval>
	movl	-16(%rbp), %eax	# v2, tmp94
	movl	%eax, 16(%rcx)	# tmp94, <retval>
# ../source/app.c:483: }
	movq	-40(%rbp), %rax	# .result_ptr,
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE18:
	.size	scl_vec5, .-scl_vec5
	.type	rotate_triangle, @function
rotate_triangle:
.LFB20:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$144, %rsp	#,
	movq	%rdi, -120(%rbp)	# t, t
	movss	%xmm0, -124(%rbp)	# degrees_x, degrees_x
	movss	%xmm1, -128(%rbp)	# degrees_y, degrees_y
	movss	%xmm2, -132(%rbp)	# degrees_z, degrees_z
	movss	%xmm3, -136(%rbp)	# origin_x, origin_x
	movss	%xmm4, -140(%rbp)	# origin_y, origin_y
	movss	%xmm5, -144(%rbp)	# origin_z, origin_z
# ../source/app.c:517: 	if (degrees_x > 0.0f && degrees_x < 360.0f) {
	movss	-124(%rbp), %xmm0	# degrees_x, tmp210
	pxor	%xmm1, %xmm1	# tmp211
	comiss	%xmm1, %xmm0	# tmp211, tmp210
	jbe	.L76	#,
# ../source/app.c:517: 	if (degrees_x > 0.0f && degrees_x < 360.0f) {
	movss	.LC2(%rip), %xmm0	#, tmp212
	comiss	-124(%rbp), %xmm0	# degrees_x, tmp212
	jbe	.L76	#,
# ../source/app.c:519: 		t->v1.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp213
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _1
# ../source/app.c:519: 		t->v1.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _2
	movq	-120(%rbp), %rax	# t, tmp214
	movss	%xmm0, 4(%rax)	# _2, t_132(D)->v1.y
# ../source/app.c:520: 		t->v2.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp215
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _3
# ../source/app.c:520: 		t->v2.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _4
	movq	-120(%rbp), %rax	# t, tmp216
	movss	%xmm0, 24(%rax)	# _4, t_132(D)->v2.y
# ../source/app.c:521: 		t->v3.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp217
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _5
# ../source/app.c:521: 		t->v3.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _6
	movq	-120(%rbp), %rax	# t, tmp218
	movss	%xmm0, 44(%rax)	# _6, t_132(D)->v3.y
# ../source/app.c:523: 		t->v1.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp219
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _7
# ../source/app.c:523: 		t->v1.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _8
	movq	-120(%rbp), %rax	# t, tmp220
	movss	%xmm0, 8(%rax)	# _8, t_132(D)->v1.z
# ../source/app.c:524: 		t->v2.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp221
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _9
# ../source/app.c:524: 		t->v2.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _10
	movq	-120(%rbp), %rax	# t, tmp222
	movss	%xmm0, 28(%rax)	# _10, t_132(D)->v2.z
# ../source/app.c:525: 		t->v3.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp223
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _11
# ../source/app.c:525: 		t->v3.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _12
	movq	-120(%rbp), %rax	# t, tmp224
	movss	%xmm0, 48(%rax)	# _12, t_132(D)->v3.z
# ../source/app.c:528: 			rads = 3.14f / 180.0f * degrees_x,
	movss	-124(%rbp), %xmm1	# degrees_x, tmp226
	movss	.LC3(%rip), %xmm0	#, tmp227
	mulss	%xmm1, %xmm0	# tmp226, tmp225
	movss	%xmm0, -4(%rbp)	# tmp225, rads
# ../source/app.c:529: 			cosine = cosf(rads),
	movl	-4(%rbp), %eax	# rads, tmp228
	movd	%eax, %xmm0	# tmp228,
	call	cosf@PLT	#
	movd	%xmm0, %eax	#, tmp229
	movl	%eax, -8(%rbp)	# tmp229, cosine
# ../source/app.c:530: 			sine = sinf(rads);
	movl	-4(%rbp), %eax	# rads, tmp230
	movd	%eax, %xmm0	# tmp230,
	call	sinf@PLT	#
	movd	%xmm0, %eax	#, tmp231
	movl	%eax, -12(%rbp)	# tmp231, sine
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp232
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _13
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	mulss	-8(%rbp), %xmm0	# cosine, _14
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp233
	movss	8(%rax), %xmm1	# t_132(D)->v1.z, _15
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	mulss	-12(%rbp), %xmm1	# sine, _16
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	subss	%xmm1, %xmm0	# _16, tmp234
	movss	%xmm0, -16(%rbp)	# tmp234, ny1
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp235
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _17
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	mulss	-8(%rbp), %xmm0	# cosine, _18
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp236
	movss	28(%rax), %xmm1	# t_132(D)->v2.z, _19
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	mulss	-12(%rbp), %xmm1	# sine, _20
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	subss	%xmm1, %xmm0	# _20, tmp237
	movss	%xmm0, -20(%rbp)	# tmp237, ny2
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp238
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _21
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	mulss	-8(%rbp), %xmm0	# cosine, _22
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp239
	movss	48(%rax), %xmm1	# t_132(D)->v3.z, _23
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	mulss	-12(%rbp), %xmm1	# sine, _24
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	subss	%xmm1, %xmm0	# _24, tmp240
	movss	%xmm0, -24(%rbp)	# tmp240, ny3
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp241
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _25
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	movaps	%xmm0, %xmm1	# _25, _25
	mulss	-12(%rbp), %xmm1	# sine, _25
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp242
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _27
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	mulss	-8(%rbp), %xmm0	# cosine, _28
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	addss	%xmm1, %xmm0	# _26, tmp243
	movss	%xmm0, -28(%rbp)	# tmp243, nz1
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp244
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _29
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	movaps	%xmm0, %xmm1	# _29, _29
	mulss	-12(%rbp), %xmm1	# sine, _29
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp245
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _31
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	mulss	-8(%rbp), %xmm0	# cosine, _32
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	addss	%xmm1, %xmm0	# _30, tmp246
	movss	%xmm0, -32(%rbp)	# tmp246, nz2
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp247
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _33
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	movaps	%xmm0, %xmm1	# _33, _33
	mulss	-12(%rbp), %xmm1	# sine, _33
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp248
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _35
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	mulss	-8(%rbp), %xmm0	# cosine, _36
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	addss	%xmm1, %xmm0	# _34, tmp249
	movss	%xmm0, -36(%rbp)	# tmp249, nz3
# ../source/app.c:542: 		t->v1.y = ny1 + origin_y;
	movss	-16(%rbp), %xmm0	# ny1, tmp250
	addss	-140(%rbp), %xmm0	# origin_y, _37
# ../source/app.c:542: 		t->v1.y = ny1 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp251
	movss	%xmm0, 4(%rax)	# _37, t_132(D)->v1.y
# ../source/app.c:543: 		t->v2.y = ny2 + origin_y;
	movss	-20(%rbp), %xmm0	# ny2, tmp252
	addss	-140(%rbp), %xmm0	# origin_y, _38
# ../source/app.c:543: 		t->v2.y = ny2 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp253
	movss	%xmm0, 24(%rax)	# _38, t_132(D)->v2.y
# ../source/app.c:544: 		t->v3.y = ny3 + origin_y;
	movss	-24(%rbp), %xmm0	# ny3, tmp254
	addss	-140(%rbp), %xmm0	# origin_y, _39
# ../source/app.c:544: 		t->v3.y = ny3 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp255
	movss	%xmm0, 44(%rax)	# _39, t_132(D)->v3.y
# ../source/app.c:546: 		t->v1.z = nz1 + origin_z;
	movss	-28(%rbp), %xmm0	# nz1, tmp256
	addss	-144(%rbp), %xmm0	# origin_z, _40
# ../source/app.c:546: 		t->v1.z = nz1 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp257
	movss	%xmm0, 8(%rax)	# _40, t_132(D)->v1.z
# ../source/app.c:547: 		t->v2.z = nz2 + origin_z;
	movss	-32(%rbp), %xmm0	# nz2, tmp258
	addss	-144(%rbp), %xmm0	# origin_z, _41
# ../source/app.c:547: 		t->v2.z = nz2 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp259
	movss	%xmm0, 28(%rax)	# _41, t_132(D)->v2.z
# ../source/app.c:548: 		t->v3.z = nz3 + origin_z;
	movss	-36(%rbp), %xmm0	# nz3, tmp260
	addss	-144(%rbp), %xmm0	# origin_z, _42
# ../source/app.c:548: 		t->v3.z = nz3 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp261
	movss	%xmm0, 48(%rax)	# _42, t_132(D)->v3.z
.L76:
# ../source/app.c:552: 	if (degrees_y > 0.0f && degrees_y < 360.0f) {
	movss	-128(%rbp), %xmm0	# degrees_y, tmp262
	pxor	%xmm1, %xmm1	# tmp263
	comiss	%xmm1, %xmm0	# tmp263, tmp262
	jbe	.L79	#,
# ../source/app.c:552: 	if (degrees_y > 0.0f && degrees_y < 360.0f) {
	movss	.LC2(%rip), %xmm0	#, tmp264
	comiss	-128(%rbp), %xmm0	# degrees_y, tmp264
	jbe	.L79	#,
# ../source/app.c:554: 		t->v1.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp265
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _43
# ../source/app.c:554: 		t->v1.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _44
	movq	-120(%rbp), %rax	# t, tmp266
	movss	%xmm0, (%rax)	# _44, t_132(D)->v1.x
# ../source/app.c:555: 		t->v2.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp267
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _45
# ../source/app.c:555: 		t->v2.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _46
	movq	-120(%rbp), %rax	# t, tmp268
	movss	%xmm0, 20(%rax)	# _46, t_132(D)->v2.x
# ../source/app.c:556: 		t->v3.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp269
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _47
# ../source/app.c:556: 		t->v3.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _48
	movq	-120(%rbp), %rax	# t, tmp270
	movss	%xmm0, 40(%rax)	# _48, t_132(D)->v3.x
# ../source/app.c:558: 		t->v1.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp271
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _49
# ../source/app.c:558: 		t->v1.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _50
	movq	-120(%rbp), %rax	# t, tmp272
	movss	%xmm0, 8(%rax)	# _50, t_132(D)->v1.z
# ../source/app.c:559: 		t->v2.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp273
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _51
# ../source/app.c:559: 		t->v2.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _52
	movq	-120(%rbp), %rax	# t, tmp274
	movss	%xmm0, 28(%rax)	# _52, t_132(D)->v2.z
# ../source/app.c:560: 		t->v3.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp275
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _53
# ../source/app.c:560: 		t->v3.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _54
	movq	-120(%rbp), %rax	# t, tmp276
	movss	%xmm0, 48(%rax)	# _54, t_132(D)->v3.z
# ../source/app.c:563: 			rads = 3.14f / 180.0f * degrees_y,
	movss	-128(%rbp), %xmm1	# degrees_y, tmp278
	movss	.LC3(%rip), %xmm0	#, tmp279
	mulss	%xmm1, %xmm0	# tmp278, tmp277
	movss	%xmm0, -40(%rbp)	# tmp277, rads
# ../source/app.c:564: 			cosine = cosf(rads),
	movl	-40(%rbp), %eax	# rads, tmp280
	movd	%eax, %xmm0	# tmp280,
	call	cosf@PLT	#
	movd	%xmm0, %eax	#, tmp281
	movl	%eax, -44(%rbp)	# tmp281, cosine
# ../source/app.c:565: 			sine = sinf(rads);
	movl	-40(%rbp), %eax	# rads, tmp282
	movd	%eax, %xmm0	# tmp282,
	call	sinf@PLT	#
	movd	%xmm0, %eax	#, tmp283
	movl	%eax, -48(%rbp)	# tmp283, sine
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp284
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _55
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	movaps	%xmm0, %xmm1	# _55, _55
	mulss	-44(%rbp), %xmm1	# cosine, _55
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp285
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _57
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	mulss	-48(%rbp), %xmm0	# sine, _58
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	addss	%xmm1, %xmm0	# _56, tmp286
	movss	%xmm0, -52(%rbp)	# tmp286, nx1
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp287
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _59
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	movaps	%xmm0, %xmm1	# _59, _59
	mulss	-44(%rbp), %xmm1	# cosine, _59
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp288
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _61
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	mulss	-48(%rbp), %xmm0	# sine, _62
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	addss	%xmm1, %xmm0	# _60, tmp289
	movss	%xmm0, -56(%rbp)	# tmp289, nx2
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp290
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _63
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	movaps	%xmm0, %xmm1	# _63, _63
	mulss	-44(%rbp), %xmm1	# cosine, _63
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp291
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _65
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	mulss	-48(%rbp), %xmm0	# sine, _66
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	addss	%xmm1, %xmm0	# _64, tmp292
	movss	%xmm0, -60(%rbp)	# tmp292, nx3
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	movq	-120(%rbp), %rax	# t, tmp293
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _67
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	mulss	-44(%rbp), %xmm0	# cosine, _68
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	movq	-120(%rbp), %rax	# t, tmp294
	movss	(%rax), %xmm1	# t_132(D)->v1.x, _69
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	mulss	-48(%rbp), %xmm1	# sine, _70
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	subss	%xmm1, %xmm0	# _70, tmp295
	movss	%xmm0, -64(%rbp)	# tmp295, nz1
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	movq	-120(%rbp), %rax	# t, tmp296
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _71
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	mulss	-44(%rbp), %xmm0	# cosine, _72
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	movq	-120(%rbp), %rax	# t, tmp297
	movss	20(%rax), %xmm1	# t_132(D)->v2.x, _73
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	mulss	-48(%rbp), %xmm1	# sine, _74
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	subss	%xmm1, %xmm0	# _74, tmp298
	movss	%xmm0, -68(%rbp)	# tmp298, nz2
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	movq	-120(%rbp), %rax	# t, tmp299
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _75
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	mulss	-44(%rbp), %xmm0	# cosine, _76
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	movq	-120(%rbp), %rax	# t, tmp300
	movss	40(%rax), %xmm1	# t_132(D)->v3.x, _77
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	mulss	-48(%rbp), %xmm1	# sine, _78
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	subss	%xmm1, %xmm0	# _78, tmp301
	movss	%xmm0, -72(%rbp)	# tmp301, nz3
# ../source/app.c:577: 		t->v1.x = nx1 + origin_x;
	movss	-52(%rbp), %xmm0	# nx1, tmp302
	addss	-136(%rbp), %xmm0	# origin_x, _79
# ../source/app.c:577: 		t->v1.x = nx1 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp303
	movss	%xmm0, (%rax)	# _79, t_132(D)->v1.x
# ../source/app.c:578: 		t->v2.x = nx2 + origin_x;
	movss	-56(%rbp), %xmm0	# nx2, tmp304
	addss	-136(%rbp), %xmm0	# origin_x, _80
# ../source/app.c:578: 		t->v2.x = nx2 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp305
	movss	%xmm0, 20(%rax)	# _80, t_132(D)->v2.x
# ../source/app.c:579: 		t->v3.x = nx3 + origin_x;
	movss	-60(%rbp), %xmm0	# nx3, tmp306
	addss	-136(%rbp), %xmm0	# origin_x, _81
# ../source/app.c:579: 		t->v3.x = nx3 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp307
	movss	%xmm0, 40(%rax)	# _81, t_132(D)->v3.x
# ../source/app.c:581: 		t->v1.z = nz1 + origin_z;
	movss	-64(%rbp), %xmm0	# nz1, tmp308
	addss	-144(%rbp), %xmm0	# origin_z, _82
# ../source/app.c:581: 		t->v1.z = nz1 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp309
	movss	%xmm0, 8(%rax)	# _82, t_132(D)->v1.z
# ../source/app.c:582: 		t->v2.z = nz2 + origin_z;
	movss	-68(%rbp), %xmm0	# nz2, tmp310
	addss	-144(%rbp), %xmm0	# origin_z, _83
# ../source/app.c:582: 		t->v2.z = nz2 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp311
	movss	%xmm0, 28(%rax)	# _83, t_132(D)->v2.z
# ../source/app.c:583: 		t->v3.z = nz3 + origin_z;
	movss	-72(%rbp), %xmm0	# nz3, tmp312
	addss	-144(%rbp), %xmm0	# origin_z, _84
# ../source/app.c:583: 		t->v3.z = nz3 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp313
	movss	%xmm0, 48(%rax)	# _84, t_132(D)->v3.z
.L79:
# ../source/app.c:587: 	if (degrees_z > 0.0f && degrees_z < 360.0f) {
	movss	-132(%rbp), %xmm0	# degrees_z, tmp314
	pxor	%xmm1, %xmm1	# tmp315
	comiss	%xmm1, %xmm0	# tmp315, tmp314
	jbe	.L82	#,
# ../source/app.c:587: 	if (degrees_z > 0.0f && degrees_z < 360.0f) {
	movss	.LC2(%rip), %xmm0	#, tmp316
	comiss	-132(%rbp), %xmm0	# degrees_z, tmp316
	jbe	.L82	#,
# ../source/app.c:589: 		t->v1.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp317
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _85
# ../source/app.c:589: 		t->v1.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _86
	movq	-120(%rbp), %rax	# t, tmp318
	movss	%xmm0, (%rax)	# _86, t_132(D)->v1.x
# ../source/app.c:590: 		t->v2.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp319
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _87
# ../source/app.c:590: 		t->v2.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _88
	movq	-120(%rbp), %rax	# t, tmp320
	movss	%xmm0, 20(%rax)	# _88, t_132(D)->v2.x
# ../source/app.c:591: 		t->v3.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp321
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _89
# ../source/app.c:591: 		t->v3.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _90
	movq	-120(%rbp), %rax	# t, tmp322
	movss	%xmm0, 40(%rax)	# _90, t_132(D)->v3.x
# ../source/app.c:593: 		t->v1.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp323
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _91
# ../source/app.c:593: 		t->v1.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _92
	movq	-120(%rbp), %rax	# t, tmp324
	movss	%xmm0, 4(%rax)	# _92, t_132(D)->v1.y
# ../source/app.c:594: 		t->v2.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp325
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _93
# ../source/app.c:594: 		t->v2.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _94
	movq	-120(%rbp), %rax	# t, tmp326
	movss	%xmm0, 24(%rax)	# _94, t_132(D)->v2.y
# ../source/app.c:595: 		t->v3.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp327
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _95
# ../source/app.c:595: 		t->v3.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _96
	movq	-120(%rbp), %rax	# t, tmp328
	movss	%xmm0, 44(%rax)	# _96, t_132(D)->v3.y
# ../source/app.c:598: 			rads = 3.14f / 180.0f * degrees_z,
	movss	-132(%rbp), %xmm1	# degrees_z, tmp330
	movss	.LC3(%rip), %xmm0	#, tmp331
	mulss	%xmm1, %xmm0	# tmp330, tmp329
	movss	%xmm0, -76(%rbp)	# tmp329, rads
# ../source/app.c:599: 			cosine = cosf(rads),
	movl	-76(%rbp), %eax	# rads, tmp332
	movd	%eax, %xmm0	# tmp332,
	call	cosf@PLT	#
	movd	%xmm0, %eax	#, tmp333
	movl	%eax, -80(%rbp)	# tmp333, cosine
# ../source/app.c:600: 			sine = sinf(rads);
	movl	-76(%rbp), %eax	# rads, tmp334
	movd	%eax, %xmm0	# tmp334,
	call	sinf@PLT	#
	movd	%xmm0, %eax	#, tmp335
	movl	%eax, -84(%rbp)	# tmp335, sine
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp336
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _97
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	mulss	-80(%rbp), %xmm0	# cosine, _98
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp337
	movss	4(%rax), %xmm1	# t_132(D)->v1.y, _99
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	mulss	-84(%rbp), %xmm1	# sine, _100
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	subss	%xmm1, %xmm0	# _100, tmp338
	movss	%xmm0, -88(%rbp)	# tmp338, nx1
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp339
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _101
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	mulss	-80(%rbp), %xmm0	# cosine, _102
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp340
	movss	24(%rax), %xmm1	# t_132(D)->v2.y, _103
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	mulss	-84(%rbp), %xmm1	# sine, _104
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	subss	%xmm1, %xmm0	# _104, tmp341
	movss	%xmm0, -92(%rbp)	# tmp341, nx2
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp342
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _105
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	mulss	-80(%rbp), %xmm0	# cosine, _106
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp343
	movss	44(%rax), %xmm1	# t_132(D)->v3.y, _107
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	mulss	-84(%rbp), %xmm1	# sine, _108
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	subss	%xmm1, %xmm0	# _108, tmp344
	movss	%xmm0, -96(%rbp)	# tmp344, nx3
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp345
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _109
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	movaps	%xmm0, %xmm1	# _109, _109
	mulss	-84(%rbp), %xmm1	# sine, _109
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp346
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _111
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	mulss	-80(%rbp), %xmm0	# cosine, _112
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	addss	%xmm1, %xmm0	# _110, tmp347
	movss	%xmm0, -100(%rbp)	# tmp347, ny1
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp348
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _113
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	movaps	%xmm0, %xmm1	# _113, _113
	mulss	-84(%rbp), %xmm1	# sine, _113
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp349
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _115
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	mulss	-80(%rbp), %xmm0	# cosine, _116
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	addss	%xmm1, %xmm0	# _114, tmp350
	movss	%xmm0, -104(%rbp)	# tmp350, ny2
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp351
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _117
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	movaps	%xmm0, %xmm1	# _117, _117
	mulss	-84(%rbp), %xmm1	# sine, _117
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp352
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _119
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	mulss	-80(%rbp), %xmm0	# cosine, _120
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	addss	%xmm1, %xmm0	# _118, tmp353
	movss	%xmm0, -108(%rbp)	# tmp353, ny3
# ../source/app.c:612: 		t->v1.x = nx1 + origin_x;
	movss	-88(%rbp), %xmm0	# nx1, tmp354
	addss	-136(%rbp), %xmm0	# origin_x, _121
# ../source/app.c:612: 		t->v1.x = nx1 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp355
	movss	%xmm0, (%rax)	# _121, t_132(D)->v1.x
# ../source/app.c:613: 		t->v2.x = nx2 + origin_x;
	movss	-92(%rbp), %xmm0	# nx2, tmp356
	addss	-136(%rbp), %xmm0	# origin_x, _122
# ../source/app.c:613: 		t->v2.x = nx2 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp357
	movss	%xmm0, 20(%rax)	# _122, t_132(D)->v2.x
# ../source/app.c:614: 		t->v3.x = nx3 + origin_x;
	movss	-96(%rbp), %xmm0	# nx3, tmp358
	addss	-136(%rbp), %xmm0	# origin_x, _123
# ../source/app.c:614: 		t->v3.x = nx3 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp359
	movss	%xmm0, 40(%rax)	# _123, t_132(D)->v3.x
# ../source/app.c:616: 		t->v1.y = ny1 + origin_y;
	movss	-100(%rbp), %xmm0	# ny1, tmp360
	addss	-140(%rbp), %xmm0	# origin_y, _124
# ../source/app.c:616: 		t->v1.y = ny1 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp361
	movss	%xmm0, 4(%rax)	# _124, t_132(D)->v1.y
# ../source/app.c:617: 		t->v2.y = ny2 + origin_y;
	movss	-104(%rbp), %xmm0	# ny2, tmp362
	addss	-140(%rbp), %xmm0	# origin_y, _125
# ../source/app.c:617: 		t->v2.y = ny2 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp363
	movss	%xmm0, 24(%rax)	# _125, t_132(D)->v2.y
# ../source/app.c:618: 		t->v3.y = ny3 + origin_y;
	movss	-108(%rbp), %xmm0	# ny3, tmp364
	addss	-140(%rbp), %xmm0	# origin_y, _126
# ../source/app.c:618: 		t->v3.y = ny3 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp365
	movss	%xmm0, 44(%rax)	# _126, t_132(D)->v3.y
.L82:
# ../source/app.c:622:   return 0;
	movl	$0, %eax	#, _201
# ../source/app.c:624: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE20:
	.size	rotate_triangle, .-rotate_triangle
	.type	get_triangle_area, @function
get_triangle_area:
.LFB21:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# t, t
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp101
	movss	(%rax), %xmm1	# t_20(D)->v1.x, _1
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp102
	movss	24(%rax), %xmm0	# t_20(D)->v2.y, _2
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp103
	movss	44(%rax), %xmm2	# t_20(D)->v3.y, _3
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	subss	%xmm2, %xmm0	# _3, _4
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	mulss	%xmm0, %xmm1	# _4, _5
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp104
	movss	20(%rax), %xmm2	# t_20(D)->v2.x, _6
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp105
	movss	44(%rax), %xmm0	# t_20(D)->v3.y, _7
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp106
	movss	4(%rax), %xmm3	# t_20(D)->v1.y, _8
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	subss	%xmm3, %xmm0	# _8, _9
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	mulss	%xmm2, %xmm0	# _6, _10
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	addss	%xmm0, %xmm1	# _10, _11
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp107
	movss	40(%rax), %xmm2	# t_20(D)->v3.x, _12
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp108
	movss	4(%rax), %xmm0	# t_20(D)->v1.y, _13
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp109
	movss	24(%rax), %xmm3	# t_20(D)->v2.y, _14
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	subss	%xmm3, %xmm0	# _14, _15
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	mulss	%xmm2, %xmm0	# _12, _16
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	addss	%xmm0, %xmm1	# _16, _17
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movss	.LC4(%rip), %xmm0	#, tmp111
	mulss	%xmm1, %xmm0	# _17, tmp110
	movss	%xmm0, -4(%rbp)	# tmp110, res
# ../source/app.c:630: 	if (res < 0) res = -res;
	pxor	%xmm0, %xmm0	# tmp112
	comiss	-4(%rbp), %xmm0	# res, tmp112
	jbe	.L93	#,
# ../source/app.c:630: 	if (res < 0) res = -res;
	movss	-4(%rbp), %xmm0	# res, tmp114
	movss	.LC5(%rip), %xmm1	#, tmp115
	xorps	%xmm1, %xmm0	# tmp115, tmp113
	movss	%xmm0, -4(%rbp)	# tmp113, res
.L93:
# ../source/app.c:632: 	return res;
	movss	-4(%rbp), %xmm0	# res, _23
# ../source/app.c:634: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE21:
	.size	get_triangle_area, .-get_triangle_area
	.type	get_bary_ratio, @function
get_bary_ratio:
.LFB22:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$256, %rsp	#,
	movq	%rdi, -232(%rbp)	# t, t
	movq	%rsi, -240(%rbp)	# v, v
	movq	%rdx, -248(%rbp)	# output, output
# ../source/app.c:646: 	if (t == 0 || v == 0 || output == 0)
	cmpq	$0, -232(%rbp)	#, t
	je	.L98	#,
# ../source/app.c:646: 	if (t == 0 || v == 0 || output == 0)
	cmpq	$0, -240(%rbp)	#, v
	je	.L98	#,
# ../source/app.c:646: 	if (t == 0 || v == 0 || output == 0)
	cmpq	$0, -248(%rbp)	#, output
	jne	.L99	#,
.L98:
# ../source/app.c:647: 	  return 1;
	movl	$1, %eax	#, _7
	jmp	.L103	#
.L99:
# ../source/app.c:649: 	float all = get_triangle_area(t);
	movq	-232(%rbp), %rax	# t, tmp90
	movq	%rax, %rdi	# tmp90,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, tmp91
	movl	%eax, -4(%rbp)	# tmp91, all
# ../source/app.c:651: 	if (all == 0)
	pxor	%xmm0, %xmm0	# tmp92
	ucomiss	-4(%rbp), %xmm0	# all, tmp92
	jp	.L101	#,
	pxor	%xmm0, %xmm0	# tmp93
	ucomiss	-4(%rbp), %xmm0	# all, tmp93
	jne	.L101	#,
# ../source/app.c:652: 	  return 2;
	movl	$2, %eax	#, _7
	jmp	.L103	#
.L101:
# ../source/app.c:655: 	  t1 = {*v, t->v2, t->v3},
	movq	-240(%rbp), %rcx	# v, tmp94
	movq	(%rcx), %rax	# *v_10(D), tmp95
	movq	8(%rcx), %rdx	# *v_10(D),
	movq	%rax, -80(%rbp)	# tmp95, t1.v1
	movq	%rdx, -72(%rbp)	#, t1.v1
	movl	16(%rcx), %eax	# *v_10(D), tmp96
	movl	%eax, -64(%rbp)	# tmp96, t1.v1
	movq	-232(%rbp), %rcx	# t, tmp97
	movq	20(%rcx), %rax	# t_9(D)->v2, tmp98
	movq	28(%rcx), %rdx	# t_9(D)->v2,
	movq	%rax, -60(%rbp)	# tmp98, t1.v2
	movq	%rdx, -52(%rbp)	#, t1.v2
	movl	36(%rcx), %eax	# t_9(D)->v2, tmp99
	movl	%eax, -44(%rbp)	# tmp99, t1.v2
	movq	-232(%rbp), %rcx	# t, tmp100
	movq	40(%rcx), %rax	# t_9(D)->v3, tmp101
	movq	48(%rcx), %rdx	# t_9(D)->v3,
	movq	%rax, -40(%rbp)	# tmp101, t1.v3
	movq	%rdx, -32(%rbp)	#, t1.v3
	movl	56(%rcx), %eax	# t_9(D)->v3, tmp102
	movl	%eax, -24(%rbp)	# tmp102, t1.v3
# ../source/app.c:656: 	  t2 = {t->v1, *v, t->v3},
	movq	-232(%rbp), %rcx	# t, tmp103
	movq	(%rcx), %rax	# t_9(D)->v1, tmp104
	movq	8(%rcx), %rdx	# t_9(D)->v1,
	movq	%rax, -144(%rbp)	# tmp104, t2.v1
	movq	%rdx, -136(%rbp)	#, t2.v1
	movl	16(%rcx), %eax	# t_9(D)->v1, tmp105
	movl	%eax, -128(%rbp)	# tmp105, t2.v1
	movq	-240(%rbp), %rcx	# v, tmp106
	movq	(%rcx), %rax	# *v_10(D), tmp107
	movq	8(%rcx), %rdx	# *v_10(D),
	movq	%rax, -124(%rbp)	# tmp107, t2.v2
	movq	%rdx, -116(%rbp)	#, t2.v2
	movl	16(%rcx), %eax	# *v_10(D), tmp108
	movl	%eax, -108(%rbp)	# tmp108, t2.v2
	movq	-232(%rbp), %rcx	# t, tmp109
	movq	40(%rcx), %rax	# t_9(D)->v3, tmp110
	movq	48(%rcx), %rdx	# t_9(D)->v3,
	movq	%rax, -104(%rbp)	# tmp110, t2.v3
	movq	%rdx, -96(%rbp)	#, t2.v3
	movl	56(%rcx), %eax	# t_9(D)->v3, tmp111
	movl	%eax, -88(%rbp)	# tmp111, t2.v3
# ../source/app.c:657: 		t3 = {t->v1, t->v2, *v};
	movq	-232(%rbp), %rcx	# t, tmp112
	movq	(%rcx), %rax	# t_9(D)->v1, tmp113
	movq	8(%rcx), %rdx	# t_9(D)->v1,
	movq	%rax, -208(%rbp)	# tmp113, t3.v1
	movq	%rdx, -200(%rbp)	#, t3.v1
	movl	16(%rcx), %eax	# t_9(D)->v1, tmp114
	movl	%eax, -192(%rbp)	# tmp114, t3.v1
	movq	-232(%rbp), %rcx	# t, tmp115
	movq	20(%rcx), %rax	# t_9(D)->v2, tmp116
	movq	28(%rcx), %rdx	# t_9(D)->v2,
	movq	%rax, -188(%rbp)	# tmp116, t3.v2
	movq	%rdx, -180(%rbp)	#, t3.v2
	movl	36(%rcx), %eax	# t_9(D)->v2, tmp117
	movl	%eax, -172(%rbp)	# tmp117, t3.v2
	movq	-240(%rbp), %rcx	# v, tmp118
	movq	(%rcx), %rax	# *v_10(D), tmp119
	movq	8(%rcx), %rdx	# *v_10(D),
	movq	%rax, -168(%rbp)	# tmp119, t3.v3
	movq	%rdx, -160(%rbp)	#, t3.v3
	movl	16(%rcx), %eax	# *v_10(D), tmp120
	movl	%eax, -152(%rbp)	# tmp120, t3.v3
# ../source/app.c:659: 	float r = 1.0f / all;
	movss	.LC6(%rip), %xmm0	#, tmp122
	divss	-4(%rbp), %xmm0	# all, tmp121
	movss	%xmm0, -8(%rbp)	# tmp121, r
# ../source/app.c:661: 	struct barycentric_ratio ret = {0};
	movq	$0, -220(%rbp)	#, ret
	movl	$0, -212(%rbp)	#, ret
# ../source/app.c:663: 	ret.r1 = get_triangle_area(&t1) * r,
	leaq	-80(%rbp), %rax	#, tmp123
	movq	%rax, %rdi	# tmp123,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, _1
# ../source/app.c:663: 	ret.r1 = get_triangle_area(&t1) * r,
	movd	%eax, %xmm0	# _1, _1
	mulss	-8(%rbp), %xmm0	# r, _1
# ../source/app.c:663: 	ret.r1 = get_triangle_area(&t1) * r,
	movss	%xmm0, -220(%rbp)	# _2, ret.r1
# ../source/app.c:664: 	ret.r2 = get_triangle_area(&t2) * r,
	leaq	-144(%rbp), %rax	#, tmp124
	movq	%rax, %rdi	# tmp124,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, _3
# ../source/app.c:664: 	ret.r2 = get_triangle_area(&t2) * r,
	movd	%eax, %xmm0	# _3, _3
	mulss	-8(%rbp), %xmm0	# r, _3
# ../source/app.c:664: 	ret.r2 = get_triangle_area(&t2) * r,
	movss	%xmm0, -216(%rbp)	# _4, ret.r2
# ../source/app.c:665: 	ret.r3 = get_triangle_area(&t3) * r;
	leaq	-208(%rbp), %rax	#, tmp125
	movq	%rax, %rdi	# tmp125,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, _5
# ../source/app.c:665: 	ret.r3 = get_triangle_area(&t3) * r;
	movd	%eax, %xmm0	# _5, _5
	mulss	-8(%rbp), %xmm0	# r, _5
# ../source/app.c:665: 	ret.r3 = get_triangle_area(&t3) * r;
	movss	%xmm0, -212(%rbp)	# _6, ret.r3
# ../source/app.c:667: 	*output = ret;
	movq	-248(%rbp), %rax	# output, tmp126
	movq	-220(%rbp), %rdx	# ret, tmp127
	movq	%rdx, (%rax)	# tmp127, *output_11(D)
	movl	-212(%rbp), %edx	# ret, tmp128
	movl	%edx, 8(%rax)	# tmp128, *output_11(D)
# ../source/app.c:669: 	return 0;
	movl	$0, %eax	#, _7
.L103:
# ../source/app.c:671: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE22:
	.size	get_bary_ratio, .-get_bary_ratio
	.type	triangle_obscured, @function
triangle_obscured:
.LFB23:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movq	%rdi, -56(%rbp)	# t1, t1
	movq	%rsi, -64(%rbp)	# t2, t2
	movq	%rdx, -72(%rbp)	# output, output
# ../source/app.c:685: 	if (get_bary_ratio(t1, &t2->v1, &v1) != 0)
	movq	-64(%rbp), %rcx	# t2, _1
	leaq	-12(%rbp), %rdx	#, tmp129
	movq	-56(%rbp), %rax	# t1, tmp130
	movq	%rcx, %rsi	# _1,
	movq	%rax, %rdi	# tmp130,
	call	get_bary_ratio	#
# ../source/app.c:685: 	if (get_bary_ratio(t1, &t2->v1, &v1) != 0)
	testl	%eax, %eax	# _2
	je	.L106	#,
# ../source/app.c:686: 	  return 1;
	movl	$1, %eax	#, _43
	jmp	.L137	#
.L106:
# ../source/app.c:688: 	else if (get_bary_ratio(t1, &t2->v2, &v2) != 0)
	movq	-64(%rbp), %rax	# t2, tmp131
	leaq	20(%rax), %rcx	#, _3
	leaq	-24(%rbp), %rdx	#, tmp132
	movq	-56(%rbp), %rax	# t1, tmp133
	movq	%rcx, %rsi	# _3,
	movq	%rax, %rdi	# tmp133,
	call	get_bary_ratio	#
# ../source/app.c:688: 	else if (get_bary_ratio(t1, &t2->v2, &v2) != 0)
	testl	%eax, %eax	# _4
	je	.L108	#,
# ../source/app.c:689: 	  return 2;
	movl	$2, %eax	#, _43
	jmp	.L137	#
.L108:
# ../source/app.c:691: 	else if (get_bary_ratio(t1, &t2->v3, &v3))
	movq	-64(%rbp), %rax	# t2, tmp134
	leaq	40(%rax), %rcx	#, _5
	leaq	-36(%rbp), %rdx	#, tmp135
	movq	-56(%rbp), %rax	# t1, tmp136
	movq	%rcx, %rsi	# _5,
	movq	%rax, %rdi	# tmp136,
	call	get_bary_ratio	#
# ../source/app.c:691: 	else if (get_bary_ratio(t1, &t2->v3, &v3))
	testl	%eax, %eax	# _6
	je	.L109	#,
# ../source/app.c:692: 	  return 3;
	movl	$3, %eax	#, _43
	jmp	.L137	#
.L109:
# ../source/app.c:694: 	struct vertices_obscured ret = {0};
	movw	$0, -39(%rbp)	#, ret
	movb	$0, -37(%rbp)	#, ret
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movss	-12(%rbp), %xmm0	# v1.r1, _7
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	pxor	%xmm1, %xmm1	# tmp137
	comiss	%xmm1, %xmm0	# tmp137, _7
	jb	.L110	#,
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movss	-12(%rbp), %xmm1	# v1.r1, _8
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp138
	comiss	%xmm1, %xmm0	# _8, tmp138
	jb	.L110	#,
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	movss	-8(%rbp), %xmm0	# v1.r2, _9
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp139
	comiss	%xmm1, %xmm0	# tmp139, _9
	jb	.L110	#,
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	movss	-8(%rbp), %xmm1	# v1.r2, _10
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp140
	comiss	%xmm1, %xmm0	# _10, tmp140
	jb	.L110	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-4(%rbp), %xmm0	# v1.r3, _11
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp141
	comiss	%xmm1, %xmm0	# tmp141, _11
	jb	.L110	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-4(%rbp), %xmm1	# v1.r3, _12
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm0	#, tmp142
	comiss	%xmm1, %xmm0	# _12, tmp142
	jb	.L110	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-12(%rbp), %xmm1	# v1.r1, _13
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-8(%rbp), %xmm0	# v1.r2, _14
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	addss	%xmm0, %xmm1	# _14, _15
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-4(%rbp), %xmm0	# v1.r3, _16
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	addss	%xmm1, %xmm0	# _15, _17
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm1	#, tmp143
	ucomiss	%xmm1, %xmm0	# tmp143, _17
	jp	.L110	#,
	movss	.LC6(%rip), %xmm1	#, tmp144
	ucomiss	%xmm1, %xmm0	# tmp144, _17
	jne	.L110	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movl	$1, %eax	#, iftmp.15_44
	jmp	.L118	#
.L110:
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movl	$0, %eax	#, iftmp.15_44
.L118:
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movb	%al, -39(%rbp)	# _18, ret.v1
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movss	-24(%rbp), %xmm0	# v2.r1, _19
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	pxor	%xmm1, %xmm1	# tmp145
	comiss	%xmm1, %xmm0	# tmp145, _19
	jb	.L119	#,
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movss	-24(%rbp), %xmm1	# v2.r1, _20
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp146
	comiss	%xmm1, %xmm0	# _20, tmp146
	jb	.L119	#,
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	movss	-20(%rbp), %xmm0	# v2.r2, _21
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp147
	comiss	%xmm1, %xmm0	# tmp147, _21
	jb	.L119	#,
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	movss	-20(%rbp), %xmm1	# v2.r2, _22
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp148
	comiss	%xmm1, %xmm0	# _22, tmp148
	jb	.L119	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-16(%rbp), %xmm0	# v2.r3, _23
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp149
	comiss	%xmm1, %xmm0	# tmp149, _23
	jb	.L119	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-16(%rbp), %xmm1	# v2.r3, _24
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm0	#, tmp150
	comiss	%xmm1, %xmm0	# _24, tmp150
	jb	.L119	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-24(%rbp), %xmm1	# v2.r1, _25
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-20(%rbp), %xmm0	# v2.r2, _26
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	addss	%xmm0, %xmm1	# _26, _27
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-16(%rbp), %xmm0	# v2.r3, _28
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	addss	%xmm1, %xmm0	# _27, _29
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm1	#, tmp151
	ucomiss	%xmm1, %xmm0	# tmp151, _29
	jp	.L119	#,
	movss	.LC6(%rip), %xmm1	#, tmp152
	ucomiss	%xmm1, %xmm0	# tmp152, _29
	jne	.L119	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movl	$1, %eax	#, iftmp.16_45
	jmp	.L127	#
.L119:
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movl	$0, %eax	#, iftmp.16_45
.L127:
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movb	%al, -38(%rbp)	# _30, ret.v2
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movss	-36(%rbp), %xmm0	# v3.r1, _31
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	pxor	%xmm1, %xmm1	# tmp153
	comiss	%xmm1, %xmm0	# tmp153, _31
	jb	.L128	#,
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movss	-36(%rbp), %xmm1	# v3.r1, _32
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp154
	comiss	%xmm1, %xmm0	# _32, tmp154
	jb	.L128	#,
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	movss	-32(%rbp), %xmm0	# v3.r2, _33
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp155
	comiss	%xmm1, %xmm0	# tmp155, _33
	jb	.L128	#,
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	movss	-32(%rbp), %xmm1	# v3.r2, _34
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp156
	comiss	%xmm1, %xmm0	# _34, tmp156
	jb	.L128	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-28(%rbp), %xmm0	# v3.r3, _35
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp157
	comiss	%xmm1, %xmm0	# tmp157, _35
	jb	.L128	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-28(%rbp), %xmm1	# v3.r3, _36
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm0	#, tmp158
	comiss	%xmm1, %xmm0	# _36, tmp158
	jb	.L128	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-36(%rbp), %xmm1	# v3.r1, _37
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-32(%rbp), %xmm0	# v3.r2, _38
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	addss	%xmm0, %xmm1	# _38, _39
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-28(%rbp), %xmm0	# v3.r3, _40
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	addss	%xmm1, %xmm0	# _39, _41
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm1	#, tmp159
	ucomiss	%xmm1, %xmm0	# tmp159, _41
	jp	.L128	#,
	movss	.LC6(%rip), %xmm1	#, tmp160
	ucomiss	%xmm1, %xmm0	# tmp160, _41
	jne	.L128	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movl	$1, %eax	#, iftmp.17_46
	jmp	.L136	#
.L128:
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movl	$0, %eax	#, iftmp.17_46
.L136:
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movb	%al, -37(%rbp)	# _42, ret.v3
# ../source/app.c:708: 	*output = ret;
	movq	-72(%rbp), %rax	# output, tmp161
	movzwl	-39(%rbp), %edx	# ret, tmp162
	movw	%dx, (%rax)	# tmp162, *output_64(D)
	movzbl	-37(%rbp), %edx	# ret, tmp163
	movb	%dl, 2(%rax)	# tmp163, *output_64(D)
# ../source/app.c:710: 	return 0;
	movl	$0, %eax	#, _43
.L137:
# ../source/app.c:712: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE23:
	.size	triangle_obscured, .-triangle_obscured
	.type	draw_triangle, @function
draw_triangle:
.LFB24:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$936, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -888(%rbp)	# t, t
	movl	%esi, -892(%rbp)	# src_width, src_width
	movl	%edx, -896(%rbp)	# src_height, src_height
	movq	%rcx, -904(%rbp)	# src_pixels, src_pixels
	movl	%r8d, -908(%rbp)	# dst_width, dst_width
	movl	%r9d, -912(%rbp)	# dst_height, dst_height
# ../source/app.c:720: 	if (src_pixels == 0 || dst_pixels == 0)
	cmpq	$0, -904(%rbp)	#, src_pixels
	je	.L160	#,
# ../source/app.c:720: 	if (src_pixels == 0 || dst_pixels == 0)
	cmpq	$0, 16(%rbp)	#, dst_pixels
	jne	.L161	#,
.L160:
# ../source/app.c:721: 	  return 1;
	movl	$1, %eax	#, _79
	jmp	.L183	#
.L161:
# ../source/app.c:724: 	  top = t->v1,
	movq	-888(%rbp), %rcx	# t, tmp162
	movq	(%rcx), %rax	# t_93(D)->v1, tmp163
	movq	8(%rcx), %rdx	# t_93(D)->v1,
	movq	%rax, -208(%rbp)	# tmp163, top
	movq	%rdx, -200(%rbp)	#, top
	movl	16(%rcx), %eax	# t_93(D)->v1, tmp164
	movl	%eax, -192(%rbp)	# tmp164, top
# ../source/app.c:725: 	  mid = t->v2,
	movq	-888(%rbp), %rcx	# t, tmp165
	movq	20(%rcx), %rax	# t_93(D)->v2, tmp166
	movq	28(%rcx), %rdx	# t_93(D)->v2,
	movq	%rax, -240(%rbp)	# tmp166, mid
	movq	%rdx, -232(%rbp)	#, mid
	movl	36(%rcx), %eax	# t_93(D)->v2, tmp167
	movl	%eax, -224(%rbp)	# tmp167, mid
# ../source/app.c:726: 	  bot = t->v3;
	movq	-888(%rbp), %rcx	# t, tmp168
	movq	40(%rcx), %rax	# t_93(D)->v3, tmp169
	movq	48(%rcx), %rdx	# t_93(D)->v3,
	movq	%rax, -272(%rbp)	# tmp169, bot
	movq	%rdx, -264(%rbp)	#, bot
	movl	56(%rcx), %eax	# t_93(D)->v3, tmp170
	movl	%eax, -256(%rbp)	# tmp170, bot
# ../source/app.c:728: 	if (top.y < mid.y) {
	movss	-204(%rbp), %xmm1	# top.y, _1
# ../source/app.c:728: 	if (top.y < mid.y) {
	movss	-236(%rbp), %xmm0	# mid.y, _2
# ../source/app.c:728: 	if (top.y < mid.y) {
	comiss	%xmm1, %xmm0	# _1, _2
	jbe	.L163	#,
# ../source/app.c:729: 		struct vec5 temp = top;
	movq	-208(%rbp), %rax	# top, tmp171
	movq	-200(%rbp), %rdx	# top,
	movq	%rax, -496(%rbp)	# tmp171, temp
	movq	%rdx, -488(%rbp)	#, temp
	movl	-192(%rbp), %eax	# top, tmp172
	movl	%eax, -480(%rbp)	# tmp172, temp
# ../source/app.c:730: 		top = mid;
	movq	-240(%rbp), %rax	# mid, tmp173
	movq	-232(%rbp), %rdx	# mid,
	movq	%rax, -208(%rbp)	# tmp173, top
	movq	%rdx, -200(%rbp)	#, top
	movl	-224(%rbp), %eax	# mid, tmp174
	movl	%eax, -192(%rbp)	# tmp174, top
# ../source/app.c:731: 		mid = temp;
	movq	-496(%rbp), %rax	# temp, tmp175
	movq	-488(%rbp), %rdx	# temp,
	movq	%rax, -240(%rbp)	# tmp175, mid
	movq	%rdx, -232(%rbp)	#, mid
	movl	-480(%rbp), %eax	# temp, tmp176
	movl	%eax, -224(%rbp)	# tmp176, mid
.L163:
# ../source/app.c:734: 	if (mid.y < bot.y) {
	movss	-236(%rbp), %xmm1	# mid.y, _3
# ../source/app.c:734: 	if (mid.y < bot.y) {
	movss	-268(%rbp), %xmm0	# bot.y, _4
# ../source/app.c:734: 	if (mid.y < bot.y) {
	comiss	%xmm1, %xmm0	# _3, _4
	jbe	.L165	#,
# ../source/app.c:735: 		struct vec5 temp = mid;
	movq	-240(%rbp), %rax	# mid, tmp177
	movq	-232(%rbp), %rdx	# mid,
	movq	%rax, -528(%rbp)	# tmp177, temp
	movq	%rdx, -520(%rbp)	#, temp
	movl	-224(%rbp), %eax	# mid, tmp178
	movl	%eax, -512(%rbp)	# tmp178, temp
# ../source/app.c:736: 		mid = bot;
	movq	-272(%rbp), %rax	# bot, tmp179
	movq	-264(%rbp), %rdx	# bot,
	movq	%rax, -240(%rbp)	# tmp179, mid
	movq	%rdx, -232(%rbp)	#, mid
	movl	-256(%rbp), %eax	# bot, tmp180
	movl	%eax, -224(%rbp)	# tmp180, mid
# ../source/app.c:737: 		bot = temp;
	movq	-528(%rbp), %rax	# temp, tmp181
	movq	-520(%rbp), %rdx	# temp,
	movq	%rax, -272(%rbp)	# tmp181, bot
	movq	%rdx, -264(%rbp)	#, bot
	movl	-512(%rbp), %eax	# temp, tmp182
	movl	%eax, -256(%rbp)	# tmp182, bot
.L165:
# ../source/app.c:740: 	if (top.y < mid.y) {
	movss	-204(%rbp), %xmm1	# top.y, _5
# ../source/app.c:740: 	if (top.y < mid.y) {
	movss	-236(%rbp), %xmm0	# mid.y, _6
# ../source/app.c:740: 	if (top.y < mid.y) {
	comiss	%xmm1, %xmm0	# _5, _6
	jbe	.L167	#,
# ../source/app.c:741: 	  struct vec5 temp = top;
	movq	-208(%rbp), %rax	# top, tmp183
	movq	-200(%rbp), %rdx	# top,
	movq	%rax, -560(%rbp)	# tmp183, temp
	movq	%rdx, -552(%rbp)	#, temp
	movl	-192(%rbp), %eax	# top, tmp184
	movl	%eax, -544(%rbp)	# tmp184, temp
# ../source/app.c:742: 		top = mid;
	movq	-240(%rbp), %rax	# mid, tmp185
	movq	-232(%rbp), %rdx	# mid,
	movq	%rax, -208(%rbp)	# tmp185, top
	movq	%rdx, -200(%rbp)	#, top
	movl	-224(%rbp), %eax	# mid, tmp186
	movl	%eax, -192(%rbp)	# tmp186, top
# ../source/app.c:743: 		mid = temp;
	movq	-560(%rbp), %rax	# temp, tmp187
	movq	-552(%rbp), %rdx	# temp,
	movq	%rax, -240(%rbp)	# tmp187, mid
	movq	%rdx, -232(%rbp)	#, mid
	movl	-544(%rbp), %eax	# temp, tmp188
	movl	%eax, -224(%rbp)	# tmp188, mid
.L167:
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	movss	-204(%rbp), %xmm0	# top.y, _7
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	movss	-268(%rbp), %xmm1	# bot.y, _8
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	ucomiss	%xmm1, %xmm0	# _8, _7
	jp	.L169	#,
	ucomiss	%xmm1, %xmm0	# _8, _7
	jne	.L169	#,
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	movl	$2, %eax	#, _79
	jmp	.L183	#
.L169:
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movss	-204(%rbp), %xmm0	# top.y, _9
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movss	-268(%rbp), %xmm2	# bot.y, _10
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movaps	%xmm0, %xmm1	# _9, _9
	subss	%xmm2, %xmm1	# _10, _9
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movss	.LC6(%rip), %xmm0	#, tmp189
	divss	%xmm1, %xmm0	# _11, tmp189
	movd	%xmm0, %ebx	# tmp189, _12
	leaq	-176(%rbp), %rsi	#, tmp190
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp191
	movq	-272(%rbp), %rax	# bot, tmp192
	movq	-264(%rbp), %rdx	# bot,
	movq	%rax, (%rcx)	# tmp192,
	movq	%rdx, 8(%rcx)	#,
	movl	-256(%rbp), %eax	# bot, tmp193
	movl	%eax, 16(%rcx)	# tmp193,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp194
	movq	-208(%rbp), %rax	# top, tmp195
	movq	-200(%rbp), %rdx	# top,
	movq	%rax, (%rcx)	# tmp195,
	movq	%rdx, 8(%rcx)	#,
	movl	-192(%rbp), %eax	# top, tmp196
	movl	%eax, 16(%rcx)	# tmp196,
	movq	%rsi, %rdi	# tmp190,
	call	sub_vec5	#
	addq	$48, %rsp	#,
	leaq	-304(%rbp), %rsi	#, tmp197
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp198
	movq	-176(%rbp), %rax	# D.8304, tmp199
	movq	-168(%rbp), %rdx	# D.8304,
	movq	%rax, (%rcx)	# tmp199,
	movq	%rdx, 8(%rcx)	#,
	movl	-160(%rbp), %eax	# D.8304, tmp200
	movl	%eax, 16(%rcx)	# tmp200,
	movd	%ebx, %xmm0	# _12,
	movq	%rsi, %rdi	# tmp197,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movss	-204(%rbp), %xmm0	# top.y, _13
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movss	-236(%rbp), %xmm2	# mid.y, _14
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movaps	%xmm0, %xmm1	# _13, _13
	subss	%xmm2, %xmm1	# _14, _13
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movss	.LC6(%rip), %xmm0	#, tmp201
	divss	%xmm1, %xmm0	# _15, tmp201
	movd	%xmm0, %ebx	# tmp201, _16
	leaq	-144(%rbp), %rsi	#, tmp202
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp203
	movq	-240(%rbp), %rax	# mid, tmp204
	movq	-232(%rbp), %rdx	# mid,
	movq	%rax, (%rcx)	# tmp204,
	movq	%rdx, 8(%rcx)	#,
	movl	-224(%rbp), %eax	# mid, tmp205
	movl	%eax, 16(%rcx)	# tmp205,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp206
	movq	-208(%rbp), %rax	# top, tmp207
	movq	-200(%rbp), %rdx	# top,
	movq	%rax, (%rcx)	# tmp207,
	movq	%rdx, 8(%rcx)	#,
	movl	-192(%rbp), %eax	# top, tmp208
	movl	%eax, 16(%rcx)	# tmp208,
	movq	%rsi, %rdi	# tmp202,
	call	sub_vec5	#
	addq	$48, %rsp	#,
	leaq	-336(%rbp), %rsi	#, tmp209
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp210
	movq	-144(%rbp), %rax	# D.8305, tmp211
	movq	-136(%rbp), %rdx	# D.8305,
	movq	%rax, (%rcx)	# tmp211,
	movq	%rdx, 8(%rcx)	#,
	movl	-128(%rbp), %eax	# D.8305, tmp212
	movl	%eax, 16(%rcx)	# tmp212,
	movd	%ebx, %xmm0	# _16,
	movq	%rsi, %rdi	# tmp209,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movss	-236(%rbp), %xmm0	# mid.y, _17
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movss	-268(%rbp), %xmm2	# bot.y, _18
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movaps	%xmm0, %xmm1	# _17, _17
	subss	%xmm2, %xmm1	# _18, _17
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movss	.LC6(%rip), %xmm0	#, tmp213
	divss	%xmm1, %xmm0	# _19, tmp213
	movd	%xmm0, %ebx	# tmp213, _20
	leaq	-112(%rbp), %rsi	#, tmp214
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp215
	movq	-272(%rbp), %rax	# bot, tmp216
	movq	-264(%rbp), %rdx	# bot,
	movq	%rax, (%rcx)	# tmp216,
	movq	%rdx, 8(%rcx)	#,
	movl	-256(%rbp), %eax	# bot, tmp217
	movl	%eax, 16(%rcx)	# tmp217,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp218
	movq	-240(%rbp), %rax	# mid, tmp219
	movq	-232(%rbp), %rdx	# mid,
	movq	%rax, (%rcx)	# tmp219,
	movq	%rdx, 8(%rcx)	#,
	movl	-224(%rbp), %eax	# mid, tmp220
	movl	%eax, 16(%rcx)	# tmp220,
	movq	%rsi, %rdi	# tmp214,
	call	sub_vec5	#
	addq	$48, %rsp	#,
	leaq	-368(%rbp), %rsi	#, tmp221
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp222
	movq	-112(%rbp), %rax	# D.8306, tmp223
	movq	-104(%rbp), %rdx	# D.8306,
	movq	%rax, (%rcx)	# tmp223,
	movq	%rdx, 8(%rcx)	#,
	movl	-96(%rbp), %eax	# D.8306, tmp224
	movl	%eax, 16(%rcx)	# tmp224,
	movd	%ebx, %xmm0	# _20,
	movq	%rsi, %rdi	# tmp221,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:754:     topbotcur = top,
	movq	-208(%rbp), %rax	# top, tmp225
	movq	-200(%rbp), %rdx	# top,
	movq	%rax, -400(%rbp)	# tmp225, topbotcur
	movq	%rdx, -392(%rbp)	#, topbotcur
	movl	-192(%rbp), %eax	# top, tmp226
	movl	%eax, -384(%rbp)	# tmp226, topbotcur
# ../source/app.c:755:     topmidcur = top,
	movq	-208(%rbp), %rax	# top, tmp227
	movq	-200(%rbp), %rdx	# top,
	movq	%rax, -432(%rbp)	# tmp227, topmidcur
	movq	%rdx, -424(%rbp)	#, topmidcur
	movl	-192(%rbp), %eax	# top, tmp228
	movl	%eax, -416(%rbp)	# tmp228, topmidcur
# ../source/app.c:756:     midbotcur = mid;
	movq	-240(%rbp), %rax	# mid, tmp229
	movq	-232(%rbp), %rdx	# mid,
	movq	%rax, -464(%rbp)	# tmp229, midbotcur
	movq	%rdx, -456(%rbp)	#, midbotcur
	movl	-224(%rbp), %eax	# mid, tmp230
	movl	%eax, -448(%rbp)	# tmp230, midbotcur
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	jmp	.L171	#
.L176:
# ../source/app.c:761: 		  start = topbotcur,
	movq	-400(%rbp), %rax	# topbotcur, tmp231
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, -592(%rbp)	# tmp231, start
	movq	%rdx, -584(%rbp)	#, start
	movl	-384(%rbp), %eax	# topbotcur, tmp232
	movl	%eax, -576(%rbp)	# tmp232, start
# ../source/app.c:762: 		  end   = topmidcur;
	movq	-432(%rbp), %rax	# topmidcur, tmp233
	movq	-424(%rbp), %rdx	# topmidcur,
	movq	%rax, -624(%rbp)	# tmp233, end
	movq	%rdx, -616(%rbp)	#, end
	movl	-416(%rbp), %eax	# topmidcur, tmp234
	movl	%eax, -608(%rbp)	# tmp234, end
# ../source/app.c:764: 		if (end.x < start.x) {
	movss	-624(%rbp), %xmm1	# end.x, _21
# ../source/app.c:764: 		if (end.x < start.x) {
	movss	-592(%rbp), %xmm0	# start.x, _22
# ../source/app.c:764: 		if (end.x < start.x) {
	comiss	%xmm1, %xmm0	# _21, _22
	jbe	.L172	#,
# ../source/app.c:765: 		  struct vec5 temp = end;
	movq	-624(%rbp), %rax	# end, tmp235
	movq	-616(%rbp), %rdx	# end,
	movq	%rax, -720(%rbp)	# tmp235, temp
	movq	%rdx, -712(%rbp)	#, temp
	movl	-608(%rbp), %eax	# end, tmp236
	movl	%eax, -704(%rbp)	# tmp236, temp
# ../source/app.c:766: 		  end   = start;
	movq	-592(%rbp), %rax	# start, tmp237
	movq	-584(%rbp), %rdx	# start,
	movq	%rax, -624(%rbp)	# tmp237, end
	movq	%rdx, -616(%rbp)	#, end
	movl	-576(%rbp), %eax	# start, tmp238
	movl	%eax, -608(%rbp)	# tmp238, end
# ../source/app.c:767: 		  start = temp;
	movq	-720(%rbp), %rax	# temp, tmp239
	movq	-712(%rbp), %rdx	# temp,
	movq	%rax, -592(%rbp)	# tmp239, start
	movq	%rdx, -584(%rbp)	#, start
	movl	-704(%rbp), %eax	# temp, tmp240
	movl	%eax, -576(%rbp)	# tmp240, start
.L172:
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-624(%rbp), %xmm0	# end.x, _23
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-592(%rbp), %xmm2	# start.x, _24
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movaps	%xmm0, %xmm1	# _23, _23
	subss	%xmm2, %xmm1	# _24, _23
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	.LC6(%rip), %xmm0	#, tmp241
	divss	%xmm1, %xmm0	# _25, tmp241
	movd	%xmm0, %ebx	# tmp241, _26
	leaq	-80(%rbp), %rsi	#, tmp242
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp243
	movq	-592(%rbp), %rax	# start, tmp244
	movq	-584(%rbp), %rdx	# start,
	movq	%rax, (%rcx)	# tmp244,
	movq	%rdx, 8(%rcx)	#,
	movl	-576(%rbp), %eax	# start, tmp245
	movl	%eax, 16(%rcx)	# tmp245,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp246
	movq	-624(%rbp), %rax	# end, tmp247
	movq	-616(%rbp), %rdx	# end,
	movq	%rax, (%rcx)	# tmp247,
	movq	%rdx, 8(%rcx)	#,
	movl	-608(%rbp), %eax	# end, tmp248
	movl	%eax, 16(%rcx)	# tmp248,
	movq	%rsi, %rdi	# tmp242,
	call	sub_vec5	#
	addq	$48, %rsp	#,
	leaq	-656(%rbp), %rsi	#, tmp249
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp250
	movq	-80(%rbp), %rax	# D.8309, tmp251
	movq	-72(%rbp), %rdx	# D.8309,
	movq	%rax, (%rcx)	# tmp251,
	movq	%rdx, 8(%rcx)	#,
	movl	-64(%rbp), %eax	# D.8309, tmp252
	movl	%eax, 16(%rcx)	# tmp252,
	movd	%ebx, %xmm0	# _26,
	movq	%rsi, %rdi	# tmp249,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:771: 		struct vec5 startendcur  = start;
	movq	-592(%rbp), %rax	# start, tmp253
	movq	-584(%rbp), %rdx	# start,
	movq	%rax, -688(%rbp)	# tmp253, startendcur
	movq	%rdx, -680(%rbp)	#, startendcur
	movl	-576(%rbp), %eax	# start, tmp254
	movl	%eax, -672(%rbp)	# tmp254, startendcur
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	jmp	.L174	#
.L175:
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-672(%rbp), %xmm0	# startendcur.v, _27
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _27, _28
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-892(%rbp), %eax	# src_width, _28
	movl	%eax, %edx	# _28, _29
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-676(%rbp), %xmm0	# startendcur.u, _30
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _30, _31
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _29, _32
	cltq
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _34
	movq	-904(%rbp), %rax	# src_pixels, tmp255
	leaq	(%rdx,%rax), %rcx	#, _35
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-684(%rbp), %xmm0	# startendcur.y, _36
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _36, _37
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-908(%rbp), %eax	# dst_width, _37
	movl	%eax, %edx	# _37, _38
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-688(%rbp), %xmm0	# startendcur.x, _39
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _39, _40
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _38, _41
	cltq
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _43
	movq	16(%rbp), %rax	# dst_pixels, tmp256
	addq	%rax, %rdx	# tmp256, _44
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	(%rcx), %eax	# *_35, _45
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	%eax, (%rdx)	# _45, *_44
# ../source/app.c:775: 			startendcur = add_vec5(startendcur, startendstep);
	leaq	-688(%rbp), %rsi	#, tmp257
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp258
	movq	-656(%rbp), %rax	# startendstep, tmp259
	movq	-648(%rbp), %rdx	# startendstep,
	movq	%rax, (%rcx)	# tmp259,
	movq	%rdx, 8(%rcx)	#,
	movl	-640(%rbp), %eax	# startendstep, tmp260
	movl	%eax, 16(%rcx)	# tmp260,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp261
	movq	-688(%rbp), %rax	# startendcur, tmp262
	movq	-680(%rbp), %rdx	# startendcur,
	movq	%rax, (%rcx)	# tmp262,
	movq	%rdx, 8(%rcx)	#,
	movl	-672(%rbp), %eax	# startendcur, tmp263
	movl	%eax, 16(%rcx)	# tmp263,
	movq	%rsi, %rdi	# tmp257,
	call	add_vec5	#
	addq	$48, %rsp	#,
.L174:
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	movss	-688(%rbp), %xmm1	# startendcur.x, _46
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	movss	-624(%rbp), %xmm0	# end.x, _47
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	comiss	%xmm1, %xmm0	# _46, _47
	ja	.L175	#,
# ../source/app.c:778: 		topbotcur = sub_vec5(topbotcur, topbotstep);
	leaq	-400(%rbp), %rsi	#, tmp264
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp265
	movq	-304(%rbp), %rax	# topbotstep, tmp266
	movq	-296(%rbp), %rdx	# topbotstep,
	movq	%rax, (%rcx)	# tmp266,
	movq	%rdx, 8(%rcx)	#,
	movl	-288(%rbp), %eax	# topbotstep, tmp267
	movl	%eax, 16(%rcx)	# tmp267,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp268
	movq	-400(%rbp), %rax	# topbotcur, tmp269
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, (%rcx)	# tmp269,
	movq	%rdx, 8(%rcx)	#,
	movl	-384(%rbp), %eax	# topbotcur, tmp270
	movl	%eax, 16(%rcx)	# tmp270,
	movq	%rsi, %rdi	# tmp264,
	call	sub_vec5	#
	addq	$48, %rsp	#,
# ../source/app.c:779: 	  topmidcur = sub_vec5(topmidcur, topmidstep);
	leaq	-432(%rbp), %rsi	#, tmp271
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp272
	movq	-336(%rbp), %rax	# topmidstep, tmp273
	movq	-328(%rbp), %rdx	# topmidstep,
	movq	%rax, (%rcx)	# tmp273,
	movq	%rdx, 8(%rcx)	#,
	movl	-320(%rbp), %eax	# topmidstep, tmp274
	movl	%eax, 16(%rcx)	# tmp274,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp275
	movq	-432(%rbp), %rax	# topmidcur, tmp276
	movq	-424(%rbp), %rdx	# topmidcur,
	movq	%rax, (%rcx)	# tmp276,
	movq	%rdx, 8(%rcx)	#,
	movl	-416(%rbp), %eax	# topmidcur, tmp277
	movl	%eax, 16(%rcx)	# tmp277,
	movq	%rsi, %rdi	# tmp271,
	call	sub_vec5	#
	addq	$48, %rsp	#,
.L171:
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	movss	-428(%rbp), %xmm0	# topmidcur.y, _48
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	movss	-236(%rbp), %xmm1	# mid.y, _49
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	comiss	%xmm1, %xmm0	# _49, _48
	ja	.L176	#,
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	jmp	.L177	#
.L182:
# ../source/app.c:786: 		  start = topbotcur,
	movq	-400(%rbp), %rax	# topbotcur, tmp278
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, -752(%rbp)	# tmp278, start
	movq	%rdx, -744(%rbp)	#, start
	movl	-384(%rbp), %eax	# topbotcur, tmp279
	movl	%eax, -736(%rbp)	# tmp279, start
# ../source/app.c:787: 		  end   = midbotcur;
	movq	-464(%rbp), %rax	# midbotcur, tmp280
	movq	-456(%rbp), %rdx	# midbotcur,
	movq	%rax, -784(%rbp)	# tmp280, end
	movq	%rdx, -776(%rbp)	#, end
	movl	-448(%rbp), %eax	# midbotcur, tmp281
	movl	%eax, -768(%rbp)	# tmp281, end
# ../source/app.c:789: 		if (end.x < start.x) {
	movss	-784(%rbp), %xmm1	# end.x, _50
# ../source/app.c:789: 		if (end.x < start.x) {
	movss	-752(%rbp), %xmm0	# start.x, _51
# ../source/app.c:789: 		if (end.x < start.x) {
	comiss	%xmm1, %xmm0	# _50, _51
	jbe	.L178	#,
# ../source/app.c:790: 		  struct vec5 temp = end;
	movq	-784(%rbp), %rax	# end, tmp282
	movq	-776(%rbp), %rdx	# end,
	movq	%rax, -880(%rbp)	# tmp282, temp
	movq	%rdx, -872(%rbp)	#, temp
	movl	-768(%rbp), %eax	# end, tmp283
	movl	%eax, -864(%rbp)	# tmp283, temp
# ../source/app.c:791: 		  end   = start;
	movq	-752(%rbp), %rax	# start, tmp284
	movq	-744(%rbp), %rdx	# start,
	movq	%rax, -784(%rbp)	# tmp284, end
	movq	%rdx, -776(%rbp)	#, end
	movl	-736(%rbp), %eax	# start, tmp285
	movl	%eax, -768(%rbp)	# tmp285, end
# ../source/app.c:792: 		  start = temp;
	movq	-880(%rbp), %rax	# temp, tmp286
	movq	-872(%rbp), %rdx	# temp,
	movq	%rax, -752(%rbp)	# tmp286, start
	movq	%rdx, -744(%rbp)	#, start
	movl	-864(%rbp), %eax	# temp, tmp287
	movl	%eax, -736(%rbp)	# tmp287, start
.L178:
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-784(%rbp), %xmm0	# end.x, _52
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-752(%rbp), %xmm2	# start.x, _53
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movaps	%xmm0, %xmm1	# _52, _52
	subss	%xmm2, %xmm1	# _53, _52
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	.LC6(%rip), %xmm0	#, tmp288
	divss	%xmm1, %xmm0	# _54, tmp288
	movd	%xmm0, %ebx	# tmp288, _55
	leaq	-48(%rbp), %rsi	#, tmp289
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp290
	movq	-752(%rbp), %rax	# start, tmp291
	movq	-744(%rbp), %rdx	# start,
	movq	%rax, (%rcx)	# tmp291,
	movq	%rdx, 8(%rcx)	#,
	movl	-736(%rbp), %eax	# start, tmp292
	movl	%eax, 16(%rcx)	# tmp292,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp293
	movq	-784(%rbp), %rax	# end, tmp294
	movq	-776(%rbp), %rdx	# end,
	movq	%rax, (%rcx)	# tmp294,
	movq	%rdx, 8(%rcx)	#,
	movl	-768(%rbp), %eax	# end, tmp295
	movl	%eax, 16(%rcx)	# tmp295,
	movq	%rsi, %rdi	# tmp289,
	call	sub_vec5	#
	addq	$48, %rsp	#,
	leaq	-816(%rbp), %rsi	#, tmp296
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp297
	movq	-48(%rbp), %rax	# D.8312, tmp298
	movq	-40(%rbp), %rdx	# D.8312,
	movq	%rax, (%rcx)	# tmp298,
	movq	%rdx, 8(%rcx)	#,
	movl	-32(%rbp), %eax	# D.8312, tmp299
	movl	%eax, 16(%rcx)	# tmp299,
	movd	%ebx, %xmm0	# _55,
	movq	%rsi, %rdi	# tmp296,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:797: 		struct vec5 startendcur = start;
	movq	-752(%rbp), %rax	# start, tmp300
	movq	-744(%rbp), %rdx	# start,
	movq	%rax, -848(%rbp)	# tmp300, startendcur
	movq	%rdx, -840(%rbp)	#, startendcur
	movl	-736(%rbp), %eax	# start, tmp301
	movl	%eax, -832(%rbp)	# tmp301, startendcur
# ../source/app.c:799: 		while (startendcur.x < end.x) {
	jmp	.L180	#
.L181:
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-832(%rbp), %xmm0	# startendcur.v, _56
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _56, _57
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-892(%rbp), %eax	# src_width, _57
	movl	%eax, %edx	# _57, _58
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-836(%rbp), %xmm0	# startendcur.u, _59
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _59, _60
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _58, _61
	cltq
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _63
	movq	-904(%rbp), %rax	# src_pixels, tmp302
	leaq	(%rdx,%rax), %rcx	#, _64
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-844(%rbp), %xmm0	# startendcur.y, _65
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _65, _66
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-908(%rbp), %eax	# dst_width, _66
	movl	%eax, %edx	# _66, _67
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-848(%rbp), %xmm0	# startendcur.x, _68
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _68, _69
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _67, _70
	cltq
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _72
	movq	16(%rbp), %rax	# dst_pixels, tmp303
	addq	%rax, %rdx	# tmp303, _73
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	(%rcx), %eax	# *_64, _74
# ../source/app.c:800: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	%eax, (%rdx)	# _74, *_73
# ../source/app.c:801: 			startendcur = add_vec5(startendcur, startendstep);
	leaq	-848(%rbp), %rsi	#, tmp304
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp305
	movq	-816(%rbp), %rax	# startendstep, tmp306
	movq	-808(%rbp), %rdx	# startendstep,
	movq	%rax, (%rcx)	# tmp306,
	movq	%rdx, 8(%rcx)	#,
	movl	-800(%rbp), %eax	# startendstep, tmp307
	movl	%eax, 16(%rcx)	# tmp307,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp308
	movq	-848(%rbp), %rax	# startendcur, tmp309
	movq	-840(%rbp), %rdx	# startendcur,
	movq	%rax, (%rcx)	# tmp309,
	movq	%rdx, 8(%rcx)	#,
	movl	-832(%rbp), %eax	# startendcur, tmp310
	movl	%eax, 16(%rcx)	# tmp310,
	movq	%rsi, %rdi	# tmp304,
	call	add_vec5	#
	addq	$48, %rsp	#,
.L180:
# ../source/app.c:799: 		while (startendcur.x < end.x) {
	movss	-848(%rbp), %xmm1	# startendcur.x, _75
# ../source/app.c:799: 		while (startendcur.x < end.x) {
	movss	-784(%rbp), %xmm0	# end.x, _76
# ../source/app.c:799: 		while (startendcur.x < end.x) {
	comiss	%xmm1, %xmm0	# _75, _76
	ja	.L181	#,
# ../source/app.c:804: 		topbotcur = sub_vec5(topbotcur, topbotstep);
	leaq	-944(%rbp), %rsi	#, tmp311
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp312
	movq	-304(%rbp), %rax	# topbotstep, tmp313
	movq	-296(%rbp), %rdx	# topbotstep,
	movq	%rax, (%rcx)	# tmp313,
	movq	%rdx, 8(%rcx)	#,
	movl	-288(%rbp), %eax	# topbotstep, tmp314
	movl	%eax, 16(%rcx)	# tmp314,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp315
	movq	-400(%rbp), %rax	# topbotcur, tmp316
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, (%rcx)	# tmp316,
	movq	%rdx, 8(%rcx)	#,
	movl	-384(%rbp), %eax	# topbotcur, tmp317
	movl	%eax, 16(%rcx)	# tmp317,
	movq	%rsi, %rdi	# tmp311,
	call	sub_vec5	#
	addq	$48, %rsp	#,
	movq	-944(%rbp), %rax	#, tmp318
	movq	-936(%rbp), %rdx	#,
	movq	%rax, -400(%rbp)	# tmp318, topbotcur
	movq	%rdx, -392(%rbp)	#, topbotcur
	movl	-928(%rbp), %eax	#, tmp319
	movl	%eax, -384(%rbp)	# tmp319, topbotcur
# ../source/app.c:805: 	  midbotcur = sub_vec5(midbotcur, midbotstep);
	leaq	-464(%rbp), %rsi	#, tmp320
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp321
	movq	-368(%rbp), %rax	# midbotstep, tmp322
	movq	-360(%rbp), %rdx	# midbotstep,
	movq	%rax, (%rcx)	# tmp322,
	movq	%rdx, 8(%rcx)	#,
	movl	-352(%rbp), %eax	# midbotstep, tmp323
	movl	%eax, 16(%rcx)	# tmp323,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp324
	movq	-464(%rbp), %rax	# midbotcur, tmp325
	movq	-456(%rbp), %rdx	# midbotcur,
	movq	%rax, (%rcx)	# tmp325,
	movq	%rdx, 8(%rcx)	#,
	movl	-448(%rbp), %eax	# midbotcur, tmp326
	movl	%eax, 16(%rcx)	# tmp326,
	movq	%rsi, %rdi	# tmp320,
	call	sub_vec5	#
	addq	$48, %rsp	#,
.L177:
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	movss	-460(%rbp), %xmm0	# midbotcur.y, _77
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	movss	-268(%rbp), %xmm1	# bot.y, _78
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	comiss	%xmm1, %xmm0	# _78, _77
	ja	.L182	#,
# ../source/app.c:809: 	return 0;
	movl	$0, %eax	#, _79
.L183:
# ../source/app.c:811: }
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE24:
	.size	draw_triangle, .-draw_triangle
	.section	.rodata
	.align 8
.LC9:
	.string	"../resources/game_assets/textures/test.bmp"
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$368, %rsp	#,
	movl	%edi, -356(%rbp)	# argc, argc
	movq	%rsi, -368(%rbp)	# argv, argv
# ../source/app.c:815:   struct memory                     memory        = {0};
	pxor	%xmm0, %xmm0	# tmp98
	movaps	%xmm0, -48(%rbp)	# tmp98, memory
	movq	%xmm0, -32(%rbp)	# tmp98, memory
# ../source/app.c:816:   struct x11_window                 window        = {0};
	pxor	%xmm0, %xmm0	# tmp99
	movaps	%xmm0, -128(%rbp)	# tmp99, window
	movaps	%xmm0, -112(%rbp)	# tmp99, window
	movaps	%xmm0, -96(%rbp)	# tmp99, window
	movaps	%xmm0, -80(%rbp)	# tmp99, window
	movq	%xmm0, -64(%rbp)	# tmp99, window
# ../source/app.c:817:   struct xlib_update_window_output  update        = {0};
	leaq	-256(%rbp), %rdx	#, tmp100
	movl	$0, %eax	#, tmp101
	movl	$15, %ecx	#, tmp102
	movq	%rdx, %rdi	# tmp100, tmp100
	rep stosq
# ../source/app.c:818:   char                             *system_memory = calloc(1, 1024 * 1024 * 1024);
	movl	$1073741824, %esi	#,
	movl	$1, %edi	#,
	call	calloc@PLT	#
	movq	%rax, -16(%rbp)	# tmp103, system_memory
# ../source/app.c:820:   if (system_memory == 0)
	cmpq	$0, -16(%rbp)	#, system_memory
	jne	.L191	#,
# ../source/app.c:821:     return 1;
	movl	$1, %eax	#, _16
	jmp	.L197	#
.L191:
# ../source/app.c:823:   memory_init(1024 * 1024 * 1024, system_memory, &memory);
	leaq	-48(%rbp), %rdx	#, tmp104
	movq	-16(%rbp), %rax	# system_memory, tmp105
	movq	%rax, %rsi	# tmp105,
	movl	$1073741824, %edi	#,
	call	memory_init	#
# ../source/app.c:825:   if (xlib_open_window(0, 0, 1920, 1080, &memory, &window) != 0)
	leaq	-128(%rbp), %rdx	#, tmp106
	leaq	-48(%rbp), %rax	#, tmp107
	movq	%rdx, %r9	# tmp106,
	movq	%rax, %r8	# tmp107,
	movl	$1080, %ecx	#,
	movl	$1920, %edx	#,
	movl	$0, %esi	#,
	movl	$0, %edi	#,
	call	xlib_open_window	#
# ../source/app.c:825:   if (xlib_open_window(0, 0, 1920, 1080, &memory, &window) != 0)
	testl	%eax, %eax	# _1
	je	.L193	#,
# ../source/app.c:826:     return 2;
	movl	$2, %eax	#, _16
	jmp	.L197	#
.L193:
# ../source/app.c:828:   struct triangle test = {
	movss	.LC7(%rip), %xmm0	#, tmp108
	movss	%xmm0, -320(%rbp)	# tmp108, test.v1.x
	movss	.LC7(%rip), %xmm0	#, tmp109
	movss	%xmm0, -316(%rbp)	# tmp109, test.v1.y
	pxor	%xmm0, %xmm0	# tmp110
	movss	%xmm0, -312(%rbp)	# tmp110, test.v1.z
	pxor	%xmm0, %xmm0	# tmp111
	movss	%xmm0, -308(%rbp)	# tmp111, test.v1.u
	pxor	%xmm0, %xmm0	# tmp112
	movss	%xmm0, -304(%rbp)	# tmp112, test.v1.v
	movss	.LC7(%rip), %xmm0	#, tmp113
	movss	%xmm0, -300(%rbp)	# tmp113, test.v2.x
	movss	.LC8(%rip), %xmm0	#, tmp114
	movss	%xmm0, -296(%rbp)	# tmp114, test.v2.y
	pxor	%xmm0, %xmm0	# tmp115
	movss	%xmm0, -292(%rbp)	# tmp115, test.v2.z
	pxor	%xmm0, %xmm0	# tmp116
	movss	%xmm0, -288(%rbp)	# tmp116, test.v2.u
	movss	.LC6(%rip), %xmm0	#, tmp117
	movss	%xmm0, -284(%rbp)	# tmp117, test.v2.v
	movss	.LC8(%rip), %xmm0	#, tmp118
	movss	%xmm0, -280(%rbp)	# tmp118, test.v3.x
	movss	.LC8(%rip), %xmm0	#, tmp119
	movss	%xmm0, -276(%rbp)	# tmp119, test.v3.y
	pxor	%xmm0, %xmm0	# tmp120
	movss	%xmm0, -272(%rbp)	# tmp120, test.v3.z
	movss	.LC6(%rip), %xmm0	#, tmp121
	movss	%xmm0, -268(%rbp)	# tmp121, test.v3.u
	movss	.LC6(%rip), %xmm0	#, tmp122
	movss	%xmm0, -264(%rbp)	# tmp122, test.v3.v
# ../source/app.c:836:   c_read_image_file(
	leaq	-352(%rbp), %rdx	#, tmp123
	leaq	-48(%rbp), %rax	#, tmp124
	movq	%rax, %rsi	# tmp124,
	leaq	.LC9(%rip), %rax	#, tmp125
	movq	%rax, %rdi	# tmp125,
	call	c_read_image_file	#
.L196:
# ../source/app.c:844:     int itr = 0;
	movl	$0, -4(%rbp)	#, itr
# ../source/app.c:846:     while (itr < window.width * window.height) {
	jmp	.L194	#
.L195:
# ../source/app.c:847:       window.pixels[itr] = 0xffffffff;
	movq	-64(%rbp), %rax	# window.pixels, _2
# ../source/app.c:847:       window.pixels[itr] = 0xffffffff;
	movl	-4(%rbp), %edx	# itr, tmp126
	movslq	%edx, %rdx	# tmp126, _3
	salq	$2, %rdx	#, _4
	addq	%rdx, %rax	# _4, _5
# ../source/app.c:847:       window.pixels[itr] = 0xffffffff;
	movl	$-1, (%rax)	#, *_5
# ../source/app.c:848:       ++itr;
	addl	$1, -4(%rbp)	#, itr
.L194:
# ../source/app.c:846:     while (itr < window.width * window.height) {
	movl	-72(%rbp), %edx	# window.width, _6
# ../source/app.c:846:     while (itr < window.width * window.height) {
	movl	-68(%rbp), %eax	# window.height, _7
# ../source/app.c:846:     while (itr < window.width * window.height) {
	imull	%edx, %eax	# _6, _8
# ../source/app.c:846:     while (itr < window.width * window.height) {
	cmpl	%eax, -4(%rbp)	# _8, itr
	jl	.L195	#,
# ../source/app.c:851:     draw_triangle(
	movq	-64(%rbp), %rdi	# window.pixels, _9
	movl	-68(%rbp), %r9d	# window.height, _10
	movl	-72(%rbp), %r8d	# window.width, _11
	movq	-328(%rbp), %rcx	# image.pixels, _12
	movl	-332(%rbp), %edx	# image.height, _13
	movl	-336(%rbp), %esi	# image.width, _14
	leaq	-320(%rbp), %rax	#, tmp127
	subq	$8, %rsp	#,
	pushq	%rdi	# _9
	movq	%rax, %rdi	# tmp127,
	call	draw_triangle	#
	addq	$16, %rsp	#,
# ../source/app.c:857:     xlib_update_window(&window, &update);
	leaq	-256(%rbp), %rdx	#, tmp128
	leaq	-128(%rbp), %rax	#, tmp129
	movq	%rdx, %rsi	# tmp128,
	movq	%rax, %rdi	# tmp129,
	call	xlib_update_window	#
# ../source/app.c:842:   while(1) {
	jmp	.L196	#
.L197:
# ../source/app.c:862: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC2:
	.long	1135869952
	.align 4
.LC3:
	.long	1015998375
	.align 4
.LC4:
	.long	1056964608
	.align 16
.LC5:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC6:
	.long	1065353216
	.align 4
.LC7:
	.long	1120403456
	.align 4
.LC8:
	.long	1128792064
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
