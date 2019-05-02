.data

.text
	addi $s0, $zero, 4
	sll $t0, $s0, 3 # s0 := s0 * 2^(3)
	
	# Prepare syscall
	addi $v0, $zero, 1
	add $a0, $zero, $t0
	syscall