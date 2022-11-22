.global _start

.section .text
_start:
    movq $Bool , %rdx
    movl num, %eax
    andl $0x3, %eax
    test %eax, %eax
    je f_div_HW1
    movb $0x0, Bool
    jmp finish_HW1
f_div_HW1:
    movb $0x1, Bool
finish_HW1:
