.data
first: .asciiz "Please enter the first integer: "
last: .asciiz "Please enter the second integer: "
result: .asciiz "The result is "

.text

    # prompt and count the result
    jal prompt
    # ? лучше ли сделать два отдельных вызова или наоборот следует полагаться на последовательность
    j print

prompt:
    # get first number (x)
    addi    $v0,    $zero,      4
    la      $a0,    first
    syscall 

    li      $v0,    5
    syscall 
    move    $s1,    $v0

    # get second number (y)
    addi    $v0,    $zero,      4
    la      $a0,    last
    syscall 

    addi    $v0,    $zero,      5
    syscall 
    move    $s2,    $v0

count:
    add     $s0,    $s1,        $s2         # z = x + y
    add     $s0,    $s0,        202         # z = z + 202
    jr $ra

print:
    # print first number
    addi    $v0,    $zero,      1
    move    $a0,    $s1
    syscall 
    addi    $v0,    $zero,      11
    la      $a0,    ','
    syscall
    # print second number
    addi    $v0,    $zero,      1
    move    $a0,    $s2
    syscall
    addi    $v0,    $zero,      11
    la      $a0,    ','
    syscall
    # print the result
    addi    $v0,    $zero,      1
    move    $a0,    $s0
    syscall
    # exit the program
    addi $v0, $zero, 10
    syscall