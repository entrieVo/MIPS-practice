# File: mips3-5.asm
# Purpose: this program shows that adding 0x20 to a character
# can result in an error when converting case, but or'ing 0x20 always works
.text
.globl main
main:
    # Shows adding 0x20 only works if the character is upper case
    ori $v0, $zero, 4
    la $a0, output1
    syscall

    ori $t0, $zero, 0x41 # Load the character "A"
    addi $a0, $t0, 0x20 # Convert to "a" by adding
    ori $v0, $zero, 11 # Print the character
    syscall

    ori $v0, $zero, 4
    la $a0, output2
    syscall

    ori $t0, $zero, 0x61 # Load the character "a"
    addi $a0, $t0, 0x20 # Attemp to convert to lower case
    ori $v0, $zero, 11 # Print the character, does not work
    syscall

    # Show or'ing 0x20 works if the character is upper or lower case
    ori $v0, $zero, 4
    la $a0, output1
    syscall

    ori $t0, $zero, 0x41 # Load the character "A"
    ori $a0, $t0, 0x20 # Convert to "a" by adding
    ori $v0, $zero, 11 # Print the character
    syscall

    ori $v0, $zero, 4
    la $a0, output1
    syscall

    ori $t0, $zero, 0x61 # Load the character "a"
    ori $a0, $t0, 0x20 # Attemp to convert to lower case
    ori $v0, $zero, 11 # Print the character
    syscall

    ori $v0, $zero, 10 # Exit the program
    syscall

.data
output1: .asciiz "\nValid conversation: "
output2: .asciiz "\nInvalid conversation, nothing is printed: "