.data
prompt1: .asciiz "Please enter the first integer: "
prompt2: .asciiz "Please enter the second integer: "
result: .asciiz "The sum of the two numbers is "

.text

main:
    # prompt numbers and count their sum
    jal     prompt
    # output the answer
    jal     print
    
prompt:
    # get first number
    addi    $v0,    $zero,      4
    la      $a0,    prompt1
    syscall 

    addi    $v0,    $zero,      5
    syscall 
    move    $s1,    $v0
    # get second number
    addi    $v0,    $zero,      4
    la      $a0,    prompt2
    syscall 

    addi    $v0,    $zero,      5
    syscall 
    move    $s2,    $v0

sum:
    add     $s0,    $s1,        $s2
    jr      $ra

print:
    # output the text
    addi    $v0,    $zero,      4
    la      $a0,    result
    syscall
    # output the result
    addi    $v0,    $zero,      1
    move    $a0,    $s0
    syscall