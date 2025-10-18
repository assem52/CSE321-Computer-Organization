.data
name: .asciiz "Name:	Assem Melege"
id: .asciiz "ID:	20812022100248"
course: .asciiz "Course:	CSE322-Computer-Organization"

.text 

 main:
 	# print name
	li $v0, 4
	la $a0, name
	syscall

	# print new line
	li $v0, 11    #print char
	li $a0, 10    #ASCII for '/n'
	syscall

	#print ID
	li $v0, 4
	la $a0, id
	syscall
		
	# print new line
        li $v0, 11    #print char
        li $a0, 10    #ASCII for '/n'
        syscall

	# print course
	li $v0, 4
	la $a0, course
	syscall

	# print new line
        li $v0, 11    #print char
        li $a0, 10    #ASCII for '/n'
        syscall

	#terminate
	li $v0, 10
	syscall

