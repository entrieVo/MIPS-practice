.data
zeroAsFloat: .float 0.0                     # load the value into memory
number: .asciiz "Please enter the float: "

.text

main:
    lwc1    $f1,    zeroAsFloat             # load 0.0 value to $f4

    jal prompt

    jal print

prompt:
    addi    $v0,    $zero,          4
    la      $a0,    number
    syscall 

    addi    $v0,    $zero,          6
    syscall

    jr $ra

print:
    addi    $v0,    $zero,          2
    add.s   $f12,   $f0,            $f1
    syscall 
    # exit the program
    addi $v0, $zero, 10
    syscall