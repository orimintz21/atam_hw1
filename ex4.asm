.global _start

.section .text
_start:
    movq root, %rax
    movq $0, %rbx
    movq $new_node, %rdx
    movq (%rdx), %rsi
    movb $0, %cl
_while_root_not_null_HW1:
    testq %rax, %rax
    je _end_while_loop_HW1
    cmpq %rsi, (%rax)
    je _end_4_HW1
    movq %rax, %rbx
    cmpq %rsi, (%rax)
    jg _go_to_lson_HW1
    movq 16(%rax), %rax
    movb $0, %cl
    jmp _while_root_not_null_HW1
_go_to_lson_HW1:
    movq 8(%rax), %rax
    movb $1, %cl
    jmp _while_root_not_null_HW1
_end_while_loop_HW1:
    testq %rbx, %rbx
    je _put_as_first_node_HW1
    testb %cl, %cl
    je _ins_as_rson_HW1
    movq %rdx, 8(%rbx)
    jmp _end_4_HW1
_ins_as_rson_HW1:
    movq %rdx, 16(%rbx)
    jmp _end_4_HW1
_put_as_first_node_HW1:
    movq %rdx, root
_end_4_HW1:
