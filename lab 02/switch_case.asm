.data
prompt: .asciiz "choose an option: "
firstOption: .asciiz "You choosed the first optoin (1)\n"
secondOption: .asciiz "YOu choosed the second option (2)\n"
thirdOption: .asciiz "You choosed th third Option(3)\n"
wrongOption: .asciiz "You choosed an incorrect option, CYA. "


.text


main: 
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	move $s0, $v0
	
	blez $s0, wrong      # if s0 <= 0 → wrong
	bgt  $s0, 3, wrong   # if s0 > 3 → wrong

	beq $s0, 1, first
	beq $s0, 2, second
	beq $s0, 3, third
	
	wrong: 
		li $v0, 4
		la $a0, wrongOption
		syscall
		j done
		
	first:
		li $v0, 4
		la $a0, firstOption
		syscall
		
		j done
	second:
		li $v0, 4
		la $a0, secondOption
		syscall
		
		j done
	third: 
		li $v0, 4
		la $a0, thirdOption
		syscall

		j done

	done: 
		li $v0, 10
		syscall






