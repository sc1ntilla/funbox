	.file	"app.c"
# GNU C17 (GCC) version 14.1.1 20240507 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 14.1.1 20240507, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64
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
	movq	-24(%rbp), %rax	# output, tmp98
	movq	-16(%rbp), %rdx	# memory, tmp99
	movq	%rdx, 16(%rax)	# tmp99, output_2(D)->bytes
# ../source/app.c:15: 	output->max = size;
	movq	-24(%rbp), %rax	# output, tmp100
	movq	-8(%rbp), %rdx	# size, tmp101
	movq	%rdx, (%rax)	# tmp101, output_2(D)->max
# ../source/app.c:16: 	output->cur = 0;
	movq	-24(%rbp), %rax	# output, tmp102
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
	movq	-32(%rbp), %rax	# memory, tmp125
	movq	8(%rax), %rdx	# memory_31(D)->cur, _1
# ../source/app.c:26: 	if (memory->cur + size > memory->max)
	movq	-24(%rbp), %rax	# size, tmp126
	addq	%rax, %rdx	# tmp126, _2
# ../source/app.c:26: 	if (memory->cur + size > memory->max)
	movq	-32(%rbp), %rax	# memory, tmp127
	movq	(%rax), %rax	# memory_31(D)->max, _3
# ../source/app.c:26: 	if (memory->cur + size > memory->max)
	cmpq	%rax, %rdx	# _3, _2
	jle	.L3	#,
# ../source/app.c:27: 		return 1;
	movl	$1, %eax	#, _28
	jmp	.L4	#
.L3:
# ../source/app.c:29: 	long bytes_free = 0;
	movq	$0, -16(%rbp)	#, bytes_free
# ../source/app.c:30: 	long byte = 0;
	movq	$0, -8(%rbp)	#, byte
# ../source/app.c:32: 	size += 8;
	addq	$8, -24(%rbp)	#, size
# ../source/app.c:34: 	while (byte < memory->max) {
	jmp	.L5	#
.L7:
# ../source/app.c:36: 		if (memory->bytes[byte] == 0) {
	movq	-32(%rbp), %rax	# memory, tmp128
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _4
# ../source/app.c:36: 		if (memory->bytes[byte] == 0) {
	movq	-8(%rbp), %rax	# byte, byte.0_5
	addq	%rdx, %rax	# _4, _6
	movzbl	(%rax), %eax	# *_6, _7
# ../source/app.c:36: 		if (memory->bytes[byte] == 0) {
	testb	%al, %al	# _7
	jne	.L6	#,
# ../source/app.c:38: 			++bytes_free;
	addq	$1, -16(%rbp)	#, bytes_free
# ../source/app.c:39: 			++byte;
	addq	$1, -8(%rbp)	#, byte
# ../source/app.c:41: 			if (bytes_free == size) {
	movq	-16(%rbp), %rax	# bytes_free, tmp129
	cmpq	-24(%rbp), %rax	# size, tmp129
	jne	.L5	#,
# ../source/app.c:43: 				*(long*)(memory->bytes + byte - size) = size;
	movq	-32(%rbp), %rax	# memory, tmp130
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _8
# ../source/app.c:43: 				*(long*)(memory->bytes + byte - size) = size;
	movq	-8(%rbp), %rcx	# byte, byte.1_9
	movq	-24(%rbp), %rax	# size, size.2_10
	subq	%rax, %rcx	# size.2_10, _11
	addq	%rcx, %rdx	# _11, _12
# ../source/app.c:43: 				*(long*)(memory->bytes + byte - size) = size;
	movq	-24(%rbp), %rax	# size, tmp131
	movq	%rax, (%rdx)	# tmp131, MEM[(long int *)_12]
# ../source/app.c:45: 				memory->cur += size;
	movq	-32(%rbp), %rax	# memory, tmp132
	movq	8(%rax), %rdx	# memory_31(D)->cur, _13
# ../source/app.c:45: 				memory->cur += size;
	movq	-24(%rbp), %rax	# size, tmp133
	addq	%rax, %rdx	# tmp133, _14
	movq	-32(%rbp), %rax	# memory, tmp134
	movq	%rdx, 8(%rax)	# _14, memory_31(D)->cur
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	movq	-32(%rbp), %rax	# memory, tmp135
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _15
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	movq	-8(%rbp), %rcx	# byte, byte.3_16
	movq	-24(%rbp), %rax	# size, size.4_17
	subq	%rax, %rcx	# size.4_17, _18
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	leaq	8(%rcx), %rax	#, _19
	addq	%rax, %rdx	# _19, _20
# ../source/app.c:47: 				*output = memory->bytes + byte - size + 8;
	movq	-40(%rbp), %rax	# output, tmp136
	movq	%rdx, (%rax)	# _20, *output_43(D)
# ../source/app.c:49: 				return 0;
	movl	$0, %eax	#, _28
	jmp	.L4	#
.L6:
# ../source/app.c:57: 			bytes_free = 0;
	movq	$0, -16(%rbp)	#, bytes_free
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	movq	-32(%rbp), %rax	# memory, tmp137
	movq	16(%rax), %rdx	# memory_31(D)->bytes, _21
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	movq	-8(%rbp), %rax	# byte, byte.5_22
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	addq	%rdx, %rax	# _21, _23
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	movq	(%rax), %rax	# MEM[(long int *)_23], _24
# ../source/app.c:59: 			byte += *(long*)(memory->bytes + byte);
	addq	%rax, -8(%rbp)	# _24, byte
.L5:
# ../source/app.c:34: 	while (byte < memory->max) {
	movq	-32(%rbp), %rax	# memory, tmp138
	movq	(%rax), %rax	# memory_31(D)->max, _25
# ../source/app.c:34: 	while (byte < memory->max) {
	cmpq	%rax, -8(%rbp)	# _25, byte
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
	movq	-40(%rbp), %rax	# ptr, tmp106
	movq	-8(%rax), %rax	# MEM[(long int *)ptr_12(D) + -8B], tmp107
	movq	%rax, -16(%rbp)	# tmp107, size
# ../source/app.c:76: 	if (memory->cur - size < 0)
	movq	-48(%rbp), %rax	# memory, tmp108
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
	movq	-40(%rbp), %rax	# ptr, tmp112
	subq	$8, %rax	#, ptr2_15
	movq	%rax, -8(%rbp)	# ptr2_15, ptr2
# ../source/app.c:81: 	long byte = 0;
	movq	$0, -24(%rbp)	#, byte
# ../source/app.c:83: 	while (byte < size) {
	jmp	.L11	#
.L12:
# ../source/app.c:84: 		ptr2[byte] = 0;
	movq	-24(%rbp), %rdx	# byte, byte.6_3
	movq	-8(%rbp), %rax	# ptr2, tmp113
	addq	%rdx, %rax	# byte.6_3, _4
# ../source/app.c:84: 		ptr2[byte] = 0;
	movb	$0, (%rax)	#, *_4
# ../source/app.c:85: 		++byte;
	addq	$1, -24(%rbp)	#, byte
.L11:
# ../source/app.c:83: 	while (byte < size) {
	movq	-24(%rbp), %rax	# byte, tmp114
	cmpq	-16(%rbp), %rax	# size, tmp114
	jl	.L12	#,
# ../source/app.c:88: 	memory->cur -= size;
	movq	-48(%rbp), %rax	# memory, tmp115
	movq	8(%rax), %rax	# memory_14(D)->cur, _5
# ../source/app.c:88: 	memory->cur -= size;
	subq	-16(%rbp), %rax	# size, _5
	movq	%rax, %rdx	# _5, _6
	movq	-48(%rbp), %rax	# memory, tmp116
	movq	%rdx, 8(%rax)	# _6, memory_14(D)->cur
# ../source/app.c:90: 	*ptr = 0;
	movq	-40(%rbp), %rax	# ptr, tmp117
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
	movq	-24(%rbp), %rax	# path, tmp107
	leaq	.LC0(%rip), %rdx	#, tmp108
	movq	%rdx, %rsi	# tmp108,
	movq	%rax, %rdi	# tmp107,
	call	fopen@PLT	#
	movq	%rax, -8(%rbp)	# tmp109, handle
# ../source/app.c:111:   if (handle == 0)
	cmpq	$0, -8(%rbp)	#, handle
	jne	.L14	#,
# ../source/app.c:112:     return 1;
	movl	$1, %eax	#, _8
	jmp	.L15	#
.L14:
# ../source/app.c:115:   fseek(handle, 0, SEEK_END);
	movq	-8(%rbp), %rax	# handle, tmp110
	movl	$2, %edx	#,
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp110,
	call	fseek@PLT	#
# ../source/app.c:116:   output->size = ftell(handle);
	movq	-8(%rbp), %rax	# handle, tmp111
	movq	%rax, %rdi	# tmp111,
	call	ftell@PLT	#
# ../source/app.c:116:   output->size = ftell(handle);
	movq	-40(%rbp), %rdx	# output, tmp112
	movq	%rax, (%rdx)	# _1, output_16(D)->size
# ../source/app.c:117:   rewind(handle);
	movq	-8(%rbp), %rax	# handle, tmp113
	movq	%rax, %rdi	# tmp113,
	call	rewind@PLT	#
# ../source/app.c:119:   if (memory_alloc(output->size, memory, &output->src) != 0) {
	movq	-40(%rbp), %rax	# output, tmp114
	leaq	8(%rax), %rdx	#, _2
	movq	-40(%rbp), %rax	# output, tmp115
	movq	(%rax), %rax	# output_16(D)->size, _3
	movq	-32(%rbp), %rcx	# memory, tmp116
	movq	%rcx, %rsi	# tmp116,
	movq	%rax, %rdi	# _3,
	call	memory_alloc	#
# ../source/app.c:119:   if (memory_alloc(output->size, memory, &output->src) != 0) {
	testl	%eax, %eax	# _4
	je	.L16	#,
# ../source/app.c:120:     fclose(handle);
	movq	-8(%rbp), %rax	# handle, tmp117
	movq	%rax, %rdi	# tmp117,
	call	fclose@PLT	#
# ../source/app.c:121:     return 2;
	movl	$2, %eax	#, _8
	jmp	.L15	#
.L16:
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	-40(%rbp), %rax	# output, tmp118
	movq	(%rax), %rax	# output_16(D)->size, _5
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	%rax, %rsi	# _5, _6
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	-40(%rbp), %rax	# output, tmp119
	movq	8(%rax), %rax	# output_16(D)->src, _7
# ../source/app.c:124:   fread(output->src, output->size, 1, handle);
	movq	-8(%rbp), %rdx	# handle, tmp120
	movq	%rdx, %rcx	# tmp120,
	movl	$1, %edx	#,
	movq	%rax, %rdi	# _7,
	call	fread@PLT	#
# ../source/app.c:126:   fclose(handle);
	movq	-8(%rbp), %rax	# handle, tmp121
	movq	%rax, %rdi	# tmp121,
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
	movq	-8(%rbp), %rax	# file, tmp102
	movq	8(%rax), %rax	# file_6(D)->src, _1
	movq	-16(%rbp), %rdx	# memory, tmp103
	movq	%rdx, %rsi	# tmp103,
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
	movq	-8(%rbp), %rax	# file, tmp104
	movq	$0, (%rax)	#, file_6(D)->size
# ../source/app.c:141:   file->src = 0;
	movq	-8(%rbp), %rax	# file, tmp105
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
	subq	$64, %rsp	#,
	movq	%rdi, -40(%rbp)	# path, path
	movq	%rsi, -48(%rbp)	# memory, memory
	movq	%rdx, -56(%rbp)	# output, output
# ../source/app.c:156: ) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp114
	movq	%rax, -8(%rbp)	# tmp114, D.9199
	xorl	%eax, %eax	# tmp114
# ../source/app.c:158:   struct file_data file = {0};
	movq	$0, -32(%rbp)	#, file
	movq	$0, -24(%rbp)	#, file
# ../source/app.c:160:   if (c_read_file(path, memory, &file) != 0)
	leaq	-32(%rbp), %rdx	#, tmp115
	movq	-48(%rbp), %rcx	# memory, tmp116
	movq	-40(%rbp), %rax	# path, tmp117
	movq	%rcx, %rsi	# tmp116,
	movq	%rax, %rdi	# tmp117,
	call	c_read_file	#
# ../source/app.c:160:   if (c_read_file(path, memory, &file) != 0)
	testl	%eax, %eax	# _1
	je	.L21	#,
# ../source/app.c:161:     return 1;
	movl	$1, %eax	#, _15
	jmp	.L25	#
.L21:
# ../source/app.c:163:   if (*(short*)file.src != 0x4d42) {
	movq	-24(%rbp), %rax	# file.src, _2
# ../source/app.c:163:   if (*(short*)file.src != 0x4d42) {
	movzwl	(%rax), %eax	# MEM[(short int *)_2], _3
# ../source/app.c:163:   if (*(short*)file.src != 0x4d42) {
	cmpw	$19778, %ax	#, _3
	je	.L23	#,
# ../source/app.c:164:     if (c_free_file(&file, memory) != 0)
	movq	-48(%rbp), %rdx	# memory, tmp118
	leaq	-32(%rbp), %rax	#, tmp119
	movq	%rdx, %rsi	# tmp118,
	movq	%rax, %rdi	# tmp119,
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
	movq	-56(%rbp), %rcx	# output, tmp120
	movq	-32(%rbp), %rax	# file, tmp121
	movq	-24(%rbp), %rdx	# file,
	movq	%rax, (%rcx)	# tmp121, output_22(D)->base
	movq	%rdx, 8(%rcx)	#, output_22(D)->base
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movq	-24(%rbp), %rdx	# file.src, _5
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movq	-24(%rbp), %rax	# file.src, _6
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	addq	$10, %rax	#, _7
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movl	(%rax), %eax	# MEM[(int *)_7], _8
	cltq
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	addq	%rax, %rdx	# _9, _10
# ../source/app.c:170:   output->pixels = (int*)(*(int*)(file.src + 10) + file.src);
	movq	-56(%rbp), %rax	# output, tmp122
	movq	%rdx, 24(%rax)	# _10, output_22(D)->pixels
# ../source/app.c:171:   output->width  = *(int*)(file.src + 18);
	movq	-24(%rbp), %rax	# file.src, _11
# ../source/app.c:171:   output->width  = *(int*)(file.src + 18);
	movl	18(%rax), %edx	# MEM[(int *)_11 + 18B], _12
	movq	-56(%rbp), %rax	# output, tmp123
	movl	%edx, 16(%rax)	# _12, output_22(D)->width
# ../source/app.c:172:   output->height = *(int*)(file.src + 22);
	movq	-24(%rbp), %rax	# file.src, _13
# ../source/app.c:172:   output->height = *(int*)(file.src + 22);
	movl	22(%rax), %edx	# MEM[(int *)_13 + 22B], _14
	movq	-56(%rbp), %rax	# output, tmp124
	movl	%edx, 20(%rax)	# _14, output_22(D)->height
# ../source/app.c:174:   return 0;
	movl	$0, %eax	#, _15
.L25:
# ../source/app.c:176: }
	movq	-8(%rbp), %rdx	# D.9199, tmp126
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp126
	je	.L26	#,
	call	__stack_chk_fail@PLT	#
.L26:
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
	movq	-16(%rbp), %rdx	# memory, tmp102
	movq	%rdx, %rsi	# tmp102,
	movq	%rax, %rdi	# _1,
	call	c_free_file	#
# ../source/app.c:183:   if (c_free_file(&file->base, memory) != 0)
	testl	%eax, %eax	# _2
	je	.L28	#,
# ../source/app.c:184:     return 1;
	movl	$1, %eax	#, _3
	jmp	.L29	#
.L28:
# ../source/app.c:186:   file->base.src  = 0;
	movq	-8(%rbp), %rax	# file, tmp103
	movq	$0, 8(%rax)	#, file_5(D)->base.src
# ../source/app.c:187:   file->base.size = 0;
	movq	-8(%rbp), %rax	# file, tmp104
	movq	$0, (%rax)	#, file_5(D)->base.size
# ../source/app.c:188:   file->width     = 0;
	movq	-8(%rbp), %rax	# file, tmp105
	movl	$0, 16(%rax)	#, file_5(D)->width
# ../source/app.c:189:   file->height    = 0;
	movq	-8(%rbp), %rax	# file, tmp106
	movl	$0, 20(%rax)	#, file_5(D)->height
# ../source/app.c:190:   file->pixels    = 0;
	movq	-8(%rbp), %rax	# file, tmp107
	movq	$0, 24(%rax)	#, file_5(D)->pixels
# ../source/app.c:192:   return 0;
	movl	$0, %eax	#, _3
.L29:
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
# ../source/app.c:226: ) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp113
	movq	%rax, -24(%rbp)	# tmp113, D.9201
	xorl	%eax, %eax	# tmp113
# ../source/app.c:228:   int events = KeyPressMask | KeyReleaseMask | ButtonPressMask | ButtonReleaseMask | EnterWindowMask | LeaveWindowMask | PointerMotionMask | ExposureMask;
	movl	$32895, -156(%rbp)	#, events
# ../source/app.c:230:   Display *display = XOpenDisplay(0);
	movl	$0, %edi	#,
	call	XOpenDisplay@PLT	#
	movq	%rax, -136(%rbp)	# tmp114, display
# ../source/app.c:231:   Window window = XCreateSimpleWindow(display, XDefaultRootWindow(display), x, y, width, height, 0, 0, 0);
	movl	-176(%rbp), %r12d	# height, height.8_1
	movl	-172(%rbp), %ebx	# width, width.9_2
	movq	-136(%rbp), %rax	# display, tmp115
	movq	%rax, %rdi	# tmp115,
	call	XDefaultRootWindow@PLT	#
	movq	%rax, %rsi	#, _3
# ../source/app.c:231:   Window window = XCreateSimpleWindow(display, XDefaultRootWindow(display), x, y, width, height, 0, 0, 0);
	movl	-168(%rbp), %ecx	# y, tmp116
	movl	-164(%rbp), %edx	# x, tmp117
	movq	-136(%rbp), %rax	# display, tmp118
	subq	$8, %rsp	#,
	pushq	$0	#
	pushq	$0	#
	pushq	$0	#
	movl	%r12d, %r9d	# height.8_1,
	movl	%ebx, %r8d	# width.9_2,
	movq	%rax, %rdi	# tmp118,
	call	XCreateSimpleWindow@PLT	#
	addq	$32, %rsp	#,
	movq	%rax, -128(%rbp)	# tmp119, window
# ../source/app.c:233:   XkbSetDetectableAutoRepeat(display, 1, 0);
	movq	-136(%rbp), %rax	# display, tmp120
	movl	$0, %edx	#,
	movl	$1, %esi	#,
	movq	%rax, %rdi	# tmp120,
	call	XkbSetDetectableAutoRepeat@PLT	#
# ../source/app.c:234:   XSelectInput(display, window, events);
	movl	-156(%rbp), %eax	# events, tmp121
	movslq	%eax, %rdx	# tmp121, _4
	movq	-128(%rbp), %rcx	# window, tmp122
	movq	-136(%rbp), %rax	# display, tmp123
	movq	%rcx, %rsi	# tmp122,
	movq	%rax, %rdi	# tmp123,
	call	XSelectInput@PLT	#
# ../source/app.c:235:   XMapWindow(display, window);
	movq	-128(%rbp), %rdx	# window, tmp124
	movq	-136(%rbp), %rax	# display, tmp125
	movq	%rdx, %rsi	# tmp124,
	movq	%rax, %rdi	# tmp125,
	call	XMapWindow@PLT	#
# ../source/app.c:236:   XSync(display, 0);
	movq	-136(%rbp), %rax	# display, tmp126
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp126,
	call	XSync@PLT	#
# ../source/app.c:238:   int     screen = XDefaultScreen(display);
	movq	-136(%rbp), %rax	# display, tmp127
	movq	%rax, %rdi	# tmp127,
	call	XDefaultScreen@PLT	#
	movl	%eax, -152(%rbp)	# tmp128, screen
# ../source/app.c:239:   Visual *visual = XDefaultVisual(display, screen);
	movl	-152(%rbp), %edx	# screen, tmp129
	movq	-136(%rbp), %rax	# display, tmp130
	movl	%edx, %esi	# tmp129,
	movq	%rax, %rdi	# tmp130,
	call	XDefaultVisual@PLT	#
	movq	%rax, -120(%rbp)	# tmp131, visual
# ../source/app.c:240:   GC      gc     = XDefaultGC(display, screen);
	movl	-152(%rbp), %edx	# screen, tmp132
	movq	-136(%rbp), %rax	# display, tmp133
	movl	%edx, %esi	# tmp132,
	movq	%rax, %rdi	# tmp133,
	call	XDefaultGC@PLT	#
	movq	%rax, -112(%rbp)	# tmp134, gc
# ../source/app.c:241:   int     depth  = XDefaultDepth(display, screen);
	movl	-152(%rbp), %edx	# screen, tmp135
	movq	-136(%rbp), %rax	# display, tmp136
	movl	%edx, %esi	# tmp135,
	movq	%rax, %rdi	# tmp136,
	call	XDefaultDepth@PLT	#
	movl	%eax, -148(%rbp)	# tmp137, depth
# ../source/app.c:243:   char *pixels = 0;
	movq	$0, -144(%rbp)	#, pixels
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	movl	-172(%rbp), %eax	# width, tmp138
	imull	-176(%rbp), %eax	# height, _5
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	sall	$2, %eax	#, _6
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	cltq
	leaq	-144(%rbp), %rdx	#, tmp139
	movq	-184(%rbp), %rcx	# memory, tmp140
	movq	%rcx, %rsi	# tmp140,
	movq	%rax, %rdi	# _7,
	call	memory_alloc	#
# ../source/app.c:245:   if (memory_alloc(width * height * 4, memory, &pixels) != 0) 
	testl	%eax, %eax	# _8
	je	.L33	#,
# ../source/app.c:246:     return 1;
	movl	$1, %eax	#, _14
	jmp	.L35	#
.L33:
# ../source/app.c:248:   XImage *image = XCreateImage(display, visual, depth, ZPixmap, 0, pixels, width, height, 32, 0);
	movl	-176(%rbp), %edi	# height, height.10_9
	movl	-172(%rbp), %ecx	# width, width.11_10
	movq	-144(%rbp), %r8	# pixels, pixels.12_11
	movl	-148(%rbp), %edx	# depth, depth.13_12
	movq	-120(%rbp), %rsi	# visual, tmp141
	movq	-136(%rbp), %rax	# display, tmp142
	pushq	$0	#
	pushq	$32	#
	pushq	%rdi	# height.10_9
	pushq	%rcx	# width.11_10
	movq	%r8, %r9	# pixels.12_11,
	movl	$0, %r8d	#,
	movl	$2, %ecx	#,
	movq	%rax, %rdi	# tmp142,
	call	XCreateImage@PLT	#
	addq	$32, %rsp	#,
	movq	%rax, -104(%rbp)	# tmp143, image
# ../source/app.c:250:   struct x11_window ret = {
	movq	-136(%rbp), %rax	# display, tmp144
	movq	%rax, -96(%rbp)	# tmp144, ret.display
	movq	-128(%rbp), %rax	# window, tmp145
	movq	%rax, -88(%rbp)	# tmp145, ret.window
	movl	-152(%rbp), %eax	# screen, tmp146
	movl	%eax, -80(%rbp)	# tmp146, ret.screen
	movq	-120(%rbp), %rax	# visual, tmp147
	movq	%rax, -72(%rbp)	# tmp147, ret.visual
	movq	-112(%rbp), %rax	# gc, tmp148
	movq	%rax, -64(%rbp)	# tmp148, ret.gc
	movl	-148(%rbp), %eax	# depth, tmp149
	movl	%eax, -56(%rbp)	# tmp149, ret.depth
	movq	-104(%rbp), %rax	# image, tmp150
	movq	%rax, -48(%rbp)	# tmp150, ret.image
	movl	-172(%rbp), %eax	# width, tmp151
	movl	%eax, -40(%rbp)	# tmp151, ret.width
	movl	-176(%rbp), %eax	# height, tmp152
	movl	%eax, -36(%rbp)	# tmp152, ret.height
	movq	-144(%rbp), %rax	# pixels, pixels.14_13
	movq	%rax, -32(%rbp)	# pixels.14_13, ret.pixels
# ../source/app.c:263:   *output = ret;
	movq	-192(%rbp), %rax	# output, tmp153
	movq	-96(%rbp), %rcx	# ret, tmp154
	movq	-88(%rbp), %rbx	# ret,
	movq	%rcx, (%rax)	# tmp154, *output_54(D)
	movq	%rbx, 8(%rax)	#, *output_54(D)
	movq	-80(%rbp), %rcx	# ret, tmp155
	movq	-72(%rbp), %rbx	# ret,
	movq	%rcx, 16(%rax)	# tmp155, *output_54(D)
	movq	%rbx, 24(%rax)	#, *output_54(D)
	movq	-64(%rbp), %rcx	# ret, tmp156
	movq	-56(%rbp), %rbx	# ret,
	movq	%rcx, 32(%rax)	# tmp156, *output_54(D)
	movq	%rbx, 40(%rax)	#, *output_54(D)
	movq	-48(%rbp), %rcx	# ret, tmp157
	movq	-40(%rbp), %rbx	# ret,
	movq	%rcx, 48(%rax)	# tmp157, *output_54(D)
	movq	%rbx, 56(%rax)	#, *output_54(D)
	movq	-32(%rbp), %rdx	# ret, tmp158
	movq	%rdx, 64(%rax)	# tmp158, *output_54(D)
# ../source/app.c:265:   return 0;
	movl	$0, %eax	#, _14
.L35:
# ../source/app.c:267: }
	movq	-24(%rbp), %rdx	# D.9201, tmp160
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp160
	je	.L36	#,
	call	__stack_chk_fail@PLT	#
.L36:
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
# ../source/app.c:285: ) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp138
	movq	%rax, -8(%rbp)	# tmp138, D.9202
	xorl	%eax, %eax	# tmp138
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movq	-280(%rbp), %rax	# window, tmp139
	movl	60(%rax), %eax	# window_56(D)->height, _1
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movl	%eax, %r8d	# _1, _2
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movq	-280(%rbp), %rax	# window, tmp140
	movl	56(%rax), %eax	# window_56(D)->width, _3
# ../source/app.c:287:   XPutImage(window->display, window->window, window->gc, window->image, 0, 0, 0, 0, window->width, window->height);
	movl	%eax, %edi	# _3, _4
	movq	-280(%rbp), %rax	# window, tmp141
	movq	48(%rax), %rcx	# window_56(D)->image, _5
	movq	-280(%rbp), %rax	# window, tmp142
	movq	32(%rax), %rdx	# window_56(D)->gc, _6
	movq	-280(%rbp), %rax	# window, tmp143
	movq	8(%rax), %rsi	# window_56(D)->window, _7
	movq	-280(%rbp), %rax	# window, tmp144
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
	movq	-280(%rbp), %rax	# window, tmp145
	movq	(%rax), %rax	# window_56(D)->display, _9
	movq	%rax, %rdi	# _9,
	call	XPending@PLT	#
# ../source/app.c:289:   if (XPending(window->display) > 0) {
	testl	%eax, %eax	# _10
	jle	.L38	#,
# ../source/app.c:292:     XNextEvent(window->display, &event);
	movq	-280(%rbp), %rax	# window, tmp146
	movq	(%rax), %rax	# window_56(D)->display, _11
	leaq	-208(%rbp), %rdx	#, tmp147
	movq	%rdx, %rsi	# tmp147,
	movq	%rax, %rdi	# _11,
	call	XNextEvent@PLT	#
# ../source/app.c:294:     switch (event.type) {
	movl	-208(%rbp), %eax	# event.type, _12
# ../source/app.c:294:     switch (event.type) {
	cmpl	$6, %eax	#, _12
	ja	.L69	#,
	movl	%eax, %eax	# _12, tmp148
	leaq	0(,%rax,4), %rdx	#, tmp149
	leaq	.L41(%rip), %rax	#, tmp150
	movl	(%rdx,%rax), %eax	#, tmp151
	cltq
	leaq	.L41(%rip), %rdx	#, tmp154
	addq	%rdx, %rax	# tmp154, tmp153
	jmp	*%rax	# tmp153
	.section	.rodata
	.align 4
	.align 4
.L41:
	.long	.L69-.L41
	.long	.L69-.L41
	.long	.L45-.L41
	.long	.L44-.L41
	.long	.L43-.L41
	.long	.L42-.L41
	.long	.L40-.L41
	.text
.L45:
# ../source/app.c:298:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movl	-124(%rbp), %eax	# event.xkey.keycode, _13
# ../source/app.c:298:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movzbl	%al, %esi	# _14, _15
	movq	-280(%rbp), %rax	# window, tmp155
	movq	(%rax), %rax	# window_56(D)->display, _16
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# _16,
	call	XkbKeycodeToKeysym@PLT	#
	movq	%rax, -216(%rbp)	# tmp156, keysym
# ../source/app.c:300:         int slot_free = -1;
	movl	$-1, -272(%rbp)	#, slot_free
# ../source/app.c:301:         int slot_max = sizeof(output->keys_down) / sizeof(output->keys_down[0]);
	movl	$8, -228(%rbp)	#, slot_max
# ../source/app.c:302:         int slot_cur = 0; 
	movl	$0, -268(%rbp)	#, slot_cur
# ../source/app.c:304:         while (slot_cur < slot_max) {
	jmp	.L46	#
.L50:
# ../source/app.c:306:           if (output->keys_down[slot_cur] == 0 && slot_free == -1)
	movq	-288(%rbp), %rax	# output, tmp157
	movl	-268(%rbp), %edx	# slot_cur, tmp159
	movslq	%edx, %rdx	# tmp159, tmp158
	movq	8(%rax,%rdx,8), %rax	# output_60(D)->keys_down[slot_cur_42], _17
# ../source/app.c:306:           if (output->keys_down[slot_cur] == 0 && slot_free == -1)
	testq	%rax, %rax	# _17
	jne	.L47	#,
# ../source/app.c:306:           if (output->keys_down[slot_cur] == 0 && slot_free == -1)
	cmpl	$-1, -272(%rbp)	#, slot_free
	jne	.L47	#,
# ../source/app.c:307:             slot_free = slot_cur;
	movl	-268(%rbp), %eax	# slot_cur, tmp160
	movl	%eax, -272(%rbp)	# tmp160, slot_free
	jmp	.L48	#
.L47:
# ../source/app.c:309:           else if (output->keys_down[slot_cur] == keysym) {
	movq	-288(%rbp), %rax	# output, tmp161
	movl	-268(%rbp), %edx	# slot_cur, tmp163
	movslq	%edx, %rdx	# tmp163, tmp162
	movq	8(%rax,%rdx,8), %rax	# output_60(D)->keys_down[slot_cur_42], _18
# ../source/app.c:309:           else if (output->keys_down[slot_cur] == keysym) {
	cmpq	%rax, -216(%rbp)	# _18, keysym
	jne	.L48	#,
# ../source/app.c:310:             slot_free = -1;
	movl	$-1, -272(%rbp)	#, slot_free
# ../source/app.c:311:             break;
	jmp	.L49	#
.L48:
# ../source/app.c:314:           ++slot_cur;
	addl	$1, -268(%rbp)	#, slot_cur
.L46:
# ../source/app.c:304:         while (slot_cur < slot_max) {
	movl	-268(%rbp), %eax	# slot_cur, tmp164
	cmpl	-228(%rbp), %eax	# slot_max, tmp164
	jl	.L50	#,
.L49:
# ../source/app.c:318:         if (slot_free != -1) {
	cmpl	$-1, -272(%rbp)	#, slot_free
	je	.L70	#,
# ../source/app.c:319:           output->keys_down[slot_free] = keysym;
	movq	-288(%rbp), %rax	# output, tmp165
	movl	-272(%rbp), %edx	# slot_free, tmp167
	movslq	%edx, %rdx	# tmp167, tmp166
	movq	-216(%rbp), %rcx	# keysym, tmp168
	movq	%rcx, 8(%rax,%rdx,8)	# tmp168, output_60(D)->keys_down[slot_free_41]
# ../source/app.c:320:           output->keys_down_count++;
	movq	-288(%rbp), %rax	# output, tmp169
	movl	(%rax), %eax	# output_60(D)->keys_down_count, _19
# ../source/app.c:320:           output->keys_down_count++;
	leal	1(%rax), %edx	#, _20
	movq	-288(%rbp), %rax	# output, tmp170
	movl	%edx, (%rax)	# _20, output_60(D)->keys_down_count
# ../source/app.c:323:         break;
	jmp	.L70	#
.L44:
# ../source/app.c:329:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movl	-124(%rbp), %eax	# event.xkey.keycode, _21
# ../source/app.c:329:         KeySym keysym = XkbKeycodeToKeysym(window->display, event.xkey.keycode, 0, 0);
	movzbl	%al, %esi	# _22, _23
	movq	-280(%rbp), %rax	# window, tmp171
	movq	(%rax), %rax	# window_56(D)->display, _24
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rdi	# _24,
	call	XkbKeycodeToKeysym@PLT	#
	movq	%rax, -224(%rbp)	# tmp172, keysym
# ../source/app.c:331:         int slot_cur = 0;
	movl	$0, -264(%rbp)	#, slot_cur
# ../source/app.c:332:         int slot_max = sizeof(output->keys_down) / sizeof(output->keys_down[0]);
	movl	$8, -232(%rbp)	#, slot_max
# ../source/app.c:334:         while (slot_cur < slot_max) {
	jmp	.L53	#
.L56:
# ../source/app.c:336:           if (output->keys_down[slot_cur] == keysym) {
	movq	-288(%rbp), %rax	# output, tmp173
	movl	-264(%rbp), %edx	# slot_cur, tmp175
	movslq	%edx, %rdx	# tmp175, tmp174
	movq	8(%rax,%rdx,8), %rax	# output_60(D)->keys_down[slot_cur_43], _25
# ../source/app.c:336:           if (output->keys_down[slot_cur] == keysym) {
	cmpq	%rax, -224(%rbp)	# _25, keysym
	jne	.L54	#,
# ../source/app.c:338:             output->keys_down[slot_cur] = 0;
	movq	-288(%rbp), %rax	# output, tmp176
	movl	-264(%rbp), %edx	# slot_cur, tmp178
	movslq	%edx, %rdx	# tmp178, tmp177
	movq	$0, 8(%rax,%rdx,8)	#, output_60(D)->keys_down[slot_cur_43]
# ../source/app.c:339:             output->keys_down_count--;
	movq	-288(%rbp), %rax	# output, tmp179
	movl	(%rax), %eax	# output_60(D)->keys_down_count, _26
# ../source/app.c:339:             output->keys_down_count--;
	leal	-1(%rax), %edx	#, _27
	movq	-288(%rbp), %rax	# output, tmp180
	movl	%edx, (%rax)	# _27, output_60(D)->keys_down_count
