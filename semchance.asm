jmp main

;
; Variables
;

; Player related

playerPos: var #1
	static playerPos, #600

playerSprite: var #1
	static playerSprite, #30	

playerSpawn: var #1
	static playerSpawn, #600

maxSteps: var #1
	static maxSteps, #100

currentSteps: var #1
	static currentSteps, #100

; Map related

map: var #1200

currentMap: var #1
	static currentMap, #1

lab1StartingPos : var #1
	static lab1StartingPos, #82

lab2StartingPos : var #1
	static lab2StartingPos, #30

;
; Strings
;
winStr: string "You win!"
winPos: var #1
	static winPos, #576

;
; Main function
;

; r0 -> stores any position
; r1 -> stores any character

main:
	; print functions
	loadn r1, #0
	call printScreen
	loadn r0, #0
	load r1, currentSteps
	call printNumber
	call printPlayer

	; calculation functions
	call move
	call checkSteps
	jmp main

;
; Functions
;

move:
	; Verifies if a key was pressed
	inchar r1
	loadn r2, #255
	cmp r1, r2
	jeq move
	
	; Verifies whether the pressed key was WASD
	loadn r2, #'w'
	cmp r1, r2
	jeq move_up

	loadn r2, #'s'
	cmp r1, r2
	jeq move_down

	loadn r2, #'a'
	cmp r1, r2
	jeq move_left

	loadn r2, #'d'
	cmp r1, r2
	jeq move_right

	jmp move

	move_up:
		load r0, playerPos
	
		; Checking if player is at the top (pos < 40)
		loadn r2, #40
		cmp r0, r2
		jle move

		; New position that the player would have, needs to be checked
		sub r0, r0, r2
		call move_checkCollision

		; New position gets saved.
		store playerPos, r0

		rts

	move_down:
		load r0, playerPos
	
		; Checking if player is at the bottom (pos > 1159)
		loadn r2, #1159
		cmp r0, r2
		jgr move

		; New position that the player would have, needs to be checked
		loadn r2, #40
		add r0, r0, r2
		call move_checkCollision

		; New position gets saved.
		store playerPos, r0

		rts

	move_left:
		load r0, playerPos
	
		; Checking if player is at the left border
		loadn r2, #40
		mod r2, r0, r2
		loadn r3, #0
		cmp r2, r3
		jeq move

		; New position that the player would have, needs to be checked
		dec r0
		call move_checkCollision

		; New position gets saved.
		store playerPos, r0

		rts

	move_right:
		load r0, playerPos
	
		; Checking if player is at the right border
		loadn r2, #40
		mod r2, r0, r2
		loadn r3, #39
		cmp r2, r3
		jeq move

		; New position that the player would have, needs to be checked
		inc r0
		call move_checkCollision

		; New position gets saved.
		store playerPos, r0

		rts

	move_checkCollision:
		rts

checkSteps:
	push r2
	push r3

	; gets the current steps, checks if it's zero (which means the player goes back to spawn)
	load r2, currentSteps
	loadn r3, #0
	cmp r2, r3
	jeq checkSteps_reset

	dec r2
	store currentSteps, r2

	checkSteps_leave:
		pop r3
		pop r2
		rts

	checkSteps_reset:
		; resets the current steps of the player
		load r2, maxSteps
		store currentSteps, r2

		; moves the player back to the spawn point
		load r2, playerSpawn
		store playerPos, r2
		jmp checkSteps_leave
	
; prints a pre-made screen
; r1 = address of the first char
printScreen:
	push r0
	push r2
	push r3

	loadn r0, #0
	loadn r2, #1200

	printScreen_Loop:
		;add r3,r0,r1
		;loadi r3, r3
		outchar r1, r0 ; changed from r3 to r1 temporarily
		inc r0
		cmp r0, r2
		jne printScreen_Loop

	pop r3
	pop r2
	pop r0
	rts

; printCurrentScreen:
; 	push r1
; 	push r3

; 	loadn r3, #currentMap
; 	loadi r3, r3

; 	loadn r1, #0
; 	cmp r3, r1
; 	jeq printLab1

; 	loadn r1, #1
; 	cmp r3, r1
; 	jeq printLab2

; 	printLab1:
; 		loadn r1, #lab1
; 		jmp printCurrentScreenLeave

; 	printLab2:
; 		loadn r1, #lab2
; 		jmp printCurrentScreenLeave

; 	printCurrentScreenLeave:
; 		call printScreen
; 		call printBaseScreen
; 		pop r1
; 		rts

printString:
	push r2
	push r3
	push r4

	loadn r2, #'\0' ; max position
	loadn r4, #0

	printString_Loop:
		add r3, r1, r4
		loadi r3, r3
		cmp r3, r2
		jeq printString_Leave
		outchar r3, r0
		inc r0
		inc r4
		jmp printString_Loop

	printString_Leave:
		pop r4
		pop r3
		pop r2
		rts

; r0 = position, r1 = number
printNumber:
	push r2
	push r3
	push r4
	push r5

	mov r4, r1
	loadn r5, #0
	
	getDigits_Loop:
		; gets the rightmost digit of the number, pushes it into the stack
		loadn r2, #10
		mod r3, r4, r2
		push r3
		; divides the whole number by 10 to remove the last digit (which was added to the stack)
		div r4, r4, r2
		
		; r5 stores the number of iterations that will be done while printing
		inc r5
		
		; see if the number is equal to 0, leaves if so
		loadn r2, #0
		cmp r4, r2
		jeq printNumber_Loop
		jmp getDigits_Loop

	printNumber_Loop:
		; gets leftmost digit of the number and then prints it
		pop r3

		loadn r4, #48 ; 48 = ascii value of '0'
		add r3, r3, r4

		outchar r3, r0
		inc r0

		dec r5
		cmp r5, r2
		jeq printNumber_Leave
		jmp printNumber_Loop

	printNumber_Leave:
		pop r5
		pop r4
		pop r3
		pop r2
		rts

printPlayer:
	push r0
	push r1

	call checkPlayerSprite	
	load r0, playerSprite
	load r1, playerPos
	outchar r0, r1

	pop r1
	pop r0
	rts	

	checkPlayerSprite:
		push r0
		push r1

		load r0, playerSprite
		loadn r1, #30 ; first sprite's value is 30, second is 31
		cmp r0, r1
		jeq checkPlayerSprite_inc
		jmp checkPlayerSprite_dec

		checkPlayerSprite_leave:
			pop r1
			pop r0
			rts

		checkPlayerSprite_inc:
			inc r0
			store playerSprite, r0
			jmp checkPlayerSprite_leave

		checkPlayerSprite_dec:
			dec r0
			store playerSprite, r0
			jmp checkPlayerSprite_leave