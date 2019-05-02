.data 
	number1: .word 2
	number2: .word 4

.text
	addi $t0, $zero, 2 
	addi $t1, $zero, 4
	
	# Range: 
	# -Input: 16-bits [each]
	# -Output: 32-bits
	mul $t2, $t0, $t1
	
	# Prepare SYSCALL
	addi $v0, $zero, 1  # Code in $v0: [0 => print int Service]
	add $a0, $zero, $t2 # Arguement: [$a0 = integer to print]
	syscall