.data
	number1: .word 5
	number2: .word 10
	A: .space 12 # [Bytes] => 3-elements => 3x4-Bytes
.text
	addi $s0, $zero, 4	# s0 :=	4	[1]
	addi $s2, $zero, 10	# s1 := 10	[?]
	addi $s2, $zero, 12	# s2 := 12	[3]

	# Index = $t0
	addi $t0, $zero, 0
	
	# Store contents of s0 into memory location at &A[0]
	sw $s0, A($t0)
		addi $t0, $t0, 4
	sw $s1, A($t0)
		addi $t0, $t0, 4
	sw $s2, A($t0)
	
	lw $t6, A($zero)
	
	li $v0, 1
	addi $a0, $t6, 0
	syscall