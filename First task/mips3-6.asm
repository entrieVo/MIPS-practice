# File: mips3-6.asm
# Purpose: To show the XOR operation is reversible
.text
.globl main
main:
    ori $s0, $zero, 0x01234567 # the hex numbers

    # Write out the XOR'ed value
    la $a0, output1
    li $v0, 4
    syscall
    xori $s0, $s0, 0xffffffff # the results in $t1 will be fedcba98
    move $a0, $s0
    li $v0, 34
    syscall

    # Show the original value has been restored
    la $a0, output2
    li $v0, 4
    syscall
    xori $s0, $s0, 0xffffffff # the results in $t1 will be 01234567
    move $a0, $s0
    li $v0, 34
    syscall

    ori $v0, $zero, 10 # Exit the program
    syscall
.data
    output1: .asciiz "\nAfter first xor: "
    output2: .asciiz "\nAfter second xor: "