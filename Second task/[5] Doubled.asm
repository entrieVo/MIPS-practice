.data
promptNum: .asciiz "Please enter a number: "
doubled: .asciiz " doubled is "

.text

main:
    # prompt number and count result
    jal     prompt
    # output the answer
    jal		print

# Exit the program
    addi    $v0,    $zero,      10
    syscall 

prompt:
    # output the promt
    addi    $v0,    $zero,      4
    la      $a0,    promptNum
    syscall 
    # get number
    addi    $v0,    $zero,      5
    syscall 
    move    $s0,    $v0

count:
    mul     $s1,    $s0,        2
    jr      $ra

print:
    # output the input number
    addi    $v0,    $zero,      1
    move    $a0,    $s0
    syscall 
    # output the text
    addi    $v0,    $zero,      4
    la      $a0,    doubled
    syscall 
    # output the doubled number
    addi    $v0,    $zero,      1
    move    $a0,    $s1
    syscall 
    # exit the program
    addi    $v0,    $zero,      10
    syscall 