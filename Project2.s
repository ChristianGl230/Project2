.data
    emptyErrorMessage:	.asciiz "Input is empty."
    lengthErrorMessage: .asciiz "Input is too long."
    baseErrorMessage:   .asciiz "Invalid base-34 number."
    userInput:		.space 60
.text

    main:

	li $v0, 8       #Obtain user's input as text 

	la $a0, userInput

	li $a1, 60
	syscall
	
	removeLeadingSpace: 

