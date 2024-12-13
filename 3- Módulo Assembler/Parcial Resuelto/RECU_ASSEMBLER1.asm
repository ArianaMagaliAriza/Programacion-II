//Recuperatorio Assembler 1//

      org 1000h
cadena db "e4stE&3s.el.r3çup3R@t0r1o!"
res db 0

     org 3000h
MAYUS:PUSH AX
      PUSH BX
      MOV BX,SP
      ADD BX,6
      MOV BX,[BX]
      MOV AX,[BX]
      CMP AL,61H
      JNS COND
      JMP FIN2
COND: CMP AL,74H
      JS  CAMBIO
      CMP AL,74H
      JZ  CAMBIO
      JMP FIN2
CAMBIO: SUB AL,20H
       MOV [BX],AL
       JMP FIN2
FIN2:  POP BX
       POP AX
       RET
        

      org 2000h
      MOV AX, OFFSET cadena
      MOV CH, OFFSET res - OFFSET cadena
      MOV CL, 0
     
BUCLE: PUSH AX
       CALL MAYUS
       POP AX
       PUSH BX
       MOV BX,AX
       MOV BX,[BX]
       CMP BL,45H
       JZ  SUMA
       JMP SIGO
SUMA:  INC CL
SIGO:  POP BX
       DEC CH
       JZ FIN
       INC AX
       JMP BUCLE
FIN:   MOV BX, OFFSET res
       MOV [BX],CL
       HLT
       END
