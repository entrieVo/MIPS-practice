# File: mips3-4.asm
# Purpose: To calculate the result of 5*x^2 + 2*x + 3
.text
.globl main
main:
    # Get input value, x
    addi $v0, $zero, 4
    la $a0, prompt
    syscall
    addi $v0, $zero, 5
    syscall
    move $s0, $v0

    # Calculate the result of 5*x*x + 2*x + 3 and store it in $s1
    mul $t0, $s0, $s0
    mul $t0, $t0, 5
    mul $t1, $s0, 2
    add $t0, $t0, $t1
    addi $s1, $t0, 3

    # Print output
    addi $v0, $zero, 4 # Print result string
    la $a0, result
    syscall
    addi $v0, $zero, 1 # Print result
    move $a0, $s1
    syscall

    # Exit the program
    addi $v0, $zero, 10
    syscall

.data
prompt: .asciiz "Enter a value for x: "
result: .asciiz "The result is: "