
      ; NOTES:
      ; Linux will use xlib api for windowing.
			; Windows will use win32 api for windowing.
      ; Linux calling convention: rdi, rsi, rdx, rcx, r8, r9, stack (in reverse order)

extern XOpenDisplay
extern XDefaultScreen
extern XDefaultVisual
extern XDefaultGC
extern XDefaultRootWindow
extern XCreateSimpleWindow
extern XMapWindow
extern XFlush
extern XSelectInput
extern XDefaultDepth
extern XEventsQueued
extern XNextEvent

global main

section .text

  ; -------------------------------------------------------------------------------------------------------------------------- ;

  ; linux_print_text requires address to zero-terminated string in rsi register.

  linux_print_text:

      ; Save registers.

    push rax
    push rdi
    push rsi
    push rdx

      ; Set string length counter and adjust pointer.

    mov rdx, -1
    
      ; Count string's length until 0 is found.
    
    .str_len_cnt:
			inc rdx
      cmp byte [rsi + rdx], 0
      jne .str_len_cnt

      ; Output this string to console.

    mov rax, 1
    mov rdi, 1
    syscall

      ; Restore registers.

    pop rdx
    pop rsi
    pop rdi
    pop rax

    ret
    
  ; -------------------------------------------------------------------------------------------------------------------------- ;
    
  ; linux_print_int64 requires signed 64 bit integer in rax.
  
  linux_print_int64:
  
      ; Save registers.
  
    push rax
    push rdi
    push rsi
    push rdx
    push r8
    
      ; Check if number is negative, if so, then mark it for later.
    
    cmp rax, 0
    
    jl .negate_number
    jae .negate_nothing
    
    .negate_number:
      neg rax
      mov r8, 1
      
    .negate_nothing:
    
      ; Set string length counter to zero.
    
    xor rdi, rdi
        
      ; Set number to divide by.
        
    mov rsi, 10
    
      ; Convert int_64 in rax into string.
    
    .int_to_str:
      xor rdx, rdx          ; Set remainder to 0,
      div rsi               ; divide number provided in rax by 10,
      dec rsp               ; decrement / enlarge stack to hold one more character,
      inc rdi               ; increment string length counter,
      mov byte [rsp], dl    ; store remainder as on stack,
      add byte [rsp], '0'   ; convert stored remainder to printable ascii character,
      cmp rax, 0            ; check if original number has digits left,
      jne .int_to_str       ; if yes, then repeat.
    
      ; If original value was marked as negative, then print additional minus.
    
    cmp r8, 1
    je .add_minus
    jne .add_nothing
    
    .add_minus:
      dec rsp
      inc rdi
      mov byte [rsp], '-'
    
    .add_nothing:
    
      ; Write to console.
    
    mov rax, 1
    mov rdx, rdi
    mov rdi, 1
    mov rsi, rsp
    syscall
    
      ; Restore registers and stack.
    
    add rsp, rdx
    
    pop r8
    pop rax
    pop rdi
    pop rsi
    pop rdx
    
    ret
      
  ; -------------------------------------------------------------------------------------------------------------------------- ;
      
  ; linux_print_float64 requires floating point value in xmm0 register
      
  linux_print_float64:
      
      ; save registers
      
    push rax
    push rdi
    push rsi
    push rdx
      
    sub rsp, 32
    movq [rsp + 16], xmm0
    movq [rsp +  0], xmm1
      
      ; Copy original value from xmm0 to xmm1,
      ; truncate original value,
      ; subtract truncated from copy to get fraction,
      ; multiply fraction by float_print_precision so it isn't zeroed after conversion int64.
      
    movsd   xmm1, xmm0
    roundsd xmm0, xmm1, 11b
    subsd   xmm1, xmm0
    mulsd   xmm1, [float_print_precision]
    
      ; Convert truncated value to int,
      ; print it to console.
    
    cvtsd2si rax, xmm0
    call linux_print_int64
    
      ; Decrease stack pointer to hold dot (.) character,
      ; call sys_write syscall to write it to console,
      ; restore stack.
   
    dec rsp
    mov byte [rsp], '.'
    
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    
    syscall
    
    inc rsp
    
      ; Convert fraction to int64,
      ; check if original value was negative, to make fraction positive so it isn't displayed in console like: -1.-25, but -1.25.
    
    cvtsd2si rax, xmm1
    
    cmp rax, 0
    jl .neg
    jae .nothing
    
    .neg:
      neg rax
    .nothing:
    
    call linux_print_int64

      ; Restore registers and stack.

    movq xmm1, [rsp +  0]
    movq xmm0, [rsp + 16]
    
    add rsp, 32
    
    pop rdx
    pop rsi
    pop rdi
    pop rax

    ret

  xlib_open_window:

		sub rsp, 8

		mov rax, rsp
		call linux_print_int64

		; --- save registers

		push rax
		push rdi
		push rsi
		push rdx
		push rcx
		push r8
		push r9

		; --- open connection to x11 and store it in [xlib_connection]

    xor rdi, rdi
    call XOpenDisplay
    mov [xlib_connection], rax

		; --- get default screen on which connection was opened

		mov rdi, [xlib_connection]
		call XDefaultScreen
		mov [xlib_screen], rax

		; --- get screen gc

		mov rdi, [xlib_connection]
		mov rsi, [xlib_screen]
		call XDefaultGC
		mov [xlib_gc], rax

		; --- get screen visual

		mov rdi, [xlib_connection]
		mov rsi, [xlib_screen]
		call XDefaultVisual
		mov [xlib_visual], rax

		; --- store x11's default root window in [xlib_root_window]

		mov rdi, [xlib_connection]
		call XDefaultRootWindow
		mov [xlib_root_window], rax

		; --- open window

		mov rdi, [xlib_connection]
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

		; --- get default depth

		mov rdi, [xlib_connection]
		mov rsi, [xlib_screen]
		call XDefaultDepth
		mov [xlib_depth], rax

		; --- create window image
		;	will be added later

		; --- map window

		mov rdi, [xlib_connection]
		mov rsi, [xlib_window]
		call XMapWindow

		; --- set which events window will record

		mov rdi, [xlib_connection]
		mov rsi, [xlib_window]
		mov rdx, 1
		shl rdx, 15
		and rdx, 0b1111111  ; key press,release; button press,release; window enter,leave; pointer motion;
		
		call XSelectInput

		; --- flush window

		mov rdi, [xlib_connection]

		call XFlush

		; --- restore registers

		add rsp, 8

		pop r9
		pop r8
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		pop rax

    ret

	xlib_process_events:

		mov rdi, [xlib_connection]
		mov rsi, 2

		call XEventsQueued			; process only when there are more than 0 events, to not lock up

		cmp rax, 0

		jne .process_event
		je .skip_event

		.process_event:
			mov rdi, [xlib_connection]
			lea rsi, xlib_event
			call XNextEvent

		.skip_event:

		ret

  ; -------------------------------------------------------------------------------------------------------------------------- 

  main:

		sub rsp, 40

		call xlib_open_window

		.main_loop:
			call xlib_process_events
			jmp .main_loop

		add rsp, 40

  	mov rax, 60
  	xor rdi, rdi
  	syscall
  	ret

section .data

  float_print_precision: dq 1000.0
	xlib_window_width: dd 1920
	xlib_window_height: dd 1080
	newline: db 10, 0

section .bss

  xlib_connection:    resq 1
	xlib_screen:			  resq 1
	xlib_visual:			  resq 1
	xlib_depth:				  resq 1
	xlib_gc:					  resq 1
	xlib_root_window:   resq 1
	xlib_window:		    resq 1
	xlib_event:					resq 256
	xlib_cursor_x:			resq 1
	xlib_cursor_y:			resq 1
