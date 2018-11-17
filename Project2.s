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



