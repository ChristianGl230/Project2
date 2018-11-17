.data
    emptyErrorMessage:	.asciiz "Input is empty."
    lengthErrorMessage: .asciiz "Input is too long."
    baseErrorMessage:   .asciiz "Invalid base-34 number."
    userInput:		.space 60
.text

    main:

	li $v0, 8   

	la $a0, userInput

	li $a1, 60
	syscall
	
	removeLeadingSpace: 
	li $t8, 32
	lb $t9, 0($a0)

	beq $t8, $t9, removeFirst

	move $t9, $a0

	j checkLength



	removeFirst:

	addi $a0, $a0, 1

	j removeLeadingSpace
	
	checkLength:
	addi $t0, $t0, 0
	addi $t1, $t1, 10
	add $t4, $t4, $a0
	
	lengthLoop:
	lb $t2, 0($a0)
	beqz $t2, done  
	beq $t2, $t1, done
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	j lengthLoop
	
	done:
	beqz $t0, emptyError
	slti $t3, $t0, 5
	beqz $t3, lengthError
	move $a0, $t4
	j checkString
	
	emptyError:
	li $v0, 4
	la $a0, emptyErrorMessage
	syscall
	j exit
	
	lengthError:
	li $v0, 4
	la $a0, lengthErrorMessage
	syscall
	j exit
	
	checkString:
	lb $t5, 0($a0)
	beqz $t5, conversions
	beq $t5, $t1, conversions 
	slti $t6, $t5, 48
	bne $t6, $zero, baseError
	slti $t6, $t5, 58   


	
	



