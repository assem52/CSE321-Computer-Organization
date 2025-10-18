.data
nprompt: .asciiz "Enter the number of integers: "
prompt: .asciiz "Enter your Numbers: \n"
ans: .asciiz "Average is : "

.text

main:
	li $v0, 4         # syscall code 4 = print string
	la $a0, nprompt   # address of prompt string
	syscall            # print "Enter the number of integers: "

	li $v0, 5         # syscall code 5 = read integer
	syscall            # wait for user input
	move $s0, $v0     # store the entered number in $s0

	li $v0, 4
	la $a0, prompt
	syscall

	move $t0, $zero  #i = 0
	move $t1, $zero  # sum = 0

	loop: 
		beq $t0, $s0, done   # i == n

		li $v0, 5  # read integer
		syscall
		add $t1, $t1, $v0  # sum += number

		addi $t0, $t0, 1   # i += 1
		j loop

	done: 
		div $t1, $s0  # avg = sum / n
		mflo $t2  # move from LO to $t2 (average)

		li $v0, 4
		la $a0, ans
		syscall

		li $v0, 1
		move $a0, $t2
		syscall

		li $v0, 10
		syscall






