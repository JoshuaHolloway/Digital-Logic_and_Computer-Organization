.data
	age: .word 23
.text
	li $v0, 1 # prepare to print an integer
	lw $a0, age
	syscall