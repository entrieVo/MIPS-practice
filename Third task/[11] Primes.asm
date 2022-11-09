# * Prime number - a number that is divisible without a remainder by itself and by one
# * Prime factor of a number - a prime number, when divided by which a given number doesn't give a remainder

.data
first:      .asciiz "Please enter number: "
last:       .asciiz "Please enter prime number: "
primeError: .asciiz "Error! Second number should be prime."

.text

main:

    add     $a2,                $zero,      $zero       # counter of iterations

    # get first number
    la      $a0,                first
    jal     prompt
    move    $t1,                $v0                     # place to store number
    # get second number
    la      $a0,                last
    jal     prompt
    move    $t2,                $v0
    # check is second number is prime multiplier
    move    $v0,                $t1
    move    $a2,                $t2
    jal     isPrimeMultiplier

    j       print

print:
    # output the result
    addi    $v0,                $zero,      1
    move    $a0,                $s0
    syscall 
    # exit the program
    addi    $v0,                $zero,      10
    syscall

# prompt -- prompt user for numbers
#
# RETURNS:
#   v0 -- input number
#
# arguments:
#   a0 -- address of prompt string
#   a2 -- pointer to counter
prompt:
    # output the prompt
    addi    $v0,                $zero,      4
    syscall 
    # get number from user
    addi    $v0,                $zero,      5
    syscall 

    # counter
    addi    $a2,                $a2,        1
    # check for second number (should be prime)
    beq     $a2,                2,          saveReg

    jr      $ra

# isPrimeMultiplier -- checks if the number is prime multiplier
#
# RETURNS:
#   s0 -- flag: 0 - is prime multiplier, else isn't
#
# arguments:
#   v0 -- number to check
#   a2 -- possible prime factor
isPrimeMultiplier:
    beq     $v0,                $a2,        prime
    div     $v0,                $a2
    mfhi    $s0
    jr      $ra

# isPrime -- checks if the number is prime
#
# RETURNS:
#   Error message in case second nubmer isn't prime
#
# arguments:
#   v0 -- addrss of number to check
#   a2 -- const = 2
isPrime:

    # cycle in 2 to 7
    bgt     $a2,                7,          loadReg

    jal     isPrimeMultiplier
    beqz    $s0,                notPrime                # if the remainder of the branch isn't 0, the number is prime

    addi    $a2,                $a2,        1
    j       isPrime

# save register to return to the main function
saveReg:
    addi    $sp,                $sp,        -4
    sw      $ra,                0($sp)

    jal     isPrime

# load register to return to the main function
loadReg:
    lw      $ra,                0($sp)
    addi    $sp,                $sp,        4

    jr      $ra

# returns to the function if the number is prime
prime:
    jr      $ra
# displays an error message and aborts the program
notPrime:
    addi    $v0,                $zero,      4
    la      $a0,                primeError
    syscall 

    addi    $v0,                $zero,      10
    syscall 
