.data
number:     .asciiz "Please enter number: "
result:     .asciiz "\nNumber multiplied by 10 is "
check:      .asciiz "\nThe check with mult and mflo gave "

.text
main:
    # load the number to be multiplied by
    addi        $a2,            $zero,  10

    jal         prompt

    jal         check_mult
    jal         bitwise_mult

    j           print

# prompt -- prompt user for number
#
# RETURNS:
# a1 -- number from user
prompt:
    # output the prompt
    addi        $v0,            $zero,  4
    la          $a0,            number
    syscall 
    # get number from user
    addi        $v0,            $zero,  5
    syscall 
    move        $a1,            $v0

    jr          $ra

# show results
print:
    # output the bitwise multiply result
    addi        $v0,            $zero,  4
    la          $a0,            result
    syscall 

    addi        $v0,            $zero,  1
    move        $a0,            $s0
    syscall 
    # output resulting check with mult and mflo
    addi        $v0,            $zero,  4
    la          $a0,            check
    syscall 

    addi        $v0,            $zero,  1
    move        $a0,            $s1
    syscall 


    # exit the program
    addi        $v0,            $zero,  10
    syscall

# bitwise_mult -- the function checks if the last bit of the
# binary record of the number is one, and if so, adds the user
# number to the result, then shifts it one bit to the left and
# the number by which we multiply it to the right
#
# RETURNS:
# s0 -- user number multiplied by 10
#
# arguments:
# a1 -- user number
# a2 -- constant, the number by which to multiply
# t0 -- temporary variable to store the last bit 
bitwise_mult:

    multiply:
        beqz        $a2,            end             # while a2 != 0

            andi    $t0,            $a2,    1       # load the first bit into t0
            beq     $t0,            1,      sum     # if the first bit equal 1, then add it to result

            shift:
            srl     $a2,            $a2,    1       # a2 >> 1
            sll     $a1,            $a1,    1       # a1 << 1

        j           multiply

    sum:
        add         $s0,            $s0,    $a1
        j           shift

    end:
        jr          $ra
# check -- using the standard multiplication function
#
# RETURNS:
# s1 -- user number multiplied by 10
#
# arguments:
# a1 -- user number
# a2 -- constant, the number by which to multiply
check_mult:
    mult        $a1,            $a2
    mflo        $s1
    jr          $ra