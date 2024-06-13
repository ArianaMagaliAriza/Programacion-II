      ORG 1000H
tabla db 1, 2, 3, 4, 5, 6, 7, 8
res   db ?
      ORG 2000H
      MOV BX, OFFSET tabla
      MOV AH,OFFSET res - OFFSET tabla
THEN: ADD AL, [BX]
      INC BX
      DEC AH
      CMP AH,0
      JNZ THEN
      MOV res, AL
      HLT
      END
