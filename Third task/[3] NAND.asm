.data
number: .asciiz "Please enter number: "
nand: .asciiz " NAND "
equal: .asciiz " = "
newLine: .asciiz "\n"

.text
main:
    jal     prompt
    # x NAND 1
    addi    $a2,    $zero,      -1
    jal     NAND
    move    $s1,    $t0
    # x NAND 0
    addi    $a2,    $zero,      0
    jal     NAND
    move    $s0,    $t0

    jal     print

    addi    $a2,    $zero,      1
    move    $s0,    $s1
    jal     print

    j       exit

# prompt -- prompt user for number
#
# RETURNS:
#
# a1 -- user number
prompt:
    # output the prompt
    addi    $v0,    $zero,      4
    la      $a0,    number
    syscall 
    # get number from user
    addi    $v0,    $zero,      5
    syscall 
    move    $a1,    $v0

    jr      $ra

# NAND -- logical operator
#
# RETURNS:
# t0 -- x NAND y
#
# arguments:
# a1 -- user number (x)
# a2 -- nand argument: 0, 1 (y)
NAND:
    and     $t0,    $a1,        $a2
    not     $t0,    $t0

    jr      $ra

# print -- shows results
#
# arguments:
# a1 -- user number
# a2 -- nand argument
# s0 -- nand result
print:
    addi    $v0,    $zero,      1
    move    $a0,    $a1
    syscall 

    addi    $v0,    $zero,      4
    la      $a0,    nand
    syscall 

    addi    $v0,    $zero,      11
    la      $a0,    ($a2)
    syscall 

    addi    $v0,    $zero,      4
    la      $a0,    equal
    syscall 

    addi    $v0,    $zero,      1
    move    $a0,    $s0
    syscall 

    addi    $v0,    $zero,      4
    la      $a0,    newLine
    syscall 

    jr      $ra

exit:
    addi    $v0,    $zero,      10
    syscall 
