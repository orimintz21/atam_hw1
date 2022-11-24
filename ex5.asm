.global _start

.section .text
_start:
    movq head, %rax
    movl val, %ebx
    movslq %ebx, %rbx
    movb $0, %cl
    xorq %rdx, %rdx
_loop_HW1:
    test %rax, %rax
    je _end_loop_HW1
    cmpq (%rax), %rbx
    jne update_HW1
    cmpb $2, %cl
    je _end_HW1
    cmpb $0, %cl
    je f_val_HW1
    movq %rdx, %rdi
    movq %rax, %r8
    jmp inc_HW1
f_val_HW1:
    movq %rdx, %rsi
    movq %rax, %r9
inc_HW1:
    incb %cl
update_HW1:
    movq %rax, %rdx
    movq 8(%rax), %rax
    jmp _loop_HW1
_end_loop_HW1:
    cmpb $2, %cl
    jne _end_HW1
    test %rsi, %rsi
    je no_f_prev_HW1
    addq $8, %rsi
    movq %r8, (%rsi)
    jmp other_HW1
no_f_prev_HW1:
    movq %r8, head
other_HW1:
    addq $8, %rdi
    movq %r9, (%rdi)
    addq $8, %r8
    addq $8, %r9
    movq (%r8), %rax
    movq (%r9), %rdx
    movq %rax, (%r9)
    movq %rdx, (%r8)
_end_HW1:
