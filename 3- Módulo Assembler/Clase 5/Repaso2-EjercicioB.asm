;Repaso2, EjercicioB;

ORG 1000h;Datos
tabla1 db 1,2,5,4,30
tabla2 db 1,7,5,9,7

ORG 3000h
SUBRUTINA: mov bx,cx; SUBRUTINA B(se repite 1 sola vez)
mov cx,10; Despejo cx para guardar el 10 del SUMAR10
jmp SUBR
ret
SUBR: mov dl,1;SUBRUTINA DE SUBRUTINA B(se repite varias veces)
cmp [bx],ax
jnz VOLVER
cmp cx,[bx]
jnz SUMAR10
inc ax
inc bx
cmp ax,5
jnz SUBR
SUMAR10: inc dh; Suma valores de la Tabla2 menores a 10
VOLVER: add dl,dl;SUBRUTINA A
add ax,1
cmp ax,[bx]
jnz VOLVER
mov [bx],dl

ORG 2000h; Programa Principal
mov ax, OFFSET tabla1
mov cx,OFFSET tabla2
call SUBRUTINA
hlt
end
