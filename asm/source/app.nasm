



extern XOpenDisplay
extern XDefaultRootWindow
extern XCreateSimpleWindow
extern XSelectInput
extern XMapWindow
extern XPending
extern XNextEvent
global main





section .text

  linux_print_text:

    push rax
    push rdi
    push rsi
    push rdx

    mov rdx, -1
  
    .str_len_cnt:
			inc rdx
      cmp byte [rsi + rdx], 0
      jne .str_len_cnt

    mov rax, 1
    mov rdi, 1
    syscall

    pop rdx
    pop rsi
    pop rdi
    pop rax

    ret
    
  linux_print_int64:
  
    push rax
    push rdi
    push rsi
    push rdx
    push r8
    
    cmp rax, 0
    
    jl .negate_number
    jae .negate_nothing
    
    .negate_number:
      neg rax
      mov r8, 1
      
    .negate_nothing:
    
    xor rdi, rdi
        
    mov rsi, 10
    
    .int_to_str:
      xor rdx, rdx
      div rsi
      dec rsp
      inc rdi
      mov byte [rsp], dl
      add byte [rsp], '0'
      cmp rax, 0
      jne .int_to_str
    
    cmp r8, 1
    je .add_minus
    jne .add_nothing
    
    .add_minus:
      dec rsp
      inc rdi
      mov byte [rsp], '-'
    
    .add_nothing:
    
    mov rax, 1
    mov rdx, rdi
    mov rdi, 1
    mov rsi, rsp
    syscall
    
    add rsp, rdx
    
    pop r8
    pop rax
    pop rdi
    pop rsi
    pop rdx
    
    ret
      
  linux_print_float64:
      
    push rax
    push rdi
    push rsi
    push rdx
      
    sub rsp, 32

    movq [rsp + 16], xmm0
    movq [rsp +  0], xmm1
      
    movsd   xmm1, xmm0
    roundsd xmm0, xmm1, 11b
    subsd   xmm1, xmm0
    mulsd   xmm1, [float_print_precision]
    
    cvtsd2si rax, xmm0
    call linux_print_int64
    
    dec rsp
    mov byte [rsp], '.'
    
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    
    syscall
    
    inc rsp
    
    cvtsd2si rax, xmm1
    
    cmp rax, 0
    jl .neg
    jae .nothing
    
    .neg:
      neg rax
    .nothing:
    
    call linux_print_int64

    movq xmm1, [rsp +  0]
    movq xmm0, [rsp + 16]
    
    add rsp, 32
    
    pop rdx
    pop rsi
    pop rdi
    pop rax

    ret

	linux_exit:
		mov rax, 60
		xor rdi, rdi
		syscall
		ret

	xlib_open_window:

		; Open connection to X server, get default root window, create simple window,
		; select which events it should listen for, then map this window.

		push rax
		push rdi
		push rsi
		push rdx
		push rcx
		push r8
		push r9
		push 0

		xor rdi, rdi
		call XOpenDisplay
		mov [xlib_display], rax

		mov rdi, [xlib_display]
		call XDefaultRootWindow
		mov [xlib_root_window], rax

		mov rdi, [xlib_display]
		mov rsi, [xlib_root_window]
		xor rdx, rdx
		xor rcx, rcx
		mov r8, [xlib_window_width]
		mov r9, [xlib_window_height]
		push 0
		push 0
		push 0
		call XCreateSimpleWindow
		mov [xlib_window], rax
		add rsp, 24

		mov rdi, [xlib_display]
		mov rsi, [xlib_window]
		mov rdx, 01000000000111111b
		call XSelectInput

		mov rdi, [xlib_display]
		mov rsi, [xlib_window]
		call XMapWindow

		add rsp, 8
		pop r9
		pop r8
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		pop rax

		ret

	xlib_update_window:

		; Check if there are events in buffer, proceed only if buffer ISN'T empty, because
		; calling XNextEvent on empty buffer causes everything to lock until new events are received.

		push rdi
		push rsi
		push rax
		push 0

		mov rdi, [xlib_display]
		call XPending

		cmp rax, 0

		jne .process
		je .skip

		.process:
			mov rdi, [xlib_display]
			lea rsi, xlib_event
			call XNextEvent
			mov eax, [xlib_event]			; debug print
			call linux_print_int64		; debug print
			lea rsi, string_newline		; debug print
			call linux_print_text			; debug print

		.skip:

		add rsp, 8
		pop rax
		pop rsi
		pop rdi

		ret

  main:
		sub rsp, 40
		call xlib_open_window

		.infinite:
			call xlib_update_window
			jmp .infinite

		call linux_exit
		ret




section .data

	string_newline: db 10
  float_print_precision: dq 1000.0

	xlib_window_width: dq 1920
	xlib_window_height: dq 1080


section .bss

	xlib_display: resq 1
	xlib_root_window: resq 1
	xlib_window: resq 1
	xlib_event: resq 128
