.global _start
.section .data
arr: .short 6, 0xEA, 0x22, 0x4B1D, 0b1010
buff: .fill 10, 2, 0x42
id: .long 0x19283746
key: .quad 0x0406282309052021
.section .bss
    .lcomm a, 8
    .lcomm b, 4
.section .text
_start:
    xor %rcx, %rcx
    movl $0x5432, %ebx
    movb $4, %bl
    xor %rax, %rax
    xor %rsi, %rsi
#    add b, %rax, %rbx
#    lea 4(arr), %rbx
    lea (buff), %rbx
    movb 4(%rbx), %al
    movb 7(%rbx), %al
    lea (arr), %rbx
    mov %bh, %al
    xor %al, %sil
    shr $5, %rsi
    movw -4(%rbx, %rsi, 2), %dx
    shl $1, %rsi
    movb $0x68, b
#    addb (%rbx, %rsi, 2), b
    mov $0xFFFF00, %rax
    shr $8, %rax
    inc %ax
    movw arr+3, %ax
    ror $2, %ax
    xor %ax, %ax
#    incb %ax
    mov $a, %rcx
    lea key, %rbx
    movq (%rbx), %rbx
    mov $0x40, %si
    dec %rcx
    movl %ebx, 2(%rcx)
    movb $78, b
    movq $arr, b
    movswq (b), %rdx
    mov $0xAAAA, %ax
    cwd
    movw $-0x9F, a
    idivw a
    movq $0x123, (b)
    imul $3, b, %rdx
    xor %rax, %rax
    mov $0xfc, %ax
    mov $4, %bl
    mov $015, %rdx
_b1:
    imulb %bl
#    leaq $0x40FE67, %rdx
