.global _start

.section .text
_start:
	movq $array1, %rax
	movq $array2, %rdx
	movq $mergedArray, %rsi
	movb $0, %cl
_while_arrs_HW1:
	movl (%rax), %edi
	testl %edi, %edi
	je _prepare_for_only_arr2_loop_HW1
	movl (%rdx), %edi
	testl %edi, %edi
	je _while_arr_i_not_finished_HW1
	movl (%rax), %edi
	cmpl %edi, (%rdx)
	jl _cond_arr1_to_merged_HW1
	movl (%rdx), %edi
	addq $4, %rdx
_check_first_iter_HW1:
	testb %cl, %cl
	jne _cond_not_beg_HW1
    movb $1, %cl
_insert_to_merged_HW1:
	movl %edi, (%rsi)
	jmp _while_arrs_HW1
_cond_not_beg_HW1:
	cmpl %edi, (%rsi)
	je _while_arrs_HW1
	addq $4, %rsi
	jmp _insert_to_merged_HW1
_cond_arr1_to_merged_HW1:
	movl (%rax), %edi
	addq $4, %rax
	jmp _check_first_iter_HW1
_prepare_for_only_arr2_loop_HW1:
	movq %rdx, %rax
_while_arr_i_not_finished_HW1:
	movl (%rax), %edi
	testl %edi, %edi
	je _end_3_HW1
	addq $4, %rax
	testb %cl, %cl
    movb $1, %cl
	je _arri_to_merged_only_HW1
	cmpl %edi, (%rsi)
	je _while_arr_i_not_finished_HW1
	addq $4, %rsi
_arri_to_merged_only_HW1:
	movl %edi, (%rsi)
	jmp _while_arr_i_not_finished_HW1
_end_3_HW1:
	addq $4, %rsi
    movl $0, (%rsi)
