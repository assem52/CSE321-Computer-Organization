.data 

prompt: .asciiz "Enter your Integer: "
zero: .asciiz "ZERO!!/n"
positive: .asciiz "Positive /n "
negative: .asciiz "Negative! /n"


.text

# if(a == 0)
#  print "Zero"
# else if (a > 0)
   # print "POsitive"
# else 
#   #print negative

main: 

	# prompting for user to enter a number
	li $v0, 4   
	la $a0, prompt
	syscall

	# reading an integer
	li $v0, 5
	syscall

	move $t0, $v0     # moving the integer to temporary rgx

if: 
	bne $t0, $zero, elsif
	la $a0, zero
	j endif

elsif: 
	bltz $t0, else
	la $a0, positive
	j endif

else: 
	la $a0, negative

endif: 
	li $v0, 4
	syscall

exit: 
	li $v0, 10
	syscall








