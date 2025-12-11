# this program should output an array element by element
.data 

arr: .word 1, 2, 3, 4, 5
newLine: .asciiz "\n"

.text

main: 

    # store no. elements
    la $t0, arr
    li $t1, 5
    li $t2, 0     

loop: 
    beq $t1, $t2, end   # if t2 == 5 -> end

    li $v0, 1
    lw $a0, 0($t0)
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    addi $t0, $t0, 4   # index to next element

    addi $t2, $t2, 1   # i = i + 1

    j loop

end: 
    jr $ra
