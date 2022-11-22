.global _start

.section .text
_start:
# rax == temp / holder for
# ebx == n
# cl == count
# rdx == t_prv / temp2
# rsi == first_prv
# rdi == second_prv 
# r8 == second
# r9 == first

    movq head, %rax
    movl Value, %ebx
    movb $0, %cl
    xorq %rdx, %rdx

_loop_HW1:
# temp != nullptr
    test %rax, %rax
    je _end_loop_HW1
# if(temp->_val == n)
    cmpl (%rax), %ebx
    jne update_HW1
# if( count == 2)
    cmpb $2, %cl
    je _end_HW1
# count == 1
    cmpb $0, %cl
    je f_val_HW1
    movq %rdx, %rdi
    movq %rax, %r8
    jmp inc_HW1
# count == 0
f_val_HW1:
    movq %rdx, %rsi
    movq %rax, %r9
inc_HW1:
    incb %cl
update_HW1:
    movq %rax, %rdx
    movq 4(%rax), %rax
    jmp _loop_HW1

_end_loop_HW1:
    cmpb $2, %cl
    jne _end_HW1
# if(first_prv != nullptr)
    test %rsi, %rsi
    je no_f_prev_HW1
    addq $4, %rsi
    movq %r8, (%rsi)
    jmp other_HW1
no_f_prev_HW1:
    movq %r8, head
other_HW1:
    addq $4, %rdi
    movq %r9, (%rdi)
    
    addq $4, %r8
    addq $4, %r9
    movq (%r8), %rax
    movq (%r9), %rdx
    movq %rax, (%r9)
    movq %rdx, (%r8)
_end_HW1:
