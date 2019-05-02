.data

.text
	addi $t0, $zero, 2000
	addi $t1, $zero, 10
	
	
	# mult $t1, $t2, $t3
	# -Multiply without overflow
	# --Set HI to high-order 32-bits, LO and $t1 to low-order 32-bits of the product of $t2 and $t3
	# --(use mfhi to access HI, mflo to access LO)
	mult $t0, $t1

	# mflo $t1
	# -Move from LOW register : Set $t1 to contents of LO (see mult and div ops)
	mflo $s0
	
	# Prepare SYSCALL
	addi $v0, $zero, 1  # Code in $v0: [0 => print int Service]
	add $a0, $zero, $s0 # Arguement: [$a0 = integer to print]
	syscall