# ../source/app.c:341:             break;
	nop	
# ../source/app.c:348:         break;
	jmp	.L38	#
.L54:
# ../source/app.c:345:           ++slot_cur;
	addl	$1, -264(%rbp)	#, slot_cur
.L53:
# ../source/app.c:334:         while (slot_cur < slot_max) {
	movl	-264(%rbp), %eax	# slot_cur, tmp181
	cmpl	-232(%rbp), %eax	# slot_max, tmp181
	jl	.L56	#,
# ../source/app.c:348:         break;
	jmp	.L38	#
.L43:
# ../source/app.c:354:         int button = event.xbutton.button;
	movl	-124(%rbp), %eax	# event.xbutton.button, _28
# ../source/app.c:354:         int button = event.xbutton.button;
	movl	%eax, -240(%rbp)	# _28, button
# ../source/app.c:356:         int slot_free = -1;
	movl	$-1, -260(%rbp)	#, slot_free
# ../source/app.c:357:         int slot_max = sizeof(output->buttons_down) / sizeof(output->buttons_down[0]);
	movl	$8, -236(%rbp)	#, slot_max
# ../source/app.c:358:         int slot_cur = 0; 
	movl	$0, -256(%rbp)	#, slot_cur
# ../source/app.c:360:         while (slot_cur < slot_max) {
	jmp	.L57	#
.L61:
# ../source/app.c:362:           if (output->buttons_down[slot_cur] == 0 && slot_free == -1)
	movq	-288(%rbp), %rax	# output, tmp182
	movl	-256(%rbp), %edx	# slot_cur, tmp184
	movslq	%edx, %rdx	# tmp184, tmp183
	addq	$16, %rdx	#, tmp185
	movl	12(%rax,%rdx,4), %eax	# output_60(D)->buttons_down[slot_cur_47], _29
# ../source/app.c:362:           if (output->buttons_down[slot_cur] == 0 && slot_free == -1)
	testl	%eax, %eax	# _29
	jne	.L58	#,
# ../source/app.c:362:           if (output->buttons_down[slot_cur] == 0 && slot_free == -1)
	cmpl	$-1, -260(%rbp)	#, slot_free
	jne	.L58	#,
# ../source/app.c:363:             slot_free = slot_cur;
	movl	-256(%rbp), %eax	# slot_cur, tmp186
	movl	%eax, -260(%rbp)	# tmp186, slot_free
	jmp	.L59	#
.L58:
# ../source/app.c:365:           else if (output->buttons_down[slot_cur] == button) {
	movq	-288(%rbp), %rax	# output, tmp187
	movl	-256(%rbp), %edx	# slot_cur, tmp189
	movslq	%edx, %rdx	# tmp189, tmp188
	addq	$16, %rdx	#, tmp190
	movl	12(%rax,%rdx,4), %eax	# output_60(D)->buttons_down[slot_cur_47], _30
# ../source/app.c:365:           else if (output->buttons_down[slot_cur] == button) {
	cmpl	%eax, -240(%rbp)	# _30, button
	jne	.L59	#,
# ../source/app.c:366:             slot_free = -1;
	movl	$-1, -260(%rbp)	#, slot_free
# ../source/app.c:367:             break;
	jmp	.L60	#
.L59:
# ../source/app.c:370:           ++slot_cur;
	addl	$1, -256(%rbp)	#, slot_cur
.L57:
# ../source/app.c:360:         while (slot_cur < slot_max) {
	movl	-256(%rbp), %eax	# slot_cur, tmp191
	cmpl	-236(%rbp), %eax	# slot_max, tmp191
	jl	.L61	#,
.L60:
# ../source/app.c:374:         if (slot_free != -1) {
	cmpl	$-1, -260(%rbp)	#, slot_free
	je	.L71	#,
# ../source/app.c:375:           output->buttons_down[slot_free] = button;
	movq	-288(%rbp), %rax	# output, tmp192
	movl	-260(%rbp), %edx	# slot_free, tmp194
	movslq	%edx, %rdx	# tmp194, tmp193
	leaq	16(%rdx), %rcx	#, tmp195
	movl	-240(%rbp), %edx	# button, tmp196
	movl	%edx, 12(%rax,%rcx,4)	# tmp196, output_60(D)->buttons_down[slot_free_46]
# ../source/app.c:376:           output->buttons_down_count++;
	movq	-288(%rbp), %rax	# output, tmp197
	movl	72(%rax), %eax	# output_60(D)->buttons_down_count, _31
# ../source/app.c:376:           output->buttons_down_count++;
	leal	1(%rax), %edx	#, _32
	movq	-288(%rbp), %rax	# output, tmp198
	movl	%edx, 72(%rax)	# _32, output_60(D)->buttons_down_count
# ../source/app.c:379:         break;
	jmp	.L71	#
.L42:
# ../source/app.c:385:         int button = event.xbutton.button;
	movl	-124(%rbp), %eax	# event.xbutton.button, _33
# ../source/app.c:385:         int button = event.xbutton.button;
	movl	%eax, -248(%rbp)	# _33, button
# ../source/app.c:387:         int slot_cur = 0;
	movl	$0, -252(%rbp)	#, slot_cur
# ../source/app.c:388:         int slot_max = sizeof(output->buttons_down) / sizeof(output->buttons_down[0]);
	movl	$8, -244(%rbp)	#, slot_max
# ../source/app.c:390:         while (slot_cur < slot_max) {
	jmp	.L63	#
.L66:
# ../source/app.c:392:           if (output->buttons_down[slot_cur] == button) {
	movq	-288(%rbp), %rax	# output, tmp199
	movl	-252(%rbp), %edx	# slot_cur, tmp201
	movslq	%edx, %rdx	# tmp201, tmp200
	addq	$16, %rdx	#, tmp202
	movl	12(%rax,%rdx,4), %eax	# output_60(D)->buttons_down[slot_cur_48], _34
# ../source/app.c:392:           if (output->buttons_down[slot_cur] == button) {
	cmpl	%eax, -248(%rbp)	# _34, button
	jne	.L64	#,
# ../source/app.c:394:             output->buttons_down[slot_cur] = 0;
	movq	-288(%rbp), %rax	# output, tmp203
	movl	-252(%rbp), %edx	# slot_cur, tmp205
	movslq	%edx, %rdx	# tmp205, tmp204
	addq	$16, %rdx	#, tmp206
	movl	$0, 12(%rax,%rdx,4)	#, output_60(D)->buttons_down[slot_cur_48]
# ../source/app.c:395:             output->buttons_down_count--;
	movq	-288(%rbp), %rax	# output, tmp207
	movl	72(%rax), %eax	# output_60(D)->buttons_down_count, _35
# ../source/app.c:395:             output->buttons_down_count--;
	leal	-1(%rax), %edx	#, _36
	movq	-288(%rbp), %rax	# output, tmp208
	movl	%edx, 72(%rax)	# _36, output_60(D)->buttons_down_count
# ../source/app.c:397:             break;
	nop	
# ../source/app.c:404:         break;
	jmp	.L38	#
.L64:
# ../source/app.c:401:           ++slot_cur;
	addl	$1, -252(%rbp)	#, slot_cur
.L63:
# ../source/app.c:390:         while (slot_cur < slot_max) {
	movl	-252(%rbp), %eax	# slot_cur, tmp209
	cmpl	-244(%rbp), %eax	# slot_max, tmp209
	jl	.L66	#,
# ../source/app.c:404:         break;
	jmp	.L38	#
.L40:
# ../source/app.c:411:         output->cursor_x = event.xmotion.x;
	movl	-144(%rbp), %edx	# event.xmotion.x, _37
# ../source/app.c:411:         output->cursor_x = event.xmotion.x;
	movq	-288(%rbp), %rax	# output, tmp210
	movl	%edx, 108(%rax)	# _37, output_60(D)->cursor_x
# ../source/app.c:412:         output->cursor_y = event.xmotion.y;
	movl	-140(%rbp), %edx	# event.xmotion.y, _38
# ../source/app.c:412:         output->cursor_y = event.xmotion.y;
	movq	-288(%rbp), %rax	# output, tmp211
	movl	%edx, 112(%rax)	# _38, output_60(D)->cursor_y
# ../source/app.c:414:         break;
	jmp	.L38	#
.L69:
# ../source/app.c:418:       default: break;
	nop	
	jmp	.L38	#
.L70:
# ../source/app.c:323:         break;
	nop	
	jmp	.L38	#
.L71:
# ../source/app.c:379:         break;
	nop	
.L38:
# ../source/app.c:424:   return 0;
	movl	$0, %eax	#, _96
# ../source/app.c:426: }
	movq	-8(%rbp), %rdx	# D.9202, tmp213
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp213
	je	.L68	#,
	call	__stack_chk_fail@PLT	#
.L68:
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
	movq	-40(%rbp), %rcx	# .result_ptr, tmp113
	movq	-32(%rbp), %rax	# v3, tmp114
	movq	-24(%rbp), %rdx	# v3,
	movq	%rax, (%rcx)	# tmp114, <retval>
	movq	%rdx, 8(%rcx)	#, <retval>
	movl	-16(%rbp), %eax	# v3, tmp115
	movl	%eax, 16(%rcx)	# tmp115, <retval>
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
	movq	-40(%rbp), %rcx	# .result_ptr, tmp113
	movq	-32(%rbp), %rax	# v3, tmp114
	movq	-24(%rbp), %rdx	# v3,
	movq	%rax, (%rcx)	# tmp114, <retval>
	movq	%rdx, 8(%rcx)	#, <retval>
	movl	-16(%rbp), %eax	# v3, tmp115
	movl	%eax, 16(%rcx)	# tmp115, <retval>
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
	movq	-40(%rbp), %rcx	# .result_ptr, tmp108
	movq	-32(%rbp), %rax	# v2, tmp109
	movq	-24(%rbp), %rdx	# v2,
	movq	%rax, (%rcx)	# tmp109, <retval>
	movq	%rdx, 8(%rcx)	#, <retval>
	movl	-16(%rbp), %eax	# v2, tmp110
	movl	%eax, 16(%rcx)	# tmp110, <retval>
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
	movss	-124(%rbp), %xmm0	# degrees_x, tmp226
	pxor	%xmm1, %xmm1	# tmp227
	comiss	%xmm1, %xmm0	# tmp227, tmp226
	jbe	.L79	#,
# ../source/app.c:517: 	if (degrees_x > 0.0f && degrees_x < 360.0f) {
	movss	.LC2(%rip), %xmm0	#, tmp228
	comiss	-124(%rbp), %xmm0	# degrees_x, tmp228
	jbe	.L79	#,
# ../source/app.c:519: 		t->v1.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp229
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _1
# ../source/app.c:519: 		t->v1.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _2
	movq	-120(%rbp), %rax	# t, tmp230
	movss	%xmm0, 4(%rax)	# _2, t_132(D)->v1.y
# ../source/app.c:520: 		t->v2.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp231
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _3
# ../source/app.c:520: 		t->v2.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _4
	movq	-120(%rbp), %rax	# t, tmp232
	movss	%xmm0, 24(%rax)	# _4, t_132(D)->v2.y
# ../source/app.c:521: 		t->v3.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp233
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _5
# ../source/app.c:521: 		t->v3.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _6
	movq	-120(%rbp), %rax	# t, tmp234
	movss	%xmm0, 44(%rax)	# _6, t_132(D)->v3.y
# ../source/app.c:523: 		t->v1.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp235
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _7
# ../source/app.c:523: 		t->v1.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _8
	movq	-120(%rbp), %rax	# t, tmp236
	movss	%xmm0, 8(%rax)	# _8, t_132(D)->v1.z
# ../source/app.c:524: 		t->v2.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp237
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _9
# ../source/app.c:524: 		t->v2.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _10
	movq	-120(%rbp), %rax	# t, tmp238
	movss	%xmm0, 28(%rax)	# _10, t_132(D)->v2.z
# ../source/app.c:525: 		t->v3.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp239
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _11
# ../source/app.c:525: 		t->v3.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _12
	movq	-120(%rbp), %rax	# t, tmp240
	movss	%xmm0, 48(%rax)	# _12, t_132(D)->v3.z
# ../source/app.c:528: 			rads = 3.14f / 180.0f * degrees_x,
	movss	-124(%rbp), %xmm1	# degrees_x, tmp242
	movss	.LC3(%rip), %xmm0	#, tmp243
	mulss	%xmm1, %xmm0	# tmp242, rads_141
	movss	%xmm0, -108(%rbp)	# rads_141, rads
# ../source/app.c:529: 			cosine = cosf(rads),
	movl	-108(%rbp), %eax	# rads, tmp244
	movd	%eax, %xmm0	# tmp244,
	call	cosf@PLT	#
	movd	%xmm0, %eax	#, tmp245
	movl	%eax, -104(%rbp)	# tmp245, cosine
# ../source/app.c:530: 			sine = sinf(rads);
	movl	-108(%rbp), %eax	# rads, tmp246
	movd	%eax, %xmm0	# tmp246,
	call	sinf@PLT	#
	movd	%xmm0, %eax	#, tmp247
	movl	%eax, -100(%rbp)	# tmp247, sine
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp248
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _13
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	mulss	-104(%rbp), %xmm0	# cosine, _14
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp249
	movss	8(%rax), %xmm1	# t_132(D)->v1.z, _15
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	mulss	-100(%rbp), %xmm1	# sine, _16
# ../source/app.c:533: 			ny1 = cosine * t->v1.y - sine * t->v1.z,
	subss	%xmm1, %xmm0	# _16, ny1_144
	movss	%xmm0, -96(%rbp)	# ny1_144, ny1
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp251
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _17
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	mulss	-104(%rbp), %xmm0	# cosine, _18
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp252
	movss	28(%rax), %xmm1	# t_132(D)->v2.z, _19
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	mulss	-100(%rbp), %xmm1	# sine, _20
# ../source/app.c:534: 			ny2 = cosine * t->v2.y - sine * t->v2.z,
	subss	%xmm1, %xmm0	# _20, ny2_145
	movss	%xmm0, -92(%rbp)	# ny2_145, ny2
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp254
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _21
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	mulss	-104(%rbp), %xmm0	# cosine, _22
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp255
	movss	48(%rax), %xmm1	# t_132(D)->v3.z, _23
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	mulss	-100(%rbp), %xmm1	# sine, _24
# ../source/app.c:535: 			ny3 = cosine * t->v3.y - sine * t->v3.z;
	subss	%xmm1, %xmm0	# _24, ny3_146
	movss	%xmm0, -88(%rbp)	# ny3_146, ny3
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp257
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _25
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	movaps	%xmm0, %xmm1	# _25, _25
	mulss	-100(%rbp), %xmm1	# sine, _25
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp258
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _27
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	mulss	-104(%rbp), %xmm0	# cosine, _28
# ../source/app.c:538: 			nz1 = sine * t->v1.y + cosine * t->v1.z,
	addss	%xmm1, %xmm0	# _26, nz1_147
	movss	%xmm0, -84(%rbp)	# nz1_147, nz1
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp260
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _29
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	movaps	%xmm0, %xmm1	# _29, _29
	mulss	-100(%rbp), %xmm1	# sine, _29
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp261
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _31
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	mulss	-104(%rbp), %xmm0	# cosine, _32
# ../source/app.c:539: 			nz2 = sine * t->v2.y + cosine * t->v2.z,
	addss	%xmm1, %xmm0	# _30, nz2_148
	movss	%xmm0, -80(%rbp)	# nz2_148, nz2
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp263
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _33
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	movaps	%xmm0, %xmm1	# _33, _33
	mulss	-100(%rbp), %xmm1	# sine, _33
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp264
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _35
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	mulss	-104(%rbp), %xmm0	# cosine, _36
# ../source/app.c:540: 			nz3 = sine * t->v3.y + cosine * t->v3.z;
	addss	%xmm1, %xmm0	# _34, nz3_149
	movss	%xmm0, -76(%rbp)	# nz3_149, nz3
# ../source/app.c:542: 		t->v1.y = ny1 + origin_y;
	movss	-96(%rbp), %xmm0	# ny1, tmp266
	addss	-140(%rbp), %xmm0	# origin_y, _37
# ../source/app.c:542: 		t->v1.y = ny1 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp267
	movss	%xmm0, 4(%rax)	# _37, t_132(D)->v1.y
# ../source/app.c:543: 		t->v2.y = ny2 + origin_y;
	movss	-92(%rbp), %xmm0	# ny2, tmp268
	addss	-140(%rbp), %xmm0	# origin_y, _38
# ../source/app.c:543: 		t->v2.y = ny2 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp269
	movss	%xmm0, 24(%rax)	# _38, t_132(D)->v2.y
# ../source/app.c:544: 		t->v3.y = ny3 + origin_y;
	movss	-88(%rbp), %xmm0	# ny3, tmp270
	addss	-140(%rbp), %xmm0	# origin_y, _39
# ../source/app.c:544: 		t->v3.y = ny3 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp271
	movss	%xmm0, 44(%rax)	# _39, t_132(D)->v3.y
# ../source/app.c:546: 		t->v1.z = nz1 + origin_z;
	movss	-84(%rbp), %xmm0	# nz1, tmp272
	addss	-144(%rbp), %xmm0	# origin_z, _40
# ../source/app.c:546: 		t->v1.z = nz1 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp273
	movss	%xmm0, 8(%rax)	# _40, t_132(D)->v1.z
