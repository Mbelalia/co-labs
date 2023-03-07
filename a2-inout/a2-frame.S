# *********************************************************************************
# * Program name: inout                                                           *
# * Description :                                                                 *
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
    scanf: jmp _scanf
    exit: jmp _exit
#endif

.text
info: .asciz "M'hamed Belalia, 2743067,  Lab Assignment 2: inout\n"
inputtext: .asciz "Enter a number: "
incrementedtext: .asciz "Incremented number is: "
firstnum: .asciz "%ld"
incrementednum: .asciz "%ld"

.global my_main                         
.global my_increment                    

my_main:
        pushq %rbp
        movq %rsp, %rbp
        movq $0, %rax 
        movq $info, %rdi 
        call printf 
        call    inout                

        
        movq    %rbp, %rsp
        popq    %rbp
        ret      
inout:
        
        subq $16, %rsp 
        movq $inputtext, %rdi  
        call printf
        leaq -8(%rbp), %rsi
        movq $firstnum, %rdi
        movq $0, %rax
        call scanf
        movq -8(%rbp), %rdi
        call    my_increment

        
        movq $incrementedtext, %rdi
        call printf 
        movq %rax, %rdi
        movq $incrementednum, %rsi
        call printf
        movq %rbp, %rsp
        popq %rbp
        ret
my_increment:
        
        addq $1, %rdi
        movq %rdi, %rax
        ret
