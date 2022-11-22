_start:
  xor %rax, %rax
  mov $1, %bx
  mov (n), %cx

.L1:
  mov %bx, %r9w
  imul %bx, %r9w
  imul %bx, %r9w
  add %r9d, %eax
  inc %bx
  dec %cx
  test %cx, %cx
  jne .L1
END:
