.data
prompt: .asciiz "Enter numbers to add: "

.text 

main: 
    # first we prompt the user
    la $a0, prompt
    li $v0, 4
    syscall

    # store the user values 
    li $v0, 5   # read integer
    syscall
    move $a0, $v0

    li $v0, 5
    syscall
    move $a1, $v0

    jal addFunc

    # move the result from vo (responsible for return values) into a0 for output
    move $a0, $v0

    li $v0, 1
    syscall

    # terminate the program 
    li $v0, 10
    syscall

addFunc: 
    
    add $v0, $a0, $a1

    jr $ra