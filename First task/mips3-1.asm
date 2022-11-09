# File: mips3-1.asm
# Purpose: To illustrate some addition operators
# illustrate R format add operator
li $t1, 100
li $t2, 50
add $t0, $t0, $t2
# illustrate add with an immediatem=. Note that
# an add with a pseudo instruction translated
# into an addi instruction
addi $t0, $t0, 50
add $t0, $t0, 50
# using an unsigned number. Note that the
# result is not what is expected
# for negative numbers.
addiu $t0, $t2, -100
# addiction using a 32 immediate. Note that 5647123
# base 10 is 0x562b13
addi $t1, $t2, 5647123