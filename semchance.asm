jmp main

;
; Variables
;

; Player related

playerPos: var #1
	static playerPos, #0

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

main:
	halt

;
; Functions
;

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

printCurrentScreen:
	push r1
	push r3

	loadn r3, #currentMap
	loadi r3, r3

	loadn r1, #0
	cmp r3, r1
	jeq printLab1

	loadn r1, #1
	cmp r3, r1
	jeq printLab2

	printLab1:
		loadn r1, #lab1
		jmp printCurrentScreenLeave

	printLab2:
		loadn r1, #lab2
		jmp printCurrentScreenLeave

	printCurrentScreenLeave:
		call printScreen
		call printBaseScreen
		pop r1
		rts

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