# ../source/app.c:547: 		t->v2.z = nz2 + origin_z;
	movss	-80(%rbp), %xmm0	# nz2, tmp274
	addss	-144(%rbp), %xmm0	# origin_z, _41
# ../source/app.c:547: 		t->v2.z = nz2 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp275
	movss	%xmm0, 28(%rax)	# _41, t_132(D)->v2.z
# ../source/app.c:548: 		t->v3.z = nz3 + origin_z;
	movss	-76(%rbp), %xmm0	# nz3, tmp276
	addss	-144(%rbp), %xmm0	# origin_z, _42
# ../source/app.c:548: 		t->v3.z = nz3 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp277
	movss	%xmm0, 48(%rax)	# _42, t_132(D)->v3.z
.L79:
# ../source/app.c:552: 	if (degrees_y > 0.0f && degrees_y < 360.0f) {
	movss	-128(%rbp), %xmm0	# degrees_y, tmp278
	pxor	%xmm1, %xmm1	# tmp279
	comiss	%xmm1, %xmm0	# tmp279, tmp278
	jbe	.L82	#,
# ../source/app.c:552: 	if (degrees_y > 0.0f && degrees_y < 360.0f) {
	movss	.LC2(%rip), %xmm0	#, tmp280
	comiss	-128(%rbp), %xmm0	# degrees_y, tmp280
	jbe	.L82	#,
# ../source/app.c:554: 		t->v1.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp281
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _43
# ../source/app.c:554: 		t->v1.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _44
	movq	-120(%rbp), %rax	# t, tmp282
	movss	%xmm0, (%rax)	# _44, t_132(D)->v1.x
# ../source/app.c:555: 		t->v2.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp283
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _45
# ../source/app.c:555: 		t->v2.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _46
	movq	-120(%rbp), %rax	# t, tmp284
	movss	%xmm0, 20(%rax)	# _46, t_132(D)->v2.x
# ../source/app.c:556: 		t->v3.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp285
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _47
# ../source/app.c:556: 		t->v3.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _48
	movq	-120(%rbp), %rax	# t, tmp286
	movss	%xmm0, 40(%rax)	# _48, t_132(D)->v3.x
# ../source/app.c:558: 		t->v1.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp287
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _49
# ../source/app.c:558: 		t->v1.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _50
	movq	-120(%rbp), %rax	# t, tmp288
	movss	%xmm0, 8(%rax)	# _50, t_132(D)->v1.z
# ../source/app.c:559: 		t->v2.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp289
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _51
# ../source/app.c:559: 		t->v2.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _52
	movq	-120(%rbp), %rax	# t, tmp290
	movss	%xmm0, 28(%rax)	# _52, t_132(D)->v2.z
# ../source/app.c:560: 		t->v3.z -= origin_z;
	movq	-120(%rbp), %rax	# t, tmp291
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _53
# ../source/app.c:560: 		t->v3.z -= origin_z;
	subss	-144(%rbp), %xmm0	# origin_z, _54
	movq	-120(%rbp), %rax	# t, tmp292
	movss	%xmm0, 48(%rax)	# _54, t_132(D)->v3.z
# ../source/app.c:563: 			rads = 3.14f / 180.0f * degrees_y,
	movss	-128(%rbp), %xmm1	# degrees_y, tmp294
	movss	.LC3(%rip), %xmm0	#, tmp295
	mulss	%xmm1, %xmm0	# tmp294, rads_164
	movss	%xmm0, -72(%rbp)	# rads_164, rads
# ../source/app.c:564: 			cosine = cosf(rads),
	movl	-72(%rbp), %eax	# rads, tmp296
	movd	%eax, %xmm0	# tmp296,
	call	cosf@PLT	#
	movd	%xmm0, %eax	#, tmp297
	movl	%eax, -68(%rbp)	# tmp297, cosine
# ../source/app.c:565: 			sine = sinf(rads);
	movl	-72(%rbp), %eax	# rads, tmp298
	movd	%eax, %xmm0	# tmp298,
	call	sinf@PLT	#
	movd	%xmm0, %eax	#, tmp299
	movl	%eax, -64(%rbp)	# tmp299, sine
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp300
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _55
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	movaps	%xmm0, %xmm1	# _55, _55
	mulss	-68(%rbp), %xmm1	# cosine, _55
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	movq	-120(%rbp), %rax	# t, tmp301
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _57
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	mulss	-64(%rbp), %xmm0	# sine, _58
# ../source/app.c:568: 			nx1 = cosine * t->v1.x + sine * t->v1.z,
	addss	%xmm1, %xmm0	# _56, nx1_167
	movss	%xmm0, -60(%rbp)	# nx1_167, nx1
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp303
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _59
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	movaps	%xmm0, %xmm1	# _59, _59
	mulss	-68(%rbp), %xmm1	# cosine, _59
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	movq	-120(%rbp), %rax	# t, tmp304
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _61
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	mulss	-64(%rbp), %xmm0	# sine, _62
# ../source/app.c:569: 			nx2 = cosine * t->v2.x + sine * t->v2.z,
	addss	%xmm1, %xmm0	# _60, nx2_168
	movss	%xmm0, -56(%rbp)	# nx2_168, nx2
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp306
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _63
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	movaps	%xmm0, %xmm1	# _63, _63
	mulss	-68(%rbp), %xmm1	# cosine, _63
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	movq	-120(%rbp), %rax	# t, tmp307
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _65
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	mulss	-64(%rbp), %xmm0	# sine, _66
# ../source/app.c:570: 			nx3 = cosine * t->v3.x + sine * t->v3.z;
	addss	%xmm1, %xmm0	# _64, nx3_169
	movss	%xmm0, -52(%rbp)	# nx3_169, nx3
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	movq	-120(%rbp), %rax	# t, tmp309
	movss	8(%rax), %xmm0	# t_132(D)->v1.z, _67
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	mulss	-68(%rbp), %xmm0	# cosine, _68
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	movq	-120(%rbp), %rax	# t, tmp310
	movss	(%rax), %xmm1	# t_132(D)->v1.x, _69
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	mulss	-64(%rbp), %xmm1	# sine, _70
# ../source/app.c:573: 			nz1 = cosine * t->v1.z - sine * t->v1.x,
	subss	%xmm1, %xmm0	# _70, nz1_170
	movss	%xmm0, -48(%rbp)	# nz1_170, nz1
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	movq	-120(%rbp), %rax	# t, tmp312
	movss	28(%rax), %xmm0	# t_132(D)->v2.z, _71
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	mulss	-68(%rbp), %xmm0	# cosine, _72
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	movq	-120(%rbp), %rax	# t, tmp313
	movss	20(%rax), %xmm1	# t_132(D)->v2.x, _73
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	mulss	-64(%rbp), %xmm1	# sine, _74
# ../source/app.c:574: 			nz2 = cosine * t->v2.z - sine * t->v2.x,
	subss	%xmm1, %xmm0	# _74, nz2_171
	movss	%xmm0, -44(%rbp)	# nz2_171, nz2
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	movq	-120(%rbp), %rax	# t, tmp315
	movss	48(%rax), %xmm0	# t_132(D)->v3.z, _75
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	mulss	-68(%rbp), %xmm0	# cosine, _76
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	movq	-120(%rbp), %rax	# t, tmp316
	movss	40(%rax), %xmm1	# t_132(D)->v3.x, _77
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	mulss	-64(%rbp), %xmm1	# sine, _78
# ../source/app.c:575: 			nz3 = cosine * t->v3.z - sine * t->v3.x;
	subss	%xmm1, %xmm0	# _78, nz3_172
	movss	%xmm0, -40(%rbp)	# nz3_172, nz3
# ../source/app.c:577: 		t->v1.x = nx1 + origin_x;
	movss	-60(%rbp), %xmm0	# nx1, tmp318
	addss	-136(%rbp), %xmm0	# origin_x, _79
# ../source/app.c:577: 		t->v1.x = nx1 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp319
	movss	%xmm0, (%rax)	# _79, t_132(D)->v1.x
# ../source/app.c:578: 		t->v2.x = nx2 + origin_x;
	movss	-56(%rbp), %xmm0	# nx2, tmp320
	addss	-136(%rbp), %xmm0	# origin_x, _80
# ../source/app.c:578: 		t->v2.x = nx2 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp321
	movss	%xmm0, 20(%rax)	# _80, t_132(D)->v2.x
# ../source/app.c:579: 		t->v3.x = nx3 + origin_x;
	movss	-52(%rbp), %xmm0	# nx3, tmp322
	addss	-136(%rbp), %xmm0	# origin_x, _81
# ../source/app.c:579: 		t->v3.x = nx3 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp323
	movss	%xmm0, 40(%rax)	# _81, t_132(D)->v3.x
# ../source/app.c:581: 		t->v1.z = nz1 + origin_z;
	movss	-48(%rbp), %xmm0	# nz1, tmp324
	addss	-144(%rbp), %xmm0	# origin_z, _82
# ../source/app.c:581: 		t->v1.z = nz1 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp325
	movss	%xmm0, 8(%rax)	# _82, t_132(D)->v1.z
# ../source/app.c:582: 		t->v2.z = nz2 + origin_z;
	movss	-44(%rbp), %xmm0	# nz2, tmp326
	addss	-144(%rbp), %xmm0	# origin_z, _83
# ../source/app.c:582: 		t->v2.z = nz2 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp327
	movss	%xmm0, 28(%rax)	# _83, t_132(D)->v2.z
# ../source/app.c:583: 		t->v3.z = nz3 + origin_z;
	movss	-40(%rbp), %xmm0	# nz3, tmp328
	addss	-144(%rbp), %xmm0	# origin_z, _84
# ../source/app.c:583: 		t->v3.z = nz3 + origin_z;
	movq	-120(%rbp), %rax	# t, tmp329
	movss	%xmm0, 48(%rax)	# _84, t_132(D)->v3.z
.L82:
# ../source/app.c:587: 	if (degrees_z > 0.0f && degrees_z < 360.0f) {
	movss	-132(%rbp), %xmm0	# degrees_z, tmp330
	pxor	%xmm1, %xmm1	# tmp331
	comiss	%xmm1, %xmm0	# tmp331, tmp330
	jbe	.L85	#,
# ../source/app.c:587: 	if (degrees_z > 0.0f && degrees_z < 360.0f) {
	movss	.LC2(%rip), %xmm0	#, tmp332
	comiss	-132(%rbp), %xmm0	# degrees_z, tmp332
	jbe	.L85	#,
# ../source/app.c:589: 		t->v1.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp333
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _85
# ../source/app.c:589: 		t->v1.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _86
	movq	-120(%rbp), %rax	# t, tmp334
	movss	%xmm0, (%rax)	# _86, t_132(D)->v1.x
# ../source/app.c:590: 		t->v2.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp335
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _87
# ../source/app.c:590: 		t->v2.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _88
	movq	-120(%rbp), %rax	# t, tmp336
	movss	%xmm0, 20(%rax)	# _88, t_132(D)->v2.x
# ../source/app.c:591: 		t->v3.x -= origin_x;
	movq	-120(%rbp), %rax	# t, tmp337
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _89
# ../source/app.c:591: 		t->v3.x -= origin_x;
	subss	-136(%rbp), %xmm0	# origin_x, _90
	movq	-120(%rbp), %rax	# t, tmp338
	movss	%xmm0, 40(%rax)	# _90, t_132(D)->v3.x
# ../source/app.c:593: 		t->v1.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp339
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _91
# ../source/app.c:593: 		t->v1.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _92
	movq	-120(%rbp), %rax	# t, tmp340
	movss	%xmm0, 4(%rax)	# _92, t_132(D)->v1.y
# ../source/app.c:594: 		t->v2.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp341
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _93
# ../source/app.c:594: 		t->v2.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _94
	movq	-120(%rbp), %rax	# t, tmp342
	movss	%xmm0, 24(%rax)	# _94, t_132(D)->v2.y
# ../source/app.c:595: 		t->v3.y -= origin_y;
	movq	-120(%rbp), %rax	# t, tmp343
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _95
# ../source/app.c:595: 		t->v3.y -= origin_y;
	subss	-140(%rbp), %xmm0	# origin_y, _96
	movq	-120(%rbp), %rax	# t, tmp344
	movss	%xmm0, 44(%rax)	# _96, t_132(D)->v3.y
# ../source/app.c:598: 			rads = 3.14f / 180.0f * degrees_z,
	movss	-132(%rbp), %xmm1	# degrees_z, tmp346
	movss	.LC3(%rip), %xmm0	#, tmp347
	mulss	%xmm1, %xmm0	# tmp346, rads_186
	movss	%xmm0, -36(%rbp)	# rads_186, rads
# ../source/app.c:599: 			cosine = cosf(rads),
	movl	-36(%rbp), %eax	# rads, tmp348
	movd	%eax, %xmm0	# tmp348,
	call	cosf@PLT	#
	movd	%xmm0, %eax	#, tmp349
	movl	%eax, -32(%rbp)	# tmp349, cosine
# ../source/app.c:600: 			sine = sinf(rads);
	movl	-36(%rbp), %eax	# rads, tmp350
	movd	%eax, %xmm0	# tmp350,
	call	sinf@PLT	#
	movd	%xmm0, %eax	#, tmp351
	movl	%eax, -28(%rbp)	# tmp351, sine
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp352
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _97
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	mulss	-32(%rbp), %xmm0	# cosine, _98
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp353
	movss	4(%rax), %xmm1	# t_132(D)->v1.y, _99
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	mulss	-28(%rbp), %xmm1	# sine, _100
# ../source/app.c:603: 			nx1 = cosine * t->v1.x - sine * t->v1.y,
	subss	%xmm1, %xmm0	# _100, nx1_189
	movss	%xmm0, -24(%rbp)	# nx1_189, nx1
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp355
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _101
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	mulss	-32(%rbp), %xmm0	# cosine, _102
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp356
	movss	24(%rax), %xmm1	# t_132(D)->v2.y, _103
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	mulss	-28(%rbp), %xmm1	# sine, _104
# ../source/app.c:604: 			nx2 = cosine * t->v2.x - sine * t->v2.y,
	subss	%xmm1, %xmm0	# _104, nx2_190
	movss	%xmm0, -20(%rbp)	# nx2_190, nx2
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp358
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _105
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	mulss	-32(%rbp), %xmm0	# cosine, _106
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp359
	movss	44(%rax), %xmm1	# t_132(D)->v3.y, _107
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	mulss	-28(%rbp), %xmm1	# sine, _108
# ../source/app.c:605: 			nx3 = cosine * t->v3.x - sine * t->v3.y;
	subss	%xmm1, %xmm0	# _108, nx3_191
	movss	%xmm0, -16(%rbp)	# nx3_191, nx3
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp361
	movss	(%rax), %xmm0	# t_132(D)->v1.x, _109
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	movaps	%xmm0, %xmm1	# _109, _109
	mulss	-28(%rbp), %xmm1	# sine, _109
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	movq	-120(%rbp), %rax	# t, tmp362
	movss	4(%rax), %xmm0	# t_132(D)->v1.y, _111
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	mulss	-32(%rbp), %xmm0	# cosine, _112
# ../source/app.c:608: 			ny1 = sine * t->v1.x + cosine * t->v1.y,
	addss	%xmm1, %xmm0	# _110, ny1_192
	movss	%xmm0, -12(%rbp)	# ny1_192, ny1
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp364
	movss	20(%rax), %xmm0	# t_132(D)->v2.x, _113
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	movaps	%xmm0, %xmm1	# _113, _113
	mulss	-28(%rbp), %xmm1	# sine, _113
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	movq	-120(%rbp), %rax	# t, tmp365
	movss	24(%rax), %xmm0	# t_132(D)->v2.y, _115
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	mulss	-32(%rbp), %xmm0	# cosine, _116
# ../source/app.c:609: 			ny2 = sine * t->v2.x + cosine * t->v2.y,
	addss	%xmm1, %xmm0	# _114, ny2_193
	movss	%xmm0, -8(%rbp)	# ny2_193, ny2
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp367
	movss	40(%rax), %xmm0	# t_132(D)->v3.x, _117
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	movaps	%xmm0, %xmm1	# _117, _117
	mulss	-28(%rbp), %xmm1	# sine, _117
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	movq	-120(%rbp), %rax	# t, tmp368
	movss	44(%rax), %xmm0	# t_132(D)->v3.y, _119
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	mulss	-32(%rbp), %xmm0	# cosine, _120
# ../source/app.c:610: 			ny3 = sine * t->v3.x + cosine * t->v3.y;
	addss	%xmm1, %xmm0	# _118, ny3_194
	movss	%xmm0, -4(%rbp)	# ny3_194, ny3
# ../source/app.c:612: 		t->v1.x = nx1 + origin_x;
	movss	-24(%rbp), %xmm0	# nx1, tmp370
	addss	-136(%rbp), %xmm0	# origin_x, _121
# ../source/app.c:612: 		t->v1.x = nx1 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp371
	movss	%xmm0, (%rax)	# _121, t_132(D)->v1.x
# ../source/app.c:613: 		t->v2.x = nx2 + origin_x;
	movss	-20(%rbp), %xmm0	# nx2, tmp372
	addss	-136(%rbp), %xmm0	# origin_x, _122
# ../source/app.c:613: 		t->v2.x = nx2 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp373
	movss	%xmm0, 20(%rax)	# _122, t_132(D)->v2.x
# ../source/app.c:614: 		t->v3.x = nx3 + origin_x;
	movss	-16(%rbp), %xmm0	# nx3, tmp374
	addss	-136(%rbp), %xmm0	# origin_x, _123
