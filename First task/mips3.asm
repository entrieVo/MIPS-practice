.text
main:
	# Prompt for the string to enter
	li $v0, 4
	la $a0, prompt
	syscall

	# Read the string
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	
	# Output the text
	li $v0, 4
	la $a0, output
	syscall

	# Output the number
	li $v0, 4
	la $a0, input
	syscall

	# Exit the program
	li $v0, 10
	syscall

.data
input: .space 81
inputSize:  .word 80
prompt: .asciiz "Please enter an string: "
output: .asciiz "\nYou typed the string: "