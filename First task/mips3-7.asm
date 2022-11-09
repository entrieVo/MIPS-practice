# File: mips3-7.asm
# Purpose: To illustate various shift operations
.text
.globl main
main:
    #SLL example
    addi $t0, $zero, 4
    sll $s0, $t0, 2
        addi $v0, $zero, 4
        la $a0, result1
        syscall
            addi $v0, $zero, 1
            move $a0, $s0
            syscall

    #SRL example
    addi $t0, $zero, 16
    srl $s0, $t0, 2
        addi $v0, $zero, 4
        la $a0, result2
        syscall
            addi $v0, $zero, 1
            move $a0, $s0
            syscall

    #SRA example
    addi $t0, $zero, 34
    sra $s0, $t0, 2
        addi $v0, $zero, 4
        la $a0, result3
        syscall
            addi $v0, $zero, 1
            move $a0, $s0
            syscall

    #SRA example
    addi $t0, $zero, -34
    sra $s0, $t0, 2 # sra 2 bits, which is division by 4
        addi $v0, $zero, 4 # Output the result
        la $a0, result4
        syscall
            addi $v0, $zero, 1
            move $a0, $s0
            syscall

    #ror example
    ori $t0, $zero, 0xffffffe1
    ror $s0, $t0, 2
        li $v0, 4
        la $a0, result5
        syscall
            li $v0, 34
            move $a0, $s0
            syscall

    #rol example
    ori $t0, $zero, 0xffffffe1
    rol $s0, $t0, 2
        li $v0, 4
        la $a0, result6
        syscall
            li $v0, 34
            move $a0, $s0
            syscall

    addi $v0, $zero, 10 # Exit the program
    syscall

.data
result1: .asciiz "\nshift left logical 4 by 2 bits is "
result2: .asciiz "\nshift right logical 16 by 2 bits is "
result3: .asciiz "\nshift right arithmetic 34 by 2 bits is "
result4: .asciiz "\nshift right arithmetic -34 by 2 bits is "
result5: .asciiz "\nrotate right 0 xffffffe1 by 2 bits is "
result6: .asciiz "\nrotate left 0 xffffffe1 by 2 bits is "