# ../source/app.c:614: 		t->v3.x = nx3 + origin_x;
	movq	-120(%rbp), %rax	# t, tmp375
	movss	%xmm0, 40(%rax)	# _123, t_132(D)->v3.x
# ../source/app.c:616: 		t->v1.y = ny1 + origin_y;
	movss	-12(%rbp), %xmm0	# ny1, tmp376
	addss	-140(%rbp), %xmm0	# origin_y, _124
# ../source/app.c:616: 		t->v1.y = ny1 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp377
	movss	%xmm0, 4(%rax)	# _124, t_132(D)->v1.y
# ../source/app.c:617: 		t->v2.y = ny2 + origin_y;
	movss	-8(%rbp), %xmm0	# ny2, tmp378
	addss	-140(%rbp), %xmm0	# origin_y, _125
# ../source/app.c:617: 		t->v2.y = ny2 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp379
	movss	%xmm0, 24(%rax)	# _125, t_132(D)->v2.y
# ../source/app.c:618: 		t->v3.y = ny3 + origin_y;
	movss	-4(%rbp), %xmm0	# ny3, tmp380
	addss	-140(%rbp), %xmm0	# origin_y, _126
# ../source/app.c:618: 		t->v3.y = ny3 + origin_y;
	movq	-120(%rbp), %rax	# t, tmp381
	movss	%xmm0, 44(%rax)	# _126, t_132(D)->v3.y
.L85:
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
	movq	-24(%rbp), %rax	# t, tmp117
	movss	(%rax), %xmm1	# t_20(D)->v1.x, _1
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp118
	movss	24(%rax), %xmm0	# t_20(D)->v2.y, _2
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp119
	movss	44(%rax), %xmm2	# t_20(D)->v3.y, _3
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	subss	%xmm2, %xmm0	# _3, _4
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	mulss	%xmm0, %xmm1	# _4, _5
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp120
	movss	20(%rax), %xmm2	# t_20(D)->v2.x, _6
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp121
	movss	44(%rax), %xmm0	# t_20(D)->v3.y, _7
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp122
	movss	4(%rax), %xmm3	# t_20(D)->v1.y, _8
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	subss	%xmm3, %xmm0	# _8, _9
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	mulss	%xmm2, %xmm0	# _6, _10
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	addss	%xmm0, %xmm1	# _10, _11
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp123
	movss	40(%rax), %xmm2	# t_20(D)->v3.x, _12
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp124
	movss	4(%rax), %xmm0	# t_20(D)->v1.y, _13
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movq	-24(%rbp), %rax	# t, tmp125
	movss	24(%rax), %xmm3	# t_20(D)->v2.y, _14
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	subss	%xmm3, %xmm0	# _14, _15
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	mulss	%xmm2, %xmm0	# _12, _16
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	addss	%xmm0, %xmm1	# _16, _17
# ../source/app.c:628: 	float res = (t->v1.x * (t->v2.y - t->v3.y) + t->v2.x * (t->v3.y - t->v1.y) + t->v3.x * (t->v1.y - t->v2.y)) * 0.5f;
	movss	.LC4(%rip), %xmm0	#, tmp127
	mulss	%xmm1, %xmm0	# _17, res_21
	movss	%xmm0, -4(%rbp)	# res_21, res
# ../source/app.c:630: 	if (res < 0) res = -res;
	pxor	%xmm0, %xmm0	# tmp128
	comiss	-4(%rbp), %xmm0	# res, tmp128
	jbe	.L96	#,
# ../source/app.c:630: 	if (res < 0) res = -res;
	movss	-4(%rbp), %xmm0	# res, tmp130
	movss	.LC5(%rip), %xmm1	#, tmp131
	xorps	%xmm1, %xmm0	# tmp131, res_22
	movss	%xmm0, -4(%rbp)	# res_22, res
.L96:
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
	subq	$272, %rsp	#,
	movq	%rdi, -248(%rbp)	# t, t
	movq	%rsi, -256(%rbp)	# v, v
	movq	%rdx, -264(%rbp)	# output, output
# ../source/app.c:644: ) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp106
	movq	%rax, -8(%rbp)	# tmp106, D.9206
	xorl	%eax, %eax	# tmp106
# ../source/app.c:646: 	if (t == 0 || v == 0 || output == 0)
	cmpq	$0, -248(%rbp)	#, t
	je	.L101	#,
# ../source/app.c:646: 	if (t == 0 || v == 0 || output == 0)
	cmpq	$0, -256(%rbp)	#, v
	je	.L101	#,
# ../source/app.c:646: 	if (t == 0 || v == 0 || output == 0)
	cmpq	$0, -264(%rbp)	#, output
	jne	.L102	#,
.L101:
# ../source/app.c:647: 	  return 1;
	movl	$1, %eax	#, _7
	jmp	.L106	#
.L102:
# ../source/app.c:649: 	float all = get_triangle_area(t);
	movq	-248(%rbp), %rax	# t, tmp107
	movq	%rax, %rdi	# tmp107,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, tmp108
	movl	%eax, -228(%rbp)	# tmp108, all
# ../source/app.c:651: 	if (all == 0)
	pxor	%xmm0, %xmm0	# tmp109
	ucomiss	-228(%rbp), %xmm0	# all, tmp109
	jp	.L104	#,
	pxor	%xmm0, %xmm0	# tmp110
	ucomiss	-228(%rbp), %xmm0	# all, tmp110
	jne	.L104	#,
# ../source/app.c:652: 	  return 2;
	movl	$2, %eax	#, _7
	jmp	.L106	#
.L104:
# ../source/app.c:655: 	  t1 = {*v, t->v2, t->v3},
	movq	-256(%rbp), %rcx	# v, tmp111
	movq	(%rcx), %rax	# *v_10(D), tmp112
	movq	8(%rcx), %rdx	# *v_10(D),
	movq	%rax, -208(%rbp)	# tmp112, t1.v1
	movq	%rdx, -200(%rbp)	#, t1.v1
	movl	16(%rcx), %eax	# *v_10(D), tmp113
	movl	%eax, -192(%rbp)	# tmp113, t1.v1
	movq	-248(%rbp), %rcx	# t, tmp114
	movq	20(%rcx), %rax	# t_9(D)->v2, tmp115
	movq	28(%rcx), %rdx	# t_9(D)->v2,
	movq	%rax, -188(%rbp)	# tmp115, t1.v2
	movq	%rdx, -180(%rbp)	#, t1.v2
	movl	36(%rcx), %eax	# t_9(D)->v2, tmp116
	movl	%eax, -172(%rbp)	# tmp116, t1.v2
	movq	-248(%rbp), %rcx	# t, tmp117
	movq	40(%rcx), %rax	# t_9(D)->v3, tmp118
	movq	48(%rcx), %rdx	# t_9(D)->v3,
	movq	%rax, -168(%rbp)	# tmp118, t1.v3
	movq	%rdx, -160(%rbp)	#, t1.v3
	movl	56(%rcx), %eax	# t_9(D)->v3, tmp119
	movl	%eax, -152(%rbp)	# tmp119, t1.v3
# ../source/app.c:656: 	  t2 = {t->v1, *v, t->v3},
	movq	-248(%rbp), %rcx	# t, tmp120
	movq	(%rcx), %rax	# t_9(D)->v1, tmp121
	movq	8(%rcx), %rdx	# t_9(D)->v1,
	movq	%rax, -144(%rbp)	# tmp121, t2.v1
	movq	%rdx, -136(%rbp)	#, t2.v1
	movl	16(%rcx), %eax	# t_9(D)->v1, tmp122
	movl	%eax, -128(%rbp)	# tmp122, t2.v1
	movq	-256(%rbp), %rcx	# v, tmp123
	movq	(%rcx), %rax	# *v_10(D), tmp124
	movq	8(%rcx), %rdx	# *v_10(D),
	movq	%rax, -124(%rbp)	# tmp124, t2.v2
	movq	%rdx, -116(%rbp)	#, t2.v2
	movl	16(%rcx), %eax	# *v_10(D), tmp125
	movl	%eax, -108(%rbp)	# tmp125, t2.v2
	movq	-248(%rbp), %rcx	# t, tmp126
	movq	40(%rcx), %rax	# t_9(D)->v3, tmp127
	movq	48(%rcx), %rdx	# t_9(D)->v3,
	movq	%rax, -104(%rbp)	# tmp127, t2.v3
	movq	%rdx, -96(%rbp)	#, t2.v3
	movl	56(%rcx), %eax	# t_9(D)->v3, tmp128
	movl	%eax, -88(%rbp)	# tmp128, t2.v3
# ../source/app.c:657: 		t3 = {t->v1, t->v2, *v};
	movq	-248(%rbp), %rcx	# t, tmp129
	movq	(%rcx), %rax	# t_9(D)->v1, tmp130
	movq	8(%rcx), %rdx	# t_9(D)->v1,
	movq	%rax, -80(%rbp)	# tmp130, t3.v1
	movq	%rdx, -72(%rbp)	#, t3.v1
	movl	16(%rcx), %eax	# t_9(D)->v1, tmp131
	movl	%eax, -64(%rbp)	# tmp131, t3.v1
	movq	-248(%rbp), %rcx	# t, tmp132
	movq	20(%rcx), %rax	# t_9(D)->v2, tmp133
	movq	28(%rcx), %rdx	# t_9(D)->v2,
	movq	%rax, -60(%rbp)	# tmp133, t3.v2
	movq	%rdx, -52(%rbp)	#, t3.v2
	movl	36(%rcx), %eax	# t_9(D)->v2, tmp134
	movl	%eax, -44(%rbp)	# tmp134, t3.v2
	movq	-256(%rbp), %rcx	# v, tmp135
	movq	(%rcx), %rax	# *v_10(D), tmp136
	movq	8(%rcx), %rdx	# *v_10(D),
	movq	%rax, -40(%rbp)	# tmp136, t3.v3
	movq	%rdx, -32(%rbp)	#, t3.v3
	movl	16(%rcx), %eax	# *v_10(D), tmp137
	movl	%eax, -24(%rbp)	# tmp137, t3.v3
# ../source/app.c:659: 	float r = 1.0f / all;
	movss	.LC6(%rip), %xmm0	#, tmp139
	divss	-228(%rbp), %xmm0	# all, r_24
	movss	%xmm0, -224(%rbp)	# r_24, r
# ../source/app.c:661: 	struct barycentric_ratio ret = {0};
	movq	$0, -220(%rbp)	#, ret
	movl	$0, -212(%rbp)	#, ret
# ../source/app.c:663: 	ret.r1 = get_triangle_area(&t1) * r,
	leaq	-208(%rbp), %rax	#, tmp140
	movq	%rax, %rdi	# tmp140,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, _1
# ../source/app.c:663: 	ret.r1 = get_triangle_area(&t1) * r,
	movd	%eax, %xmm0	# _1, _1
	mulss	-224(%rbp), %xmm0	# r, _1
# ../source/app.c:663: 	ret.r1 = get_triangle_area(&t1) * r,
	movss	%xmm0, -220(%rbp)	# _2, ret.r1
# ../source/app.c:664: 	ret.r2 = get_triangle_area(&t2) * r,
	leaq	-144(%rbp), %rax	#, tmp141
	movq	%rax, %rdi	# tmp141,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, _3
# ../source/app.c:664: 	ret.r2 = get_triangle_area(&t2) * r,
	movd	%eax, %xmm0	# _3, _3
	mulss	-224(%rbp), %xmm0	# r, _3
# ../source/app.c:664: 	ret.r2 = get_triangle_area(&t2) * r,
	movss	%xmm0, -216(%rbp)	# _4, ret.r2
# ../source/app.c:665: 	ret.r3 = get_triangle_area(&t3) * r;
	leaq	-80(%rbp), %rax	#, tmp142
	movq	%rax, %rdi	# tmp142,
	call	get_triangle_area	#
	movd	%xmm0, %eax	#, _5
# ../source/app.c:665: 	ret.r3 = get_triangle_area(&t3) * r;
	movd	%eax, %xmm0	# _5, _5
	mulss	-224(%rbp), %xmm0	# r, _5
# ../source/app.c:665: 	ret.r3 = get_triangle_area(&t3) * r;
	movss	%xmm0, -212(%rbp)	# _6, ret.r3
# ../source/app.c:667: 	*output = ret;
	movq	-264(%rbp), %rax	# output, tmp143
	movq	-220(%rbp), %rdx	# ret, tmp144
	movq	%rdx, (%rax)	# tmp144, *output_11(D)
	movl	-212(%rbp), %edx	# ret, tmp145
	movl	%edx, 8(%rax)	# tmp145, *output_11(D)
# ../source/app.c:669: 	return 0;
	movl	$0, %eax	#, _7
.L106:
# ../source/app.c:671: }
	movq	-8(%rbp), %rdx	# D.9206, tmp147
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp147
	je	.L107	#,
	call	__stack_chk_fail@PLT	#
.L107:
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
# ../source/app.c:681: ) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp145
	movq	%rax, -8(%rbp)	# tmp145, D.9207
	xorl	%eax, %eax	# tmp145
# ../source/app.c:685: 	if (get_bary_ratio(t1, &t2->v1, &v1) != 0)
	movq	-64(%rbp), %rcx	# t2, _1
	leaq	-44(%rbp), %rdx	#, tmp146
	movq	-56(%rbp), %rax	# t1, tmp147
	movq	%rcx, %rsi	# _1,
	movq	%rax, %rdi	# tmp147,
	call	get_bary_ratio	#
# ../source/app.c:685: 	if (get_bary_ratio(t1, &t2->v1, &v1) != 0)
	testl	%eax, %eax	# _2
	je	.L110	#,
# ../source/app.c:686: 	  return 1;
	movl	$1, %eax	#, _43
	jmp	.L141	#
.L110:
# ../source/app.c:688: 	else if (get_bary_ratio(t1, &t2->v2, &v2) != 0)
	movq	-64(%rbp), %rax	# t2, tmp148
	leaq	20(%rax), %rcx	#, _3
	leaq	-32(%rbp), %rdx	#, tmp149
	movq	-56(%rbp), %rax	# t1, tmp150
	movq	%rcx, %rsi	# _3,
	movq	%rax, %rdi	# tmp150,
	call	get_bary_ratio	#
# ../source/app.c:688: 	else if (get_bary_ratio(t1, &t2->v2, &v2) != 0)
	testl	%eax, %eax	# _4
	je	.L112	#,
# ../source/app.c:689: 	  return 2;
	movl	$2, %eax	#, _43
	jmp	.L141	#
.L112:
# ../source/app.c:691: 	else if (get_bary_ratio(t1, &t2->v3, &v3))
	movq	-64(%rbp), %rax	# t2, tmp151
	leaq	40(%rax), %rcx	#, _5
	leaq	-20(%rbp), %rdx	#, tmp152
	movq	-56(%rbp), %rax	# t1, tmp153
	movq	%rcx, %rsi	# _5,
	movq	%rax, %rdi	# tmp153,
	call	get_bary_ratio	#
# ../source/app.c:691: 	else if (get_bary_ratio(t1, &t2->v3, &v3))
	testl	%eax, %eax	# _6
	je	.L113	#,
# ../source/app.c:692: 	  return 3;
	movl	$3, %eax	#, _43
	jmp	.L141	#
.L113:
# ../source/app.c:694: 	struct vertices_obscured ret = {0};
	movw	$0, -47(%rbp)	#, ret
	movb	$0, -45(%rbp)	#, ret
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movss	-44(%rbp), %xmm0	# v1.r1, _7
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	pxor	%xmm1, %xmm1	# tmp154
	comiss	%xmm1, %xmm0	# tmp154, _7
	jb	.L114	#,
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movss	-44(%rbp), %xmm1	# v1.r1, _8
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp155
	comiss	%xmm1, %xmm0	# _8, tmp155
	jb	.L114	#,
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	movss	-40(%rbp), %xmm0	# v1.r2, _9
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp156
	comiss	%xmm1, %xmm0	# tmp156, _9
	jb	.L114	#,
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	movss	-40(%rbp), %xmm1	# v1.r2, _10
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp157
	comiss	%xmm1, %xmm0	# _10, tmp157
	jb	.L114	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-36(%rbp), %xmm0	# v1.r3, _11
# ../source/app.c:697: 		 v1.r2 >= 0.0f && v1.r2 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp158
	comiss	%xmm1, %xmm0	# tmp158, _11
	jb	.L114	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-36(%rbp), %xmm1	# v1.r3, _12
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm0	#, tmp159
	comiss	%xmm1, %xmm0	# _12, tmp159
	jb	.L114	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-44(%rbp), %xmm1	# v1.r1, _13
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-40(%rbp), %xmm0	# v1.r2, _14
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	addss	%xmm0, %xmm1	# _14, _15
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	-36(%rbp), %xmm0	# v1.r3, _16
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	addss	%xmm1, %xmm0	# _15, _17
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm1	#, tmp160
	ucomiss	%xmm1, %xmm0	# tmp160, _17
	jp	.L114	#,
	movss	.LC6(%rip), %xmm1	#, tmp161
	ucomiss	%xmm1, %xmm0	# tmp161, _17
	jne	.L114	#,
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movl	$1, %eax	#, iftmp.15_44
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	jmp	.L122	#
.L114:
# ../source/app.c:698: 		 v1.r3 >= 0.0f && v1.r3 <= 1.0f && v1.r1 + v1.r2 + v1.r3 == 1.0f ;
	movl	$0, %eax	#, iftmp.15_44
