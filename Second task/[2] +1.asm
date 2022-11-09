.data
number: .word 0
promptInp: .asciiz "Please enter integer: "
result: .asciiz "Your number increased by 1 is "

.text

main:
# * Prompt the number and add 1
    jal     prompt
    move    $s0,    $v0

    j       print

# show result
print:
    addi    $v0,    $zero,      4
    la      $a0,    result
    syscall 

    addi    $v0,    $zero,      1
    move    $a0,    $s0
    syscall 

    addi    $v0,    $zero,      10
    syscall 

prompt:
# get number from user
    addi    $v0,    $zero,      4
    la      $a0,    promptInp
    syscall 

    addi    $v0,    $zero,      5
    syscall
# count the sum of number and 1
incrementer:
    add     $v0,    $v0,        1
    jr      $ra