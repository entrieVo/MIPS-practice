.data
intro: .ascii "This program goes to sleep for 4 seconds before exit.\n"
       .asciiz "Wait."
time: .word 4                               # optinal time (in seconds)

.text

main:

    jal timeCount

    jal sleep

timeCount:
    lw      $a1,    time($zero)
    mul     $a1,    $a1,            1000

    addi    $v0,    $zero,          4
    la      $a0,    intro
    syscall 

    jr $ra

sleep:
    addi    $v0,    $zero,          32
    la      $a0,    ($a1)
    syscall

exit:
    addi    $v0,    $zero,          10
    syscall