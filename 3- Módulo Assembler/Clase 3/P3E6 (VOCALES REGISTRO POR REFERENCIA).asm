        ORG 1000h
vocales db "aeiouAEIOU"
letra   db "hola"
fin     db ?

         ORG 3000h
ES_VOCAL:CMP CH,[BX]
         JZ  SUMAR
         INC BX
         DEC AH
         JNZ ES_VOCAL
         JMP FIN
SUMAR:   INC CL
FIN:     RET

VOCALES: MOV  AH, OFFSET letra - OFFSET vocales; DIML DE VOCALES
         MOV  BX, OFFSET vocales
         PUSH BX
         MOV  BX,DX
         MOV  CH,[BX]
         POP  BX
         INC  DX
         CALL ES_VOCAL
         DEC  AL
         JNZ  VOCALES
         RET
         
         ORG 2000h
         MOV  DX, OFFSET letra
         MOV  AL, OFFSET fin- OFFSET letra; DIML DE LETRA
         MOV  CL, 0
         CALL VOCALES
         HLT
         END
