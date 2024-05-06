
org 1000h
num1_L dw 4822h
num1_H dw 0010h
num2_L dw 1256h
num2_H dw 0220h
org 3000h;subrutina
SUM32: MOV BX, AX
 	      ADD DX, [BX]
 	      MOV BX, CX
 	      ADD DX, [BX]
        RET
org 2000h;prog principal
mov AX,OFFSET num1_L
mov CX,OFFSET num2_L
call SUM32
mov AX,OFFSET num1_H
mov CX,OFFSET num2_H
call SUM32
hlt
end
