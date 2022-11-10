.text
main:
    # pitch (0-127)
    addi    $a0,    $zero,  108
    # duration in milliseconds
    addi    $a1,    $zero,  -1
    # instrument (0-127)
    addi    $a2,    $zero,  0
    # volume (0-127)
    addi    $a3,    $zero,  127
    j       play

play:
    addi    $v0,    $zero,  31
    syscall 

exit:
    addi    $v0,    $zero,  10
    syscall 