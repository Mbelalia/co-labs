# *********************************************************************************
# * Program name: Hello World                                                     *
# * Description : Lab Assignment 1 - Hello World                                  *
# *********************************************************************************

#ifndef MACOS
.ifndef CODEGRADE
    .global main
    main: jmp my_main
.endif
#else
    .global _main
    _main: jmp my_main
    printf: jmp _printf
    exit: jmp _exit
#endif

.text
info: .asciz ",  Lab Assignment 1 - Hello World"

.global my_main                        
my_main:
	movq $0, %rax
    	movq $info, %rdi
    	call printf
end:
	mov $0, %rdi 
    	call exit