.L122:
# ../source/app.c:696: 	ret.v1 = v1.r1 >= 0.0f && v1.r1 <= 1.0f &&
	movb	%al, -47(%rbp)	# _18, ret.v1
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movss	-32(%rbp), %xmm0	# v2.r1, _19
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	pxor	%xmm1, %xmm1	# tmp162
	comiss	%xmm1, %xmm0	# tmp162, _19
	jb	.L123	#,
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movss	-32(%rbp), %xmm1	# v2.r1, _20
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp163
	comiss	%xmm1, %xmm0	# _20, tmp163
	jb	.L123	#,
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	movss	-28(%rbp), %xmm0	# v2.r2, _21
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp164
	comiss	%xmm1, %xmm0	# tmp164, _21
	jb	.L123	#,
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	movss	-28(%rbp), %xmm1	# v2.r2, _22
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp165
	comiss	%xmm1, %xmm0	# _22, tmp165
	jb	.L123	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-24(%rbp), %xmm0	# v2.r3, _23
# ../source/app.c:701: 		 v2.r2 >= 0.0f && v2.r2 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp166
	comiss	%xmm1, %xmm0	# tmp166, _23
	jb	.L123	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-24(%rbp), %xmm1	# v2.r3, _24
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm0	#, tmp167
	comiss	%xmm1, %xmm0	# _24, tmp167
	jb	.L123	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-32(%rbp), %xmm1	# v2.r1, _25
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-28(%rbp), %xmm0	# v2.r2, _26
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	addss	%xmm0, %xmm1	# _26, _27
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	-24(%rbp), %xmm0	# v2.r3, _28
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	addss	%xmm1, %xmm0	# _27, _29
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm1	#, tmp168
	ucomiss	%xmm1, %xmm0	# tmp168, _29
	jp	.L123	#,
	movss	.LC6(%rip), %xmm1	#, tmp169
	ucomiss	%xmm1, %xmm0	# tmp169, _29
	jne	.L123	#,
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movl	$1, %eax	#, iftmp.16_45
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	jmp	.L131	#
.L123:
# ../source/app.c:702: 		 v2.r3 >= 0.0f && v2.r3 <= 1.0f && v2.r1 + v2.r2 + v2.r3 == 1.0f ;
	movl	$0, %eax	#, iftmp.16_45
.L131:
# ../source/app.c:700: 	ret.v2 = v2.r1 >= 0.0f && v2.r1 <= 1.0f &&
	movb	%al, -46(%rbp)	# _30, ret.v2
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movss	-20(%rbp), %xmm0	# v3.r1, _31
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	pxor	%xmm1, %xmm1	# tmp170
	comiss	%xmm1, %xmm0	# tmp170, _31
	jb	.L132	#,
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movss	-20(%rbp), %xmm1	# v3.r1, _32
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp171
	comiss	%xmm1, %xmm0	# _32, tmp171
	jb	.L132	#,
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	movss	-16(%rbp), %xmm0	# v3.r2, _33
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp172
	comiss	%xmm1, %xmm0	# tmp172, _33
	jb	.L132	#,
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	movss	-16(%rbp), %xmm1	# v3.r2, _34
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	movss	.LC6(%rip), %xmm0	#, tmp173
	comiss	%xmm1, %xmm0	# _34, tmp173
	jb	.L132	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-12(%rbp), %xmm0	# v3.r3, _35
# ../source/app.c:705: 		 v3.r2 >= 0.0f && v3.r2 <= 1.0f &&
	pxor	%xmm1, %xmm1	# tmp174
	comiss	%xmm1, %xmm0	# tmp174, _35
	jb	.L132	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-12(%rbp), %xmm1	# v3.r3, _36
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm0	#, tmp175
	comiss	%xmm1, %xmm0	# _36, tmp175
	jb	.L132	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-20(%rbp), %xmm1	# v3.r1, _37
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-16(%rbp), %xmm0	# v3.r2, _38
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	addss	%xmm0, %xmm1	# _38, _39
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	-12(%rbp), %xmm0	# v3.r3, _40
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	addss	%xmm1, %xmm0	# _39, _41
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movss	.LC6(%rip), %xmm1	#, tmp176
	ucomiss	%xmm1, %xmm0	# tmp176, _41
	jp	.L132	#,
	movss	.LC6(%rip), %xmm1	#, tmp177
	ucomiss	%xmm1, %xmm0	# tmp177, _41
	jne	.L132	#,
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movl	$1, %eax	#, iftmp.17_46
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	jmp	.L140	#
.L132:
# ../source/app.c:706: 		 v3.r3 >= 0.0f && v3.r3 <= 1.0f && v3.r1 + v3.r2 + v3.r3 == 1.0f ;
	movl	$0, %eax	#, iftmp.17_46
.L140:
# ../source/app.c:704: 	ret.v3 = v3.r1 >= 0.0f && v3.r1 <= 1.0f &&
	movb	%al, -45(%rbp)	# _42, ret.v3
# ../source/app.c:708: 	*output = ret;
	movq	-72(%rbp), %rax	# output, tmp178
	movzwl	-47(%rbp), %edx	# ret, tmp179
	movw	%dx, (%rax)	# tmp179, *output_64(D)
	movzbl	-45(%rbp), %edx	# ret, tmp180
	movb	%dl, 2(%rax)	# tmp180, *output_64(D)
# ../source/app.c:710: 	return 0;
	movl	$0, %eax	#, _43
.L141:
# ../source/app.c:712: }
	movq	-8(%rbp), %rdx	# D.9207, tmp182
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp182
	je	.L142	#,
	call	__stack_chk_fail@PLT	#
.L142:
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
	subq	$664, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -600(%rbp)	# t, t
	movl	%esi, -604(%rbp)	# src_width, src_width
	movl	%edx, -608(%rbp)	# src_height, src_height
	movq	%rcx, -616(%rbp)	# src_pixels, src_pixels
	movl	%r8d, -620(%rbp)	# dst_width, dst_width
	movl	%r9d, -624(%rbp)	# dst_height, dst_height
	movq	16(%rbp), %rax	# dst_pixels, tmp178
	movq	%rax, -632(%rbp)	# tmp178, dst_pixels
# ../source/app.c:718: ) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp179
	movq	%rax, -24(%rbp)	# tmp179, D.9209
	xorl	%eax, %eax	# tmp179
# ../source/app.c:720: 	if (src_pixels == 0 || dst_pixels == 0)
	cmpq	$0, -616(%rbp)	#, src_pixels
	je	.L165	#,
# ../source/app.c:720: 	if (src_pixels == 0 || dst_pixels == 0)
	cmpq	$0, -632(%rbp)	#, dst_pixels
	jne	.L166	#,
.L165:
# ../source/app.c:721: 	  return 1;
	movl	$1, %eax	#, _79
	jmp	.L188	#
.L166:
# ../source/app.c:724: 	  top = t->v1,
	movq	-600(%rbp), %rcx	# t, tmp180
	movq	(%rcx), %rax	# t_93(D)->v1, tmp181
	movq	8(%rcx), %rdx	# t_93(D)->v1,
	movq	%rax, -592(%rbp)	# tmp181, top
	movq	%rdx, -584(%rbp)	#, top
	movl	16(%rcx), %eax	# t_93(D)->v1, tmp182
	movl	%eax, -576(%rbp)	# tmp182, top
# ../source/app.c:725: 	  mid = t->v2,
	movq	-600(%rbp), %rcx	# t, tmp183
	movq	20(%rcx), %rax	# t_93(D)->v2, tmp184
	movq	28(%rcx), %rdx	# t_93(D)->v2,
	movq	%rax, -560(%rbp)	# tmp184, mid
	movq	%rdx, -552(%rbp)	#, mid
	movl	36(%rcx), %eax	# t_93(D)->v2, tmp185
	movl	%eax, -544(%rbp)	# tmp185, mid
# ../source/app.c:726: 	  bot = t->v3;
	movq	-600(%rbp), %rcx	# t, tmp186
	movq	40(%rcx), %rax	# t_93(D)->v3, tmp187
	movq	48(%rcx), %rdx	# t_93(D)->v3,
	movq	%rax, -528(%rbp)	# tmp187, bot
	movq	%rdx, -520(%rbp)	#, bot
	movl	56(%rcx), %eax	# t_93(D)->v3, tmp188
	movl	%eax, -512(%rbp)	# tmp188, bot
# ../source/app.c:728: 	if (top.y < mid.y) {
	movss	-588(%rbp), %xmm1	# top.y, _1
# ../source/app.c:728: 	if (top.y < mid.y) {
	movss	-556(%rbp), %xmm0	# mid.y, _2
# ../source/app.c:728: 	if (top.y < mid.y) {
	comiss	%xmm1, %xmm0	# _1, _2
	jbe	.L168	#,
# ../source/app.c:729: 		struct vec5 temp = top;
	movq	-592(%rbp), %rax	# top, tmp189
	movq	-584(%rbp), %rdx	# top,
	movq	%rax, -48(%rbp)	# tmp189, MEM[(struct vec5 *)_169]
	movq	%rdx, -40(%rbp)	#, MEM[(struct vec5 *)_169]
	movl	-576(%rbp), %eax	# top, tmp190
	movl	%eax, -32(%rbp)	# tmp190, MEM[(struct vec5 *)_169]
# ../source/app.c:730: 		top = mid;
	movq	-560(%rbp), %rax	# mid, tmp191
	movq	-552(%rbp), %rdx	# mid,
	movq	%rax, -592(%rbp)	# tmp191, top
	movq	%rdx, -584(%rbp)	#, top
	movl	-544(%rbp), %eax	# mid, tmp192
	movl	%eax, -576(%rbp)	# tmp192, top
# ../source/app.c:731: 		mid = temp;
	movq	-48(%rbp), %rax	# MEM[(struct vec5 *)_169], tmp193
	movq	-40(%rbp), %rdx	# MEM[(struct vec5 *)_169],
	movq	%rax, -560(%rbp)	# tmp193, mid
	movq	%rdx, -552(%rbp)	#, mid
	movl	-32(%rbp), %eax	# MEM[(struct vec5 *)_169], tmp194
	movl	%eax, -544(%rbp)	# tmp194, mid
.L168:
# ../source/app.c:734: 	if (mid.y < bot.y) {
	movss	-556(%rbp), %xmm1	# mid.y, _3
# ../source/app.c:734: 	if (mid.y < bot.y) {
	movss	-524(%rbp), %xmm0	# bot.y, _4
# ../source/app.c:734: 	if (mid.y < bot.y) {
	comiss	%xmm1, %xmm0	# _3, _4
	jbe	.L170	#,
# ../source/app.c:735: 		struct vec5 temp = mid;
	movq	-560(%rbp), %rax	# mid, tmp195
	movq	-552(%rbp), %rdx	# mid,
	movq	%rax, -48(%rbp)	# tmp195, MEM[(struct vec5 *)_169]
	movq	%rdx, -40(%rbp)	#, MEM[(struct vec5 *)_169]
	movl	-544(%rbp), %eax	# mid, tmp196
	movl	%eax, -32(%rbp)	# tmp196, MEM[(struct vec5 *)_169]
# ../source/app.c:736: 		mid = bot;
	movq	-528(%rbp), %rax	# bot, tmp197
	movq	-520(%rbp), %rdx	# bot,
	movq	%rax, -560(%rbp)	# tmp197, mid
	movq	%rdx, -552(%rbp)	#, mid
	movl	-512(%rbp), %eax	# bot, tmp198
	movl	%eax, -544(%rbp)	# tmp198, mid
# ../source/app.c:737: 		bot = temp;
	movq	-48(%rbp), %rax	# MEM[(struct vec5 *)_169], tmp199
	movq	-40(%rbp), %rdx	# MEM[(struct vec5 *)_169],
	movq	%rax, -528(%rbp)	# tmp199, bot
	movq	%rdx, -520(%rbp)	#, bot
	movl	-32(%rbp), %eax	# MEM[(struct vec5 *)_169], tmp200
	movl	%eax, -512(%rbp)	# tmp200, bot
.L170:
# ../source/app.c:740: 	if (top.y < mid.y) {
	movss	-588(%rbp), %xmm1	# top.y, _5
# ../source/app.c:740: 	if (top.y < mid.y) {
	movss	-556(%rbp), %xmm0	# mid.y, _6
# ../source/app.c:740: 	if (top.y < mid.y) {
	comiss	%xmm1, %xmm0	# _5, _6
	jbe	.L172	#,
# ../source/app.c:741: 	  struct vec5 temp = top;
	movq	-592(%rbp), %rax	# top, tmp201
	movq	-584(%rbp), %rdx	# top,
	movq	%rax, -48(%rbp)	# tmp201, MEM[(struct vec5 *)_169]
	movq	%rdx, -40(%rbp)	#, MEM[(struct vec5 *)_169]
	movl	-576(%rbp), %eax	# top, tmp202
	movl	%eax, -32(%rbp)	# tmp202, MEM[(struct vec5 *)_169]
# ../source/app.c:742: 		top = mid;
	movq	-560(%rbp), %rax	# mid, tmp203
	movq	-552(%rbp), %rdx	# mid,
	movq	%rax, -592(%rbp)	# tmp203, top
	movq	%rdx, -584(%rbp)	#, top
	movl	-544(%rbp), %eax	# mid, tmp204
	movl	%eax, -576(%rbp)	# tmp204, top
# ../source/app.c:743: 		mid = temp;
	movq	-48(%rbp), %rax	# MEM[(struct vec5 *)_169], tmp205
	movq	-40(%rbp), %rdx	# MEM[(struct vec5 *)_169],
	movq	%rax, -560(%rbp)	# tmp205, mid
	movq	%rdx, -552(%rbp)	#, mid
	movl	-32(%rbp), %eax	# MEM[(struct vec5 *)_169], tmp206
	movl	%eax, -544(%rbp)	# tmp206, mid
.L172:
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	movss	-588(%rbp), %xmm0	# top.y, _7
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	movss	-524(%rbp), %xmm1	# bot.y, _8
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	ucomiss	%xmm1, %xmm0	# _8, _7
	jp	.L174	#,
	ucomiss	%xmm1, %xmm0	# _8, _7
	jne	.L174	#,
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	movl	$2, %eax	#, _79
# ../source/app.c:746: 	if (top.y == bot.y) return 2;
	jmp	.L188	#
.L174:
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movss	-588(%rbp), %xmm0	# top.y, _9
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movss	-524(%rbp), %xmm2	# bot.y, _10
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movaps	%xmm0, %xmm1	# _9, _9
	subss	%xmm2, %xmm1	# _10, _9
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	movss	.LC6(%rip), %xmm0	#, tmp207
	divss	%xmm1, %xmm0	# _11, tmp207
	movd	%xmm0, %ebx	# tmp207, _12
	leaq	-176(%rbp), %rsi	#, tmp208
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp209
	movq	-528(%rbp), %rax	# bot, tmp210
	movq	-520(%rbp), %rdx	# bot,
	movq	%rax, (%rcx)	# tmp210,
	movq	%rdx, 8(%rcx)	#,
	movl	-512(%rbp), %eax	# bot, tmp211
	movl	%eax, 16(%rcx)	# tmp211,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp212
	movq	-592(%rbp), %rax	# top, tmp213
	movq	-584(%rbp), %rdx	# top,
	movq	%rax, (%rcx)	# tmp213,
	movq	%rdx, 8(%rcx)	#,
	movl	-576(%rbp), %eax	# top, tmp214
	movl	%eax, 16(%rcx)	# tmp214,
	movq	%rsi, %rdi	# tmp208,
	call	sub_vec5	#
	addq	$48, %rsp	#,
# ../source/app.c:749: 	  topbotstep = scl_vec5(sub_vec5(top, bot), 1.0f / (top.y - bot.y)),
	leaq	-496(%rbp), %rsi	#, tmp215
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp216
	movq	-176(%rbp), %rax	# D.9155, tmp217
	movq	-168(%rbp), %rdx	# D.9155,
	movq	%rax, (%rcx)	# tmp217,
	movq	%rdx, 8(%rcx)	#,
	movl	-160(%rbp), %eax	# D.9155, tmp218
	movl	%eax, 16(%rcx)	# tmp218,
	movd	%ebx, %xmm0	# _12,
	movq	%rsi, %rdi	# tmp215,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movss	-588(%rbp), %xmm0	# top.y, _13
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movss	-556(%rbp), %xmm2	# mid.y, _14
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movaps	%xmm0, %xmm1	# _13, _13
	subss	%xmm2, %xmm1	# _14, _13
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	movss	.LC6(%rip), %xmm0	#, tmp219
	divss	%xmm1, %xmm0	# _15, tmp219
	movd	%xmm0, %ebx	# tmp219, _16
	leaq	-144(%rbp), %rsi	#, tmp220
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp221
	movq	-560(%rbp), %rax	# mid, tmp222
	movq	-552(%rbp), %rdx	# mid,
	movq	%rax, (%rcx)	# tmp222,
	movq	%rdx, 8(%rcx)	#,
	movl	-544(%rbp), %eax	# mid, tmp223
	movl	%eax, 16(%rcx)	# tmp223,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp224
	movq	-592(%rbp), %rax	# top, tmp225
	movq	-584(%rbp), %rdx	# top,
	movq	%rax, (%rcx)	# tmp225,
	movq	%rdx, 8(%rcx)	#,
	movl	-576(%rbp), %eax	# top, tmp226
	movl	%eax, 16(%rcx)	# tmp226,
	movq	%rsi, %rdi	# tmp220,
	call	sub_vec5	#
	addq	$48, %rsp	#,
