.data
prompt_msg: .asciiz "Please enter number: "

.text
main:
    jal     prompt
    j print

# prompt -- prompt user for number
#
# RETURNS:
#
# a1 -- user number
prompt:
    # output prompt
    addi    $v0,    $zero,      4
    la      $a0,    prompt_msg
    syscall 
    # get number from user
    addi    $v0,    $zero,      5
    syscall 
    move    $a1,    $v0

    jr      $ra

print:

    addi    $v0,    $zero,      35
    move    $a0,    $a1
    syscall 