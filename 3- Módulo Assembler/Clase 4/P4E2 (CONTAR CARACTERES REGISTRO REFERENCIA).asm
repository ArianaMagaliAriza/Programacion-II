org 1000h
cadena db "hola%alo"
fin_ db ?
org 3000h
concar: mov ax, 25h
cond: inc cl
inc bx
;cmp dx, bx
;jz fin
cmp al, [bx]
jnz cond
fin:hlt
ret
org 2000h
mov bx, offset cadena
mov dx, offset fin_
call concar
end