# ../source/app.c:750: 		topmidstep = scl_vec5(sub_vec5(top, mid), 1.0f / (top.y - mid.y)),
	leaq	-464(%rbp), %rsi	#, tmp227
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp228
	movq	-144(%rbp), %rax	# D.9156, tmp229
	movq	-136(%rbp), %rdx	# D.9156,
	movq	%rax, (%rcx)	# tmp229,
	movq	%rdx, 8(%rcx)	#,
	movl	-128(%rbp), %eax	# D.9156, tmp230
	movl	%eax, 16(%rcx)	# tmp230,
	movd	%ebx, %xmm0	# _16,
	movq	%rsi, %rdi	# tmp227,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movss	-556(%rbp), %xmm0	# mid.y, _17
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movss	-524(%rbp), %xmm2	# bot.y, _18
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movaps	%xmm0, %xmm1	# _17, _17
	subss	%xmm2, %xmm1	# _18, _17
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	movss	.LC6(%rip), %xmm0	#, tmp231
	divss	%xmm1, %xmm0	# _19, tmp231
	movd	%xmm0, %ebx	# tmp231, _20
	leaq	-112(%rbp), %rsi	#, tmp232
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp233
	movq	-528(%rbp), %rax	# bot, tmp234
	movq	-520(%rbp), %rdx	# bot,
	movq	%rax, (%rcx)	# tmp234,
	movq	%rdx, 8(%rcx)	#,
	movl	-512(%rbp), %eax	# bot, tmp235
	movl	%eax, 16(%rcx)	# tmp235,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp236
	movq	-560(%rbp), %rax	# mid, tmp237
	movq	-552(%rbp), %rdx	# mid,
	movq	%rax, (%rcx)	# tmp237,
	movq	%rdx, 8(%rcx)	#,
	movl	-544(%rbp), %eax	# mid, tmp238
	movl	%eax, 16(%rcx)	# tmp238,
	movq	%rsi, %rdi	# tmp232,
	call	sub_vec5	#
	addq	$48, %rsp	#,
# ../source/app.c:751: 		midbotstep = scl_vec5(sub_vec5(mid, bot), 1.0f / (mid.y - bot.y));
	leaq	-432(%rbp), %rsi	#, tmp239
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp240
	movq	-112(%rbp), %rax	# D.9157, tmp241
	movq	-104(%rbp), %rdx	# D.9157,
	movq	%rax, (%rcx)	# tmp241,
	movq	%rdx, 8(%rcx)	#,
	movl	-96(%rbp), %eax	# D.9157, tmp242
	movl	%eax, 16(%rcx)	# tmp242,
	movd	%ebx, %xmm0	# _20,
	movq	%rsi, %rdi	# tmp239,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:754:     topbotcur = top,
	movq	-592(%rbp), %rax	# top, tmp243
	movq	-584(%rbp), %rdx	# top,
	movq	%rax, -400(%rbp)	# tmp243, topbotcur
	movq	%rdx, -392(%rbp)	#, topbotcur
	movl	-576(%rbp), %eax	# top, tmp244
	movl	%eax, -384(%rbp)	# tmp244, topbotcur
# ../source/app.c:755:     topmidcur = top,
	movq	-592(%rbp), %rax	# top, tmp245
	movq	-584(%rbp), %rdx	# top,
	movq	%rax, -368(%rbp)	# tmp245, topmidcur
	movq	%rdx, -360(%rbp)	#, topmidcur
	movl	-576(%rbp), %eax	# top, tmp246
	movl	%eax, -352(%rbp)	# tmp246, topmidcur
# ../source/app.c:756:     midbotcur = mid;
	movq	-560(%rbp), %rax	# mid, tmp247
	movq	-552(%rbp), %rdx	# mid,
	movq	%rax, -336(%rbp)	# tmp247, midbotcur
	movq	%rdx, -328(%rbp)	#, midbotcur
	movl	-544(%rbp), %eax	# mid, tmp248
	movl	%eax, -320(%rbp)	# tmp248, midbotcur
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	jmp	.L176	#
.L181:
# ../source/app.c:761: 		  start = topbotcur,
	movq	-400(%rbp), %rax	# topbotcur, tmp249
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, -272(%rbp)	# tmp249, MEM[(struct vec5 *)_170]
	movq	%rdx, -264(%rbp)	#, MEM[(struct vec5 *)_170]
	movl	-384(%rbp), %eax	# topbotcur, tmp250
	movl	%eax, -256(%rbp)	# tmp250, MEM[(struct vec5 *)_170]
# ../source/app.c:762: 		  end   = topmidcur;
	movq	-368(%rbp), %rax	# topmidcur, tmp251
	movq	-360(%rbp), %rdx	# topmidcur,
	movq	%rax, -240(%rbp)	# tmp251, MEM[(struct vec5 *)_171]
	movq	%rdx, -232(%rbp)	#, MEM[(struct vec5 *)_171]
	movl	-352(%rbp), %eax	# topmidcur, tmp252
	movl	%eax, -224(%rbp)	# tmp252, MEM[(struct vec5 *)_171]
# ../source/app.c:764: 		if (end.x < start.x) {
	movss	-240(%rbp), %xmm1	# MEM[(struct vec5 *)_171].x, _21
# ../source/app.c:764: 		if (end.x < start.x) {
	movss	-272(%rbp), %xmm0	# MEM[(struct vec5 *)_170].x, _22
# ../source/app.c:764: 		if (end.x < start.x) {
	comiss	%xmm1, %xmm0	# _21, _22
	jbe	.L177	#,
# ../source/app.c:765: 		  struct vec5 temp = end;
	movq	-240(%rbp), %rax	# MEM[(struct vec5 *)_171], tmp253
	movq	-232(%rbp), %rdx	# MEM[(struct vec5 *)_171],
	movq	%rax, -48(%rbp)	# tmp253, MEM[(struct vec5 *)_169]
	movq	%rdx, -40(%rbp)	#, MEM[(struct vec5 *)_169]
	movl	-224(%rbp), %eax	# MEM[(struct vec5 *)_171], tmp254
	movl	%eax, -32(%rbp)	# tmp254, MEM[(struct vec5 *)_169]
# ../source/app.c:766: 		  end   = start;
	movq	-272(%rbp), %rax	# MEM[(struct vec5 *)_170], tmp255
	movq	-264(%rbp), %rdx	# MEM[(struct vec5 *)_170],
	movq	%rax, -240(%rbp)	# tmp255, MEM[(struct vec5 *)_171]
	movq	%rdx, -232(%rbp)	#, MEM[(struct vec5 *)_171]
	movl	-256(%rbp), %eax	# MEM[(struct vec5 *)_170], tmp256
	movl	%eax, -224(%rbp)	# tmp256, MEM[(struct vec5 *)_171]
# ../source/app.c:767: 		  start = temp;
	movq	-48(%rbp), %rax	# MEM[(struct vec5 *)_169], tmp257
	movq	-40(%rbp), %rdx	# MEM[(struct vec5 *)_169],
	movq	%rax, -272(%rbp)	# tmp257, MEM[(struct vec5 *)_170]
	movq	%rdx, -264(%rbp)	#, MEM[(struct vec5 *)_170]
	movl	-32(%rbp), %eax	# MEM[(struct vec5 *)_169], tmp258
	movl	%eax, -256(%rbp)	# tmp258, MEM[(struct vec5 *)_170]
.L177:
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-240(%rbp), %xmm0	# MEM[(struct vec5 *)_171].x, _23
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-272(%rbp), %xmm2	# MEM[(struct vec5 *)_170].x, _24
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movaps	%xmm0, %xmm1	# _23, _23
	subss	%xmm2, %xmm1	# _24, _23
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	.LC6(%rip), %xmm0	#, tmp259
	divss	%xmm1, %xmm0	# _25, tmp259
	movd	%xmm0, %ebx	# tmp259, _26
	leaq	-80(%rbp), %rsi	#, tmp260
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp261
	movq	-272(%rbp), %rax	# MEM[(struct vec5 *)_170], tmp262
	movq	-264(%rbp), %rdx	# MEM[(struct vec5 *)_170],
	movq	%rax, (%rcx)	# tmp262,
	movq	%rdx, 8(%rcx)	#,
	movl	-256(%rbp), %eax	# MEM[(struct vec5 *)_170], tmp263
	movl	%eax, 16(%rcx)	# tmp263,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp264
	movq	-240(%rbp), %rax	# MEM[(struct vec5 *)_171], tmp265
	movq	-232(%rbp), %rdx	# MEM[(struct vec5 *)_171],
	movq	%rax, (%rcx)	# tmp265,
	movq	%rdx, 8(%rcx)	#,
	movl	-224(%rbp), %eax	# MEM[(struct vec5 *)_171], tmp266
	movl	%eax, 16(%rcx)	# tmp266,
	movq	%rsi, %rdi	# tmp260,
	call	sub_vec5	#
	addq	$48, %rsp	#,
# ../source/app.c:770: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	leaq	-208(%rbp), %rsi	#, tmp267
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp268
	movq	-80(%rbp), %rax	# D.9160, tmp269
	movq	-72(%rbp), %rdx	# D.9160,
	movq	%rax, (%rcx)	# tmp269,
	movq	%rdx, 8(%rcx)	#,
	movl	-64(%rbp), %eax	# D.9160, tmp270
	movl	%eax, 16(%rcx)	# tmp270,
	movd	%ebx, %xmm0	# _26,
	movq	%rsi, %rdi	# tmp267,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:771: 		struct vec5 startendcur  = start;
	movq	-272(%rbp), %rax	# MEM[(struct vec5 *)_170], tmp271
	movq	-264(%rbp), %rdx	# MEM[(struct vec5 *)_170],
	movq	%rax, -48(%rbp)	# tmp271, MEM[(struct vec5 *)_169]
	movq	%rdx, -40(%rbp)	#, MEM[(struct vec5 *)_169]
	movl	-256(%rbp), %eax	# MEM[(struct vec5 *)_170], tmp272
	movl	%eax, -32(%rbp)	# tmp272, MEM[(struct vec5 *)_169]
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	jmp	.L179	#
.L180:
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-32(%rbp), %xmm0	# MEM[(struct vec5 *)_169].v, _27
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _27, _28
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-604(%rbp), %eax	# src_width, _28
	movl	%eax, %edx	# _28, _29
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-36(%rbp), %xmm0	# MEM[(struct vec5 *)_169].u, _30
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _30, _31
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _29, _32
	cltq
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _34
	movq	-616(%rbp), %rax	# src_pixels, tmp273
	leaq	(%rdx,%rax), %rcx	#, _35
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-44(%rbp), %xmm0	# MEM[(struct vec5 *)_169].y, _36
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _36, _37
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-620(%rbp), %eax	# dst_width, _37
	movl	%eax, %edx	# _37, _38
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-48(%rbp), %xmm0	# MEM[(struct vec5 *)_169].x, _39
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _39, _40
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _38, _41
	cltq
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _43
	movq	-632(%rbp), %rax	# dst_pixels, tmp274
	addq	%rax, %rdx	# tmp274, _44
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	(%rcx), %eax	# *_35, _45
# ../source/app.c:774: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	%eax, (%rdx)	# _45, *_44
# ../source/app.c:775: 			startendcur = add_vec5(startendcur, startendstep);
	leaq	-48(%rbp), %rsi	#, tmp275
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp276
	movq	-208(%rbp), %rax	# MEM[(struct vec5 *)_172], tmp277
	movq	-200(%rbp), %rdx	# MEM[(struct vec5 *)_172],
	movq	%rax, (%rcx)	# tmp277,
	movq	%rdx, 8(%rcx)	#,
	movl	-192(%rbp), %eax	# MEM[(struct vec5 *)_172], tmp278
	movl	%eax, 16(%rcx)	# tmp278,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp279
	movq	-48(%rbp), %rax	# MEM[(struct vec5 *)_169], tmp280
	movq	-40(%rbp), %rdx	# MEM[(struct vec5 *)_169],
	movq	%rax, (%rcx)	# tmp280,
	movq	%rdx, 8(%rcx)	#,
	movl	-32(%rbp), %eax	# MEM[(struct vec5 *)_169], tmp281
	movl	%eax, 16(%rcx)	# tmp281,
	movq	%rsi, %rdi	# tmp275,
	call	add_vec5	#
	addq	$48, %rsp	#,
.L179:
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	movss	-48(%rbp), %xmm1	# MEM[(struct vec5 *)_169].x, _46
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	movss	-240(%rbp), %xmm0	# MEM[(struct vec5 *)_171].x, _47
# ../source/app.c:773: 		while (startendcur.x < end.x) {
	comiss	%xmm1, %xmm0	# _46, _47
	ja	.L180	#,
# ../source/app.c:778: 		topbotcur = sub_vec5(topbotcur, topbotstep);
	leaq	-400(%rbp), %rsi	#, tmp282
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp283
	movq	-496(%rbp), %rax	# topbotstep, tmp284
	movq	-488(%rbp), %rdx	# topbotstep,
	movq	%rax, (%rcx)	# tmp284,
	movq	%rdx, 8(%rcx)	#,
	movl	-480(%rbp), %eax	# topbotstep, tmp285
	movl	%eax, 16(%rcx)	# tmp285,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp286
	movq	-400(%rbp), %rax	# topbotcur, tmp287
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, (%rcx)	# tmp287,
	movq	%rdx, 8(%rcx)	#,
	movl	-384(%rbp), %eax	# topbotcur, tmp288
	movl	%eax, 16(%rcx)	# tmp288,
	movq	%rsi, %rdi	# tmp282,
	call	sub_vec5	#
	addq	$48, %rsp	#,
# ../source/app.c:779: 	  topmidcur = sub_vec5(topmidcur, topmidstep);
	leaq	-368(%rbp), %rsi	#, tmp289
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp290
	movq	-464(%rbp), %rax	# topmidstep, tmp291
	movq	-456(%rbp), %rdx	# topmidstep,
	movq	%rax, (%rcx)	# tmp291,
	movq	%rdx, 8(%rcx)	#,
	movl	-448(%rbp), %eax	# topmidstep, tmp292
	movl	%eax, 16(%rcx)	# tmp292,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp293
	movq	-368(%rbp), %rax	# topmidcur, tmp294
	movq	-360(%rbp), %rdx	# topmidcur,
	movq	%rax, (%rcx)	# tmp294,
	movq	%rdx, 8(%rcx)	#,
	movl	-352(%rbp), %eax	# topmidcur, tmp295
	movl	%eax, 16(%rcx)	# tmp295,
	movq	%rsi, %rdi	# tmp289,
	call	sub_vec5	#
	addq	$48, %rsp	#,
.L176:
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	movss	-364(%rbp), %xmm0	# topmidcur.y, _48
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	movss	-556(%rbp), %xmm1	# mid.y, _49
# ../source/app.c:758: 	while (topmidcur.y > mid.y) {
	comiss	%xmm1, %xmm0	# _49, _48
	ja	.L181	#,
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	jmp	.L182	#
.L187:
# ../source/app.c:786: 		  start = topbotcur,
	movq	-400(%rbp), %rax	# topbotcur, tmp296
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, -304(%rbp)	# tmp296, start
	movq	%rdx, -296(%rbp)	#, start
	movl	-384(%rbp), %eax	# topbotcur, tmp297
	movl	%eax, -288(%rbp)	# tmp297, start
# ../source/app.c:787: 		  end   = midbotcur;
	movq	-336(%rbp), %rax	# midbotcur, tmp298
	movq	-328(%rbp), %rdx	# midbotcur,
	movq	%rax, -272(%rbp)	# tmp298, MEM[(struct vec5 *)_170]
	movq	%rdx, -264(%rbp)	#, MEM[(struct vec5 *)_170]
	movl	-320(%rbp), %eax	# midbotcur, tmp299
	movl	%eax, -256(%rbp)	# tmp299, MEM[(struct vec5 *)_170]
# ../source/app.c:789: 		if (end.x < start.x) {
	movss	-272(%rbp), %xmm1	# MEM[(struct vec5 *)_170].x, _50
# ../source/app.c:789: 		if (end.x < start.x) {
	movss	-304(%rbp), %xmm0	# start.x, _51
# ../source/app.c:789: 		if (end.x < start.x) {
	comiss	%xmm1, %xmm0	# _50, _51
	jbe	.L183	#,
# ../source/app.c:790: 		  struct vec5 temp = end;
	movq	-272(%rbp), %rax	# MEM[(struct vec5 *)_170], tmp300
	movq	-264(%rbp), %rdx	# MEM[(struct vec5 *)_170],
	movq	%rax, -208(%rbp)	# tmp300, MEM[(struct vec5 *)_172]
	movq	%rdx, -200(%rbp)	#, MEM[(struct vec5 *)_172]
	movl	-256(%rbp), %eax	# MEM[(struct vec5 *)_170], tmp301
	movl	%eax, -192(%rbp)	# tmp301, MEM[(struct vec5 *)_172]
# ../source/app.c:791: 		  end   = start;
	movq	-304(%rbp), %rax	# start, tmp302
	movq	-296(%rbp), %rdx	# start,
	movq	%rax, -272(%rbp)	# tmp302, MEM[(struct vec5 *)_170]
	movq	%rdx, -264(%rbp)	#, MEM[(struct vec5 *)_170]
	movl	-288(%rbp), %eax	# start, tmp303
	movl	%eax, -256(%rbp)	# tmp303, MEM[(struct vec5 *)_170]
