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
info: .asciz "M'hamed belalia 2743067  assignment 1\n"

.global my_main                        
my_main:
	movq $0, %rax
	movq $25, %rsi
    	movq $info, %rdi
    	call printf
end:
    	call exit
