//Finding second largest of 100 numbers 


		ORG 8100H

		MOV DPTR,#9000H
		MOVX A,@DPTR ;move first number to R0
		MOV R0,A
		INC DPTR
		MOVX A,@DPTR ;move second number to R1
		MOV R1,A
		
		MOV R5,#98H	

		MOV A,R0
		MOV B,R1
		CJNE A,B,LARGE
LARGE:	JNC LOOP   ;jump if R0>=R1
		MOV A,R1    ;else swap R0 and R1 (store largest number in R0 and second largest in R1)
		MOV B,R0
		MOV R1,B
		MOV R0,A	
LOOP:   INC DPTR
	    MOVX A,@DPTR
		MOV R2,A
		
		MOV A,R0
		MOV B,R2
		CJNE A,B,CHECK1   ;if R2(next number in array) is greater than largest number

CHECK1: JNC MIDDLE  ;R0>=R2
        MOV A,R0          ;keep R2 as largest number and R0 as second largest
		MOV B,R2
		MOV R0,B
		MOV R1,A
		SJMP NEXT
MIDDLE: MOV A,R1
		MOV B,R2
		CJNE A,B,CHECK2   ;check if R2 is more than R1
CHECK2: JNC NEXT       ;if not, increment DPTR
        MOV A,R2
		MOV R1,A   ;then keep R2 as second largest
NEXT: 	DJNZ R5,LOOP
        MOV DPTR,#9500H
		MOV A,R1
		MOVX @DPTR,A
		
		END
