.data
first:          .asciiz "Please enter first positive value: "
last:           .asciiz "Please enter second positive value: "
print_msg:      .asciiz "\nMultiplication result: "
print_msg2:     .asciiz "\nNo overflow occurred during multiplication."
overflow_msg:   .asciiz "An overflow occurred during multiplication."

.text
main:
    # prompt and get first number
    la      $a0,        first
    jal     prompt
    move    $a1,        $v0
    # prompt and get first number
    la      $a0,        last
    jal     prompt
    move    $a2,        $v0

    jal     multiply

    j       print

# prompt -- prompt user for string
#
# RETURNS:
# v0 -- value
#
# arguments:
# a0 -- address of prompt string
prompt:
    # output the prompt
    addi    $v0,        $zero,          4
    syscall 
    # get number from user
    addi    $v0,        $zero,          5
    syscall 

    jr      $ra

print:

    addi    $v0,        $zero,          4
    la      $a0,        print_msg
    syscall 

    addi    $v0,        $zero,          1
    move    $a0,        $s0
    syscall 

    addi    $v0,        $zero,          4
    la      $a0,        print_msg2
    syscall 

    j       exit

# multiply -- using the standard multiplication function
#
# RETURNS:
# s0 -- multiplication result
#
# arguments:
# a1 -- first argument
# a2 -- second argument
multiply:
    mult    $a1,        $a2
    mflo    $s0

    bltz    $s0,        overflow

    jr      $ra

# output overflow message
overflow:
    addi    $v0,        $zero,          4
    la      $a0,        overflow_msg
    syscall 

    j       exit

# exit the program
exit:
    addi    $v0,        $zero,          10
    syscall 