# ../source/app.c:792: 		  start = temp;
	movq	-208(%rbp), %rax	# MEM[(struct vec5 *)_172], tmp304
	movq	-200(%rbp), %rdx	# MEM[(struct vec5 *)_172],
	movq	%rax, -304(%rbp)	# tmp304, start
	movq	%rdx, -296(%rbp)	#, start
	movl	-192(%rbp), %eax	# MEM[(struct vec5 *)_172], tmp305
	movl	%eax, -288(%rbp)	# tmp305, start
.L183:
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-272(%rbp), %xmm0	# MEM[(struct vec5 *)_170].x, _52
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	-304(%rbp), %xmm2	# start.x, _53
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movaps	%xmm0, %xmm1	# _52, _52
	subss	%xmm2, %xmm1	# _53, _52
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	movss	.LC6(%rip), %xmm0	#, tmp306
	divss	%xmm1, %xmm0	# _54, tmp306
	movd	%xmm0, %ebx	# tmp306, _55
	leaq	-48(%rbp), %rsi	#, tmp307
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp308
	movq	-304(%rbp), %rax	# start, tmp309
	movq	-296(%rbp), %rdx	# start,
	movq	%rax, (%rcx)	# tmp309,
	movq	%rdx, 8(%rcx)	#,
	movl	-288(%rbp), %eax	# start, tmp310
	movl	%eax, 16(%rcx)	# tmp310,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp311
	movq	-272(%rbp), %rax	# MEM[(struct vec5 *)_170], tmp312
	movq	-264(%rbp), %rdx	# MEM[(struct vec5 *)_170],
	movq	%rax, (%rcx)	# tmp312,
	movq	%rdx, 8(%rcx)	#,
	movl	-256(%rbp), %eax	# MEM[(struct vec5 *)_170], tmp313
	movl	%eax, 16(%rcx)	# tmp313,
	movq	%rsi, %rdi	# tmp307,
	call	sub_vec5	#
	addq	$48, %rsp	#,
# ../source/app.c:795: 		struct vec5 startendstep = scl_vec5(sub_vec5(end, start), 1.0f / (end.x - start.x));
	leaq	-240(%rbp), %rsi	#, tmp314
	subq	$8, %rsp	#,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp315
	movq	-48(%rbp), %rax	# MEM[(struct vec5 *)_169], tmp316
	movq	-40(%rbp), %rdx	# MEM[(struct vec5 *)_169],
	movq	%rax, (%rcx)	# tmp316,
	movq	%rdx, 8(%rcx)	#,
	movl	-32(%rbp), %eax	# MEM[(struct vec5 *)_169], tmp317
	movl	%eax, 16(%rcx)	# tmp317,
	movd	%ebx, %xmm0	# _55,
	movq	%rsi, %rdi	# tmp314,
	call	scl_vec5	#
	addq	$32, %rsp	#,
# ../source/app.c:796: 		struct vec5 startendcur = start;
	movq	-304(%rbp), %rax	# start, tmp318
	movq	-296(%rbp), %rdx	# start,
	movq	%rax, -208(%rbp)	# tmp318, MEM[(struct vec5 *)_172]
	movq	%rdx, -200(%rbp)	#, MEM[(struct vec5 *)_172]
	movl	-288(%rbp), %eax	# start, tmp319
	movl	%eax, -192(%rbp)	# tmp319, MEM[(struct vec5 *)_172]
# ../source/app.c:798: 		while (startendcur.x < end.x) {
	jmp	.L185	#
.L186:
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-192(%rbp), %xmm0	# MEM[(struct vec5 *)_172].v, _56
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _56, _57
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-604(%rbp), %eax	# src_width, _57
	movl	%eax, %edx	# _57, _58
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-196(%rbp), %xmm0	# MEM[(struct vec5 *)_172].u, _59
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _59, _60
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _58, _61
	cltq
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _63
	movq	-616(%rbp), %rax	# src_pixels, tmp320
	leaq	(%rdx,%rax), %rcx	#, _64
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-204(%rbp), %xmm0	# MEM[(struct vec5 *)_172].y, _65
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _65, _66
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	imull	-620(%rbp), %eax	# dst_width, _66
	movl	%eax, %edx	# _66, _67
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movss	-208(%rbp), %xmm0	# MEM[(struct vec5 *)_172].x, _68
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	cvttss2sil	%xmm0, %eax	# _68, _69
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	addl	%edx, %eax	# _67, _70
	cltq
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	leaq	0(,%rax,4), %rdx	#, _72
	movq	-632(%rbp), %rax	# dst_pixels, tmp321
	addq	%rax, %rdx	# tmp321, _73
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	(%rcx), %eax	# *_64, _74
# ../source/app.c:799: 		  dst_pixels[(int)startendcur.y * dst_width + (int)startendcur.x] = src_pixels[(int)startendcur.v * src_width + (int)startendcur.u];
	movl	%eax, (%rdx)	# _74, *_73
# ../source/app.c:800: 			startendcur = add_vec5(startendcur, startendstep);
	leaq	-208(%rbp), %rsi	#, tmp322
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp323
	movq	-240(%rbp), %rax	# MEM[(struct vec5 *)_171], tmp324
	movq	-232(%rbp), %rdx	# MEM[(struct vec5 *)_171],
	movq	%rax, (%rcx)	# tmp324,
	movq	%rdx, 8(%rcx)	#,
	movl	-224(%rbp), %eax	# MEM[(struct vec5 *)_171], tmp325
	movl	%eax, 16(%rcx)	# tmp325,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp326
	movq	-208(%rbp), %rax	# MEM[(struct vec5 *)_172], tmp327
	movq	-200(%rbp), %rdx	# MEM[(struct vec5 *)_172],
	movq	%rax, (%rcx)	# tmp327,
	movq	%rdx, 8(%rcx)	#,
	movl	-192(%rbp), %eax	# MEM[(struct vec5 *)_172], tmp328
	movl	%eax, 16(%rcx)	# tmp328,
	movq	%rsi, %rdi	# tmp322,
	call	add_vec5	#
	addq	$48, %rsp	#,
.L185:
# ../source/app.c:798: 		while (startendcur.x < end.x) {
	movss	-208(%rbp), %xmm1	# MEM[(struct vec5 *)_172].x, _75
# ../source/app.c:798: 		while (startendcur.x < end.x) {
	movss	-272(%rbp), %xmm0	# MEM[(struct vec5 *)_170].x, _76
# ../source/app.c:798: 		while (startendcur.x < end.x) {
	comiss	%xmm1, %xmm0	# _75, _76
	ja	.L186	#,
# ../source/app.c:803: 		topbotcur = sub_vec5(topbotcur, topbotstep);
	leaq	-672(%rbp), %rsi	#, tmp329
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp330
	movq	-496(%rbp), %rax	# topbotstep, tmp331
	movq	-488(%rbp), %rdx	# topbotstep,
	movq	%rax, (%rcx)	# tmp331,
	movq	%rdx, 8(%rcx)	#,
	movl	-480(%rbp), %eax	# topbotstep, tmp332
	movl	%eax, 16(%rcx)	# tmp332,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp333
	movq	-400(%rbp), %rax	# topbotcur, tmp334
	movq	-392(%rbp), %rdx	# topbotcur,
	movq	%rax, (%rcx)	# tmp334,
	movq	%rdx, 8(%rcx)	#,
	movl	-384(%rbp), %eax	# topbotcur, tmp335
	movl	%eax, 16(%rcx)	# tmp335,
	movq	%rsi, %rdi	# tmp329,
	call	sub_vec5	#
	addq	$48, %rsp	#,
	movq	-672(%rbp), %rax	#, tmp336
	movq	-664(%rbp), %rdx	#,
	movq	%rax, -400(%rbp)	# tmp336, topbotcur
	movq	%rdx, -392(%rbp)	#, topbotcur
	movl	-656(%rbp), %eax	#, tmp337
	movl	%eax, -384(%rbp)	# tmp337, topbotcur
# ../source/app.c:804: 	  midbotcur = sub_vec5(midbotcur, midbotstep);
	leaq	-336(%rbp), %rsi	#, tmp338
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp339
	movq	-432(%rbp), %rax	# midbotstep, tmp340
	movq	-424(%rbp), %rdx	# midbotstep,
	movq	%rax, (%rcx)	# tmp340,
	movq	%rdx, 8(%rcx)	#,
	movl	-416(%rbp), %eax	# midbotstep, tmp341
	movl	%eax, 16(%rcx)	# tmp341,
	subq	$24, %rsp	#,
	movq	%rsp, %rcx	#, tmp342
	movq	-336(%rbp), %rax	# midbotcur, tmp343
	movq	-328(%rbp), %rdx	# midbotcur,
	movq	%rax, (%rcx)	# tmp343,
	movq	%rdx, 8(%rcx)	#,
	movl	-320(%rbp), %eax	# midbotcur, tmp344
	movl	%eax, 16(%rcx)	# tmp344,
	movq	%rsi, %rdi	# tmp338,
	call	sub_vec5	#
	addq	$48, %rsp	#,
.L182:
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	movss	-332(%rbp), %xmm0	# midbotcur.y, _77
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	movss	-524(%rbp), %xmm1	# bot.y, _78
# ../source/app.c:783: 	while (midbotcur.y > bot.y) {
	comiss	%xmm1, %xmm0	# _78, _77
	ja	.L187	#,
# ../source/app.c:808: 	return 0;
	movl	$0, %eax	#, _79
.L188:
# ../source/app.c:810: }
	movq	-24(%rbp), %rdx	# D.9209, tmp346
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp346
	je	.L189	#,
	call	__stack_chk_fail@PLT	#
.L189:
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
# ../source/app.c:812: int main(int argc, char **argv) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp114
	movq	%rax, -8(%rbp)	# tmp114, D.9226
	xorl	%eax, %eax	# tmp114
# ../source/app.c:814:   struct memory                     memory        = {0};
	pxor	%xmm0, %xmm0	# tmp115
	movaps	%xmm0, -336(%rbp)	# tmp115, memory
	movq	%xmm0, -320(%rbp)	# tmp115, memory
# ../source/app.c:815:   struct x11_window                 window        = {0};
	pxor	%xmm0, %xmm0	# tmp116
	movaps	%xmm0, -208(%rbp)	# tmp116, window
	movaps	%xmm0, -192(%rbp)	# tmp116, window
	movaps	%xmm0, -176(%rbp)	# tmp116, window
	movaps	%xmm0, -160(%rbp)	# tmp116, window
	movq	%xmm0, -144(%rbp)	# tmp116, window
# ../source/app.c:816:   struct xlib_update_window_output  update        = {0};
	leaq	-128(%rbp), %rdx	#, tmp117
	movl	$0, %eax	#, tmp118
	movl	$15, %ecx	#, tmp119
	movq	%rdx, %rdi	# tmp117, tmp117
	rep stosq
# ../source/app.c:817:   char                             *system_memory = calloc(1, 1024 * 1024 * 1024);
	movl	$1073741824, %esi	#,
	movl	$1, %edi	#,
	call	calloc@PLT	#
	movq	%rax, -344(%rbp)	# tmp120, system_memory
# ../source/app.c:819:   if (system_memory == 0)
	cmpq	$0, -344(%rbp)	#, system_memory
	jne	.L197	#,
# ../source/app.c:820:     return 1;
	movl	$1, %eax	#, _16
	jmp	.L203	#
.L197:
# ../source/app.c:822:   memory_init(1024 * 1024 * 1024, system_memory, &memory);
	leaq	-336(%rbp), %rdx	#, tmp121
	movq	-344(%rbp), %rax	# system_memory, tmp122
	movq	%rax, %rsi	# tmp122,
	movl	$1073741824, %edi	#,
	call	memory_init	#
# ../source/app.c:824:   if (xlib_open_window(0, 0, 1920, 1080, &memory, &window) != 0)
	leaq	-208(%rbp), %rdx	#, tmp123
	leaq	-336(%rbp), %rax	#, tmp124
	movq	%rdx, %r9	# tmp123,
	movq	%rax, %r8	# tmp124,
	movl	$1080, %ecx	#,
	movl	$1920, %edx	#,
	movl	$0, %esi	#,
	movl	$0, %edi	#,
	call	xlib_open_window	#
# ../source/app.c:824:   if (xlib_open_window(0, 0, 1920, 1080, &memory, &window) != 0)
	testl	%eax, %eax	# _1
	je	.L199	#,
# ../source/app.c:825:     return 2;
	movl	$2, %eax	#, _16
	jmp	.L203	#
.L199:
# ../source/app.c:827:   struct triangle test = {
	movss	.LC7(%rip), %xmm0	#, tmp125
	movss	%xmm0, -272(%rbp)	# tmp125, test.v1.x
	movss	.LC7(%rip), %xmm0	#, tmp126
	movss	%xmm0, -268(%rbp)	# tmp126, test.v1.y
	pxor	%xmm0, %xmm0	# tmp127
	movss	%xmm0, -264(%rbp)	# tmp127, test.v1.z
	pxor	%xmm0, %xmm0	# tmp128
	movss	%xmm0, -260(%rbp)	# tmp128, test.v1.u
	pxor	%xmm0, %xmm0	# tmp129
	movss	%xmm0, -256(%rbp)	# tmp129, test.v1.v
	movss	.LC7(%rip), %xmm0	#, tmp130
	movss	%xmm0, -252(%rbp)	# tmp130, test.v2.x
	movss	.LC8(%rip), %xmm0	#, tmp131
	movss	%xmm0, -248(%rbp)	# tmp131, test.v2.y
	pxor	%xmm0, %xmm0	# tmp132
	movss	%xmm0, -244(%rbp)	# tmp132, test.v2.z
	pxor	%xmm0, %xmm0	# tmp133
	movss	%xmm0, -240(%rbp)	# tmp133, test.v2.u
	movss	.LC6(%rip), %xmm0	#, tmp134
	movss	%xmm0, -236(%rbp)	# tmp134, test.v2.v
	movss	.LC8(%rip), %xmm0	#, tmp135
	movss	%xmm0, -232(%rbp)	# tmp135, test.v3.x
	movss	.LC8(%rip), %xmm0	#, tmp136
	movss	%xmm0, -228(%rbp)	# tmp136, test.v3.y
	pxor	%xmm0, %xmm0	# tmp137
	movss	%xmm0, -224(%rbp)	# tmp137, test.v3.z
	movss	.LC6(%rip), %xmm0	#, tmp138
	movss	%xmm0, -220(%rbp)	# tmp138, test.v3.u
	movss	.LC6(%rip), %xmm0	#, tmp139
	movss	%xmm0, -216(%rbp)	# tmp139, test.v3.v
# ../source/app.c:835:   c_read_image_file(
	leaq	-304(%rbp), %rdx	#, tmp140
	leaq	-336(%rbp), %rax	#, tmp141
	movq	%rax, %rsi	# tmp141,
	leaq	.LC9(%rip), %rax	#, tmp142
	movq	%rax, %rdi	# tmp142,
	call	c_read_image_file	#
.L202:
# ../source/app.c:843:     int itr = 0;
	movl	$0, -348(%rbp)	#, itr
# ../source/app.c:845:     while (itr < window.width * window.height) {
	jmp	.L200	#
.L201:
# ../source/app.c:846:       window.pixels[itr] = 0xffffffff;
	movq	-144(%rbp), %rax	# window.pixels, _2
# ../source/app.c:846:       window.pixels[itr] = 0xffffffff;
	movl	-348(%rbp), %edx	# itr, tmp143
	movslq	%edx, %rdx	# tmp143, _3
	salq	$2, %rdx	#, _4
	addq	%rdx, %rax	# _4, _5
# ../source/app.c:846:       window.pixels[itr] = 0xffffffff;
	movl	$-1, (%rax)	#, *_5
# ../source/app.c:847:       ++itr;
	addl	$1, -348(%rbp)	#, itr
.L200:
# ../source/app.c:845:     while (itr < window.width * window.height) {
	movl	-152(%rbp), %edx	# window.width, _6
# ../source/app.c:845:     while (itr < window.width * window.height) {
	movl	-148(%rbp), %eax	# window.height, _7
# ../source/app.c:845:     while (itr < window.width * window.height) {
	imull	%edx, %eax	# _6, _8
# ../source/app.c:845:     while (itr < window.width * window.height) {
	cmpl	%eax, -348(%rbp)	# _8, itr
	jl	.L201	#,
# ../source/app.c:850:     draw_triangle(
	movq	-144(%rbp), %rdi	# window.pixels, _9
	movl	-148(%rbp), %r9d	# window.height, _10
	movl	-152(%rbp), %r8d	# window.width, _11
	movq	-280(%rbp), %rcx	# image.pixels, _12
	movl	-284(%rbp), %edx	# image.height, _13
	movl	-288(%rbp), %esi	# image.width, _14
	leaq	-272(%rbp), %rax	#, tmp144
	subq	$8, %rsp	#,
	pushq	%rdi	# _9
	movq	%rax, %rdi	# tmp144,
	call	draw_triangle	#
	addq	$16, %rsp	#,
# ../source/app.c:856:     xlib_update_window(&window, &update);
	leaq	-128(%rbp), %rdx	#, tmp145
	leaq	-208(%rbp), %rax	#, tmp146
	movq	%rdx, %rsi	# tmp145,
	movq	%rax, %rdi	# tmp146,
	call	xlib_update_window	#
# ../source/app.c:841:   while(1) {
	jmp	.L202	#
.L203:
# ../source/app.c:861: }
	movq	-8(%rbp), %rdx	# D.9226, tmp148
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp148
	je	.L204	#,
	call	__stack_chk_fail@PLT	#
.L204:
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
	.ident	"GCC: (GNU) 14.1.1 20240507"
	.section	.note.GNU-stack,"",@progbits
