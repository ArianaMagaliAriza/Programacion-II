----INCISO A----

      ORG 2000h
      CMP AL,4
      JZ IF
IF:   MOV BL,1
      INC CL
      JMP FIN
ELSE: MOV BL,2
      DEC CL
FIN:  HLT
      END



----INCISO B----

      ORG 2000h
      MOV AL, 10
      MOV CL, 1
FOR:  ADD AL, AL
      INC CL
      CMP CL, 10
      JNZ FOR
      HLT
      END
