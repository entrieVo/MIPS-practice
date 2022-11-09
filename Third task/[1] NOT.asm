# * x xor 1 = not x

.data
number: .asciiz "Please enter number: "
op_xor: .asciiz " xor 1 = "
op_not: .asciiz "not "
equal:  .asciiz " = "

.text
main:

    jal     prompt

    # not     $s2,                $a1
    jal     bitwiseAddition
    jal     print

prompt:
    # prompt for number
    addi    $v0,                $zero,      4
    la      $a0,                number
    syscall 
    # get number from user
    addi    $v0,                $zero,      5
    syscall 
    move    $a1,                $v0

    jr      $ra

# bitwiseAddition -- bitwise addition with xor
#
# to obtain a similar result as NOT, we need:
# > odd:  x * (-1)
# > even: (x + 2) * (-1)
#
# RETURNS:
# s1 -- NOT x
#
# arguments:
# a1 -- user number (x)
bitwiseAddition:
    xor     $s1,                $a1,        1
    # if the number is odd, we need to add 2
    div     $t0,                $a1,        2
    mfhi    $t0
    beqz    $t0,                negative

odd:
    addi    $s1,                $s1,        2

negative:
    mul     $s1,                $s1,        -1
    jr      $ra

print:
    # output not operation
    # addi    $v0,                $zero,      4
    # la      $a0,                op_not
    # syscall 

    # addi    $v0,                $zero,      1
    # move    $a0,                $a1
    # syscall 

    # addi    $v0,                $zero,      4
    # la      $a0,                equal
    # syscall 

    # addi    $v0,                $zero,      1
    # move    $a0,                $s2
    # syscall 

    # addi    $v0,                $zero,      11
    # la      $a0,                '\n'
    # syscall 

    # output xor operation
    addi    $v0,                $zero,      1
    move    $a0,                $a1
    syscall 

    addi    $v0,                $zero,      4
    la      $a0,                op_xor
    syscall 

    addi    $v0,                $zero,      1
    move    $a0,                $s1
    syscall 

    # exit the program
    addi    $v0,                $zero,      10
    syscall 