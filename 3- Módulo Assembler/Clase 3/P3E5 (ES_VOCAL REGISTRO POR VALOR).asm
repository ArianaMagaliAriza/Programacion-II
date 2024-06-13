        ORG 1000h
vocales db "aeiouAEIOU"
letra   db "e"

         ORG 3000h
ES_VOCAL:CMP AL,[BX]
         JZ VOCAL
         INC BX
         DEC AH
         JNZ ES_VOCAL
NO:      MOV CL,00H
         JMP FIN
VOCAL:   MOV CL,0FFH
FIN:     RET

         ORG 2000h
         MOV  AL, letra
         MOV  BX, OFFSET vocales
         MOV  AH, OFFSET letra - OFFSET vocales; DIML DE VOCALES
         CALL ES_VOCAL
         HLT
         END
