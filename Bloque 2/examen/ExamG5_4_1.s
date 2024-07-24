
	.data
X:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10	;64-bit words
Y:	.word 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
result:	.space 8				;allocate 8 byte space in memory for result

	.text
main:	daddui R1,R0,0 	;R1 <-- 0
	daddui R3,R0,0 	;R3 <-- 0
	daddui R2,R0,10 	
	dsll R2,R2,3
	
loop:	dsll R3,R1,3
	daddi R1,R1,2
	beq R3,R2,end

	ld R4,X(R3) 		
	ld R5,Y(R3)
	ld R7,X+8(R3) 		
	ld R8,Y+8(R3)
	
	dadd R6,R4,R5
	dadd R9,R7,R8

	sd R5,X(R3)
	sd R6,Y(R3)
	sd R8,X+8(R3)
	
	j loop			; JUMP
	sd R9,Y+8(R3)

end:	halt 			;END OF PROGRAM
