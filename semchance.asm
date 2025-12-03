jmp main

;
; Variables
;

; Player related

playerPos: var #1
	static playerPos, #600
playerChar: var #1
	static playerChar, #30

maxMoves: var #1
	static maxMoves, #100

currentMoves: var #1
	static currentMoves, #100

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

repeatStr: string "Press 0 to go again."
repeatPos: var #1
	static repeatPos, #611


;
; Main function
;

; r0 -> stores any position
; r1 -> stores any character

main:
	call move
	call printPlayer
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

	move_leave:
		rts

	move_up:
		load r0, playerPos
	
		; Checking if player is at the top (pos < 40)
		loadn r2, #40
		cmp r0, r2
		jle move_leave

		; New position that the player would have, needs to be checked
		call printClearPlayer
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
		jgr move_leave

		; New position that the player would have, needs to be checked
		call printClearPlayer
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
		jeq move_leave

		; New position that the player would have, needs to be checked
		call printClearPlayer
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
		jeq move_leave

		; New position that the player would have, needs to be checked
		call printClearPlayer
		inc r0
		call move_checkCollision

		; New position gets saved.
		store playerPos, r0

		rts

	move_checkCollision:
		rts

; prints a pre-made screen
; r1 = address of the first char
printScreen:
	push r0
	push r2
	push r3

	loadn r0, #0
	loadn r2, #1200

	printScreenLoop:
		add r3,r0,r1
		loadi r3, r3
		outchar r3, r0
		call makeScreenArray
		inc r0
		cmp r0, r2
		jne printScreenLoop

	pop r3
	pop r2
	pop r0
	rts

	makeScreenArray:
	push r1

	loadn r1, #map
	add r1, r1, r0
	storei r1, r3

	pop r1
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

	printStringLoop:
		add r3, r1, r4
		loadi r3, r3
		cmp r3, r2
		jeq printStringLeave
		outchar r3, r0
		inc r0
		inc r4
		jmp printStringLoop

	printStringLeave:
		pop r4
		pop r3
		pop r2
		rts

printPlayer:
	push r0
	push r1

	load r0, playerChar
	load r1, playerPos
	outchar r0, r1

	pop r1
	pop r0
	rts

printClearPlayer:
	push r1

	loadn r1, #0
	outchar r1, r0

	pop r1
	rts