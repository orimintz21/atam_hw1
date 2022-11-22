.global _start

.section .text
_start:
    movq $source, %rax
    movq $destination, %rbx
    movl num, %ecx
    cmpl $0, %ecx
    js _num_negative_HW1
    je _end_HW1
    movq %rbx, %r9
    subq %rax, %r9
    cmpq $0, %r9
    jg _pos_loop_HW1
    movslq %ecx , %r10
    cmpq %r10, %r9
    js _overlap_HW1
_pos_loop_HW1:
    movb (%rax), %dl
    movb %dl, (%rbx)
    incq %rax
    incq %rbx
    loop _pos_loop_HW1
    jmp _end_HW1
_overlap_HW1:
    addq %r10, %rax
    addq %r10, %rbx
    decq %rax
    decq %rbx
_overlap_loop_HW1:
    movb (%rax), %dl
    movb %dl, (%rbx)
    decq %rax
    decq %rbx
    loop _overlap_loop_HW1
    jmp _end_HW1
_num_negative_HW1:
    negl %ecx
    addq %rcx, %rax
    decq %rax
_neg_loop_HW1:
    movb (%rax), %dl
    movb %dl, (%rbx)
    decq %rax
    incq %rbx
    loop _neg_loop_HW1
_end_HW1:
