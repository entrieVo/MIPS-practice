.data
question:  .asciiz "- What's your favorite flavor pie?\n- "
favorite:  .asciiz "- So, you like "
flavor:    .space 20
pie:       .asciiz " pie."
inference: .space 80

.text

main:
    # prompt the flavor
    la      $a0,    question
    la      $a1,    flavor                      # buffer adress
    jal     prompt
    move    $s0,    $v0                         # save string length
    # point to combined string buffer ( gets update across addstr calls )
    la      $a0,    inference
    # append strings to output
    la      $a1,    favorite
    jal     addstr

    la      $a1,    flavor
    jal     addstr

    la      $a1,    pie
    jal     addstr

    j       print

print:
    # output the combined string
    addi    $v0,    $zero,          4
    la      $a0,    inference
    syscall 
    # exit the progran
    addi    $v0,    $zero,          10
    syscall 
# prompt: returns - v0(length of string),
# arguments - a0(address of prompt string), a1(address of string buffer)
# other - v0(holds ASCII for newline)
prompt:
    # output the prompt
    addi    $v0,    $zero,          4
    syscall 
    # get string from user
    addi    $v0,    $zero,          8
    move    $a0,    $a1                         # place to store string
    addi    $a1,    $zero,          20          # maximum length of string
    syscall 

    addi    $v1,    $zero,          0x0A        # ASCII value for new line
    move    $a1,    $a0                         # remember start of string
# strip line and get string length
line_trim:
    lb      $v0,    0($a0)                      # get char in string
    addi    $a0,    $a0,            1           # pre-increment by 1 to point to next char
    beq     $v0,    $v1,            line_done   # is it newline? if yes, fly
    bnez    $v0,    line_trim                   # is it EOS? no, loop

line_done:
    subi    $a0,    $a0,            1           # compensate for pre-increment
    sb      $zero,  0($a0)                      # zero out the newline
    sub     $v0,    $a0,            $a1         # get string length
    jr      $ra

addstr:
    lb      $v0,    0($a1)
    beqz    $v0,    addstr_done

    sb      $v0,    0($a0)

    addi    $a0,    $a0,            1
    addi    $a1,    $a1,            1
    j       addstr

addstr_done:
    sb      $zero,  0($a0)
    jr      $ra