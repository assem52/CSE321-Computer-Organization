.data 
end: .asciiz "The loop from 100 to 0 has ended successfully!"
newline: .asciiz "\n"
.text
#for (int i = 100, i >= 0; i--)
	# print i
#the loop has ended
main:
	li $t0, 100

	_for: 
	blt $t0, 0, _end_loop
	
	# inside the loop
	li $v0, 1
	move $a0, $t0
	syscall

	#print new line
	li $v0, 4
	la $a0, newline
	syscall

	# increase the index
	add $t0, $t0, -1

	j _for

	_end_loop:
	li $v0, 4
	la $a0, end
	syscall
	
	li $v0, 10
	syscall


