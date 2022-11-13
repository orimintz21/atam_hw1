.global _start

.section .text

  mov $mergedArray, %rax
  cmpl $6, (%rax)
  jne bad_exit
  cmpl $5, 4(%rax)
  jne bad_exit
  cmpl $4, 8(%rax)
  jne bad_exit
  cmpl $3, 12(%rax)
  jne bad_exit
  cmpl $0, 16(%rax)
  jne bad_exit

  movq $60, %rax
  movq $0, %rdi
  syscall

bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
array1: .int 6,4,0
array2: .int 5,3,0
mergedArray: .zero 20
