// Generates sawtooth, sinusoidal, and triangular waveforms
//AUTHORS: KAUSTAV BRAHMA, JOSHUA EBENEZER
ORG 8500H
	
TABLE: DB 128,192,238,255,238,192,128,64,17,0,17,64,128 ; look-up table for sinusoidal wave
	    
ORG 8100H
	
		
MOV DPTR,#0E803H
MOV A,#89H ; enable port A of 8255 as output, b as output and port c as input
MOVX @DPTR,A


; SINUSOID

;SINUSOID:

;AGAIN: MOV DPTR,#TABLE
       ;MOV R2,#13
	   
;BACK:  CLR A
       ;MOVC A,@A+DPTR
	   ;PUSH 83H ;pushing DPTR to stack so that we can use dptr to access port a of 8255
	   ;PUSH 82H
	   ;MOV DPTR,#0E800H
	   ;MOVX @DPTR,A
       ;POP 82H
	   ;POP 83H
	   ;INC DPTR
	   ;DJNZ R2,BACK
	   ;JMP AGAIN

; TRIANGULAR WAVE OF HIGHEST AMPLITUDE
;TRIANG:


;RPT:   MOV A,#00H
;BACK1: MOV DPTR,#0E800H
       ;MOVX @DPTR,A
       ;INC A
	   ;CJNE A,#255,BACK1
       ;SJMP BACK2
	   
;BACK2: MOV DPTR,#0E800H
       ;DEC A
       ;MOVX @DPTR,A
	   
	   ;CJNE A,#0,BACK2
	   ;SJMP RPT
	   
	   
;; SAWTOOTH WAVE OF HIGHEST AMPLITUDE

SAWTOOTH:


RPT1:   MOV A,#00H
BACK3: MOV DPTR,#0E800H
       MOVX @DPTR,A
       INC A
	   CJNE A,#255,BACK3
       SJMP RPT1

END
		
			

	
		

