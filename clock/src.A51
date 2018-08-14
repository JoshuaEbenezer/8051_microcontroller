ORG 8500H
DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH ; decoding logic for 0-9 

ORG 0FFF0H
LJMP ISR_TIMER

ORG 8100H
    ; START TEST
    ;MOV DPTR,#0E803H
    ;MOV A,#80H
    ;MOVX @DPTR,A
    
           ;MOV DPTR,#0E801H
           ;MOV A,#11011111B ; decoding logic sent to port B to get the output
           ;MOVX @DPTR,A

           ;MOV DPTR,#0E800H
           ;MOV A,#7DH
           ;MOVX @DPTR,A
           
           
           ; STOP TEST
    

MOV R3,#3 ;used to initialize the value of all registers to zero.
MOV R1,#14 ;to make the counter count 14*71ms=1sec

MOV DPTR,#9000H
MOV A,#23
MOVX @DPTR,A
INC DPTR

MOV A,#59
MOVX @DPTR,A
INC DPTR

MOV A,#57
MOVX @DPTR,A

         MOV DPTR,#9003H
REPEAT:    MOV A,#12
        MOVX @DPTR,A
        INC DPTR
        DJNZ R3,REPEAT
        
MOV DPTR,#0E803H
MOV A,#80H
MOVX @DPTR,A

MOV TMOD,#1
MOV TL0,#0
MOV TH0,#0
CLR TF0
MOV IE,#82H
SETB TR0

;CALCULATE THE DIGITS FOR THE INITIAL TIME

;MOV 45H,#0
ACALL CALC_DIGITS
                
;END OF CALCULATING INITIAL DIGITS

;MAIN : 
       ; some logic for seeing the mode and deciding whether to display date or time

;function to display time

DISP_TIME: 
           ;MOV DPTR,#0E801H
           ;MOV A,#11111110B ; decoding logic sent to port B to get the output
           ;MOVX @DPTR,A
           ;MOV DPTR,#8500H
           ;MOV A,45H ; 45H stores the unit's place of the seconds
           
           ;MOVC A,@A+DPTR
           ;MOV DPTR,#0E800H
           ;MOVX @DPTR,A
           ;ACALL DELAY ; to keep this display for some time
           
           ;MOV DPTR,#0E801H
           ;MOV A,#11111101B ; decoding logic sent to port B to get the output
           ;MOVX @DPTR,A
           ;MOV DPTR,#8500H
           ;MOV A,44H
           
           ;MOVC A,@A+DPTR
           ;MOV DPTR,#0E800H
           ;MOVX @DPTR,A
           ;ACALL DELAY ; to keep this display for some time
           
           ;MOV DPTR,#0E801H
           ;MOV A,#11111011B ; decoding logic sent to port B to get the output
           ;MOVX @DPTR,A
           ;MOV DPTR,#8500H
           ;MOV A,43H
           
           ;MOVC A,@A+DPTR
           ;MOV DPTR,#0E800H
           ;MOVX @DPTR,A
           ;ACALL DELAY ; to keep this display for some time
           
           ;MOV DPTR,#0E801H
           ;MOV A,#11110111B ; decoding logic sent to port B to get the output
           ;MOVX @DPTR,A
           ;MOV DPTR,#8500H
           ;MOV A,42H
           
           ;MOVC A,@A+DPTR
           ;MOV DPTR,#0E800H
           ;MOVX @DPTR,A
           ;ACALL DELAY ; to keep this display for some time
           
           ;MOV DPTR,#0E801H
           ;MOV A,#11101111B ; decoding logic sent to port B to get the output
           ;MOVX @DPTR,A
           ;MOV DPTR,#8500H
           ;MOV A,41H
           
           ;MOVC A,@A+DPTR
           ;MOV DPTR,#0E800H
           ;MOVX @DPTR,A
           ;ACALL DELAY ; to keep this display for some time
           
           ;MOV DPTR,#0E801H
           ;MOV A,#11011111B ; decoding logic sent to port B to get the output
           ;MOVX @DPTR,A
           ;MOV DPTR,#8500H
           ;MOV A,40H
           
           ;MOVC A,@A+DPTR
           ;MOV DPTR,#0E800H
           ;MOVX @DPTR,A
           ;ACALL DELAY ; to keep this display for some time
           
DISP_DATE:
           MOV DPTR,#0E801H
           MOV A,#11111110B ; decoding logic sent to port B to get the output
           MOVX @DPTR,A
           MOV DPTR,#8500H
           MOV A,4BH ; 45H stores the unit's place of the seconds
           
           MOVC A,@A+DPTR
           MOV DPTR,#0E800H
           MOVX @DPTR,A
           ACALL DELAY ; to keep this display for some time
           
           MOV DPTR,#0E801H
           MOV A,#11111101B ; decoding logic sent to port B to get the output
           MOVX @DPTR,A
           MOV DPTR,#8500H
           MOV A,4AH
           
           MOVC A,@A+DPTR
           MOV DPTR,#0E800H
           MOVX @DPTR,A
           ACALL DELAY ; to keep this display for some time
           
           MOV DPTR,#0E801H
           MOV A,#11111011B ; decoding logic sent to port B to get the output
           MOVX @DPTR,A
           MOV DPTR,#8500H
           MOV A,49H
           
           MOVC A,@A+DPTR
           MOV DPTR,#0E800H
           MOVX @DPTR,A
           ACALL DELAY ; to keep this display for some time
           
           MOV DPTR,#0E801H
           MOV A,#11110111B ; decoding logic sent to port B to get the output
           MOVX @DPTR,A
           MOV DPTR,#8500H
           MOV A,48H
           
           MOVC A,@A+DPTR
           MOV DPTR,#0E800H
           MOVX @DPTR,A
           ACALL DELAY ; to keep this display for some time
           
           MOV DPTR,#0E801H
           MOV A,#11101111B ; decoding logic sent to port B to get the output
           MOVX @DPTR,A
           MOV DPTR,#8500H
           MOV A,47H
           
           MOVC A,@A+DPTR
           MOV DPTR,#0E800H
           MOVX @DPTR,A
           ACALL DELAY ; to keep this display for some time
           
           MOV DPTR,#0E801H
           MOV A,#11011111B ; decoding logic sent to port B to get the output
           MOVX @DPTR,A
           MOV DPTR,#8500H
           MOV A,46H
           
           MOVC A,@A+DPTR
           MOV DPTR,#0E800H
           MOVX @DPTR,A
           ACALL DELAY ; to keep this display for some time
           
           LJMP DISP_TIME
           
           

;function to call a delay subroutine

DELAY :    MOV R5,#200
INCR  :    DJNZ R5,INCR
           RET




        
            
; ISR
ISR_TIMER :
            CLR TR0
            
            PUSH 83H ;pushing the value of DPTR registers in stack
            PUSH 82H
            
            DJNZ R1,ENDLOOP

            ;MOV DPTR,#0E801H
            ;MOV A,#11011111B ; decoding logic sent to port B to get the output
            ;MOVX @DPTR,A

            ;MOV DPTR,#0E800H
            ;MOV A,#7DH
            ;MOVX @DPTR,A
            
            MOV R1,#14 ; because now it is 1 sec so time to update sec,min,hours accordingly
            ACALL CALC_DIGITS
            MOV DPTR,#9002H
            MOVX A,@DPTR
            CJNE A,#59,INCREASE
            CLR A
            MOVX @DPTR,A

            MOV DPTR,#9001H
            MOVX A,@DPTR
            CJNE A,#59,INCREASE
            CLR A
            MOVX @DPTR,A
            
            MOV DPTR,#9000H
            MOVX A,@DPTR
            CJNE A,#23,INCREASE
            CLR A
            MOVX @DPTR,A
            
            MOV DPTR,#9003H
            MOVX A,@DPTR
            CJNE A,#29,INCREASE
            CLR A
            MOVX @DPTR,A
            
            MOV DPTR,#9004H
            MOVX A,@DPTR
            CJNE A,#11,INCREASE
            CLR A
            MOVX @DPTR,A
            
            MOV DPTR,#9005H
            MOVX A,@DPTR
            
INCREASE :  INC A
            MOVX @DPTR,A
            
            
            MOV TL0,#0
            MOV TH0,#0
            
            
            
ENDLOOP :   SETB TR0
            ;MOV DPTR,#0E801H
            ;MOV A,#11011111B ; decoding logic sent to port B to get the output
            ;MOVX @DPTR,A

            ;MOV DPTR,#0E800H
            ;MOV A,#7DH
            ;MOVX @DPTR,A
            
            POP 82H ;pop value of dptr from stack when the updation takes place
            POP 83H

            RETI

CALC_DIGITS :   MOV DPTR,#9000H
                MOVX A,@DPTR ;storing digits of hours
                MOV B,#0AH
                DIV AB
                MOV 40H,A
                MOV 41H,B
                INC DPTR

                MOVX A,@DPTR ;storing digits of minutes
                MOV B,#0AH
                DIV AB
                MOV 42H,A
                MOV 43H,B
                INC DPTR

                MOVX A,@DPTR ;storing digits of seconds
                MOV B,#0AH
                DIV AB
                MOV 44H,A
                MOV 45H,B
                INC DPTR

                MOVX A,@DPTR ;storing digits of day
                MOV B,#0AH
                DIV AB
                MOV 46H,A
                MOV 47H,B
                INC DPTR

                MOVX A,@DPTR ;storing digits of month
                MOV B,#0AH
                DIV AB
                MOV 48H,A
                MOV 49H,B
                INC DPTR

                MOVX A,@DPTR ;storing digits of year
                MOV B,#0AH
                DIV AB
                MOV 4AH,A
                MOV 4BH,B
                RET
            ; END OF CALC_DIGITS
           
END          
