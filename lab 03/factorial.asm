.data

prompt: .asciiz "Enter the number you want its Factorial:"
result: .asciiz "your Factorial is: "

.text
main: 
    # prompt
    la $a0, prompt
    li $v0, 4
    syscall 
    # read input 
    li $v0, 5
    syscall
    # move the integer to the arg reg
    move $a0, $v0
    
    la $a0, result
    li $v0, 4
    syscall

    # call the function
    jal calcFactorial


    # print the factorial value 
    move $a0, $v0
    li $v0, 1
    syscall

    # terminate 
    li $v0, 10
    syscall


calcFactorial: 

    addi $sp, $sp, -8
    sw $s0, 4($sp)
    sw $s1, 0($sp)

    move $s0, $a0
    li $s1, 1
    li $t0, 1

    ble $s0, $t0, endLoop
    
loop: 

    # if n == 1 => end loop 
    beq $s0, $t0, endLoop
   
    mul $s1, $s1, $s0
    
    sub $s0, $s0, $t0

    j loop

endLoop: 
    # move the final value to the value reg
    move $v0, $s1
    # deallocate
    lw $s1, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8

    # return to main
    jr $ra