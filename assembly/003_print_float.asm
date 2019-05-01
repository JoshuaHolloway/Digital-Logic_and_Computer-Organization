.data
	PI: .float 3.14
.text
	li   $v0,  2  # prepare to print a float
	lwc1 $f12, PI # load from co-processor-1
	syscall