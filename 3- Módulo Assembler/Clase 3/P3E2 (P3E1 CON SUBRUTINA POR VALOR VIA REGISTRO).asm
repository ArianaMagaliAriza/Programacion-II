       org 1000h
num1_L dw 4822h
num1_H dw 0010h
num2_L dw 1256h
num2_H dw 0220h

       org 3000h; subrutina
SUM32: ADD AH,BH
       ADD AL,BL
       JC  CARRY
       ADD AH,AL
       JMP FIN
CARRY: ADC AH,AL
FIN:   RET
       
       org 2000h; prog. principal
       MOV AL, num1_L
       MOV AH, num1_H
       MOV BL, num2_L
       MOV BH, num2_H
       CALL SUM32
       HLT
       END
