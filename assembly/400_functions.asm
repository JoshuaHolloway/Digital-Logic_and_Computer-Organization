.data
	message: .asciiz "Hello world!\nJosh!"

.text
	main:
	jal displayMessage
	
	
	# Tell system that the program is done
	li $v0, 10	# Service: exit (terminate execution),	Code in $v0: 10
	syscall
	
	displayMessage:
		li $v0, 4       # psuedo-instruction: 	addi $v0, $zero, imm
		la $a0, message # psuedo-instruction: 	la $t1, label:		Set $t1 to labels address
		syscall
		
		jr $ra