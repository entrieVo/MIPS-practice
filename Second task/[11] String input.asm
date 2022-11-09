.data
string: .space 101
stringSize: .word 100
prompt: .asciiz "Please enter string: "
output: .asciiz "Your string:\n"

.text

main:

    jal     dialogWindow
    jal     print

dialogWindow:

    addi    $v0,            $zero,      54
    la      $a0,            prompt
    la      $a1,            string
    lw      $a2,            stringSize
    syscall 

    jr      $ra

print:

    addi    $v0,            $zero,      4
    la      $a0,            output
    syscall 

    addi    $v0,            $zero,      4
    la      $a0,            string
    syscall 

exit:

    addi    $v0,            $zero,      10
    syscall 