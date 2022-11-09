.data
value: .asciiz "Your random number is: "

.text

main:

    # get time value, set seed and generate 
    jal     getTime
    # show number
    jal print

getTime:
    addi    $v0,        $zero,  30      # Syscall 30: System Time syscall
    syscall                             # $a0 will contain the 32 LS bits of the system time

    add     $t0,        $zero,  $a0

setSeed:
    addi    $v0,        $zero,  40      # Syscall 40: Random seed
    add     $a1,        $zero,  $t0     # Set Random seed
    syscall 

random:
    addi    $v0,        $zero,  42      # Syscall 42: Random int range
    add     $a0,        $zero,  0       # Set RNG ID to 0
    addi    $a1,        $zero,  100     # Set upper bound to 100
    syscall                             # Generate a random number and put it in $a0

    add    $s1,        $zero,  $a0      # Copy the random number to $s1

    jr      $ra

print:
    li      $v0,        4
    la      $a0,        value
    syscall 

    li      $v0,        1
    move    $a0,        $s1
    syscall 
    # exit the program
    addi    $v0,        $zero,  10
    syscall 