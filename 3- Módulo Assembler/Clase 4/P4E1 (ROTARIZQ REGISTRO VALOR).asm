org 1000h
num db 10101100b
pos db 4
org 3000h
rotarizq: mov ah, 0
mul: add al, al
;pushf 
adc al, 0
dec cl 
cmp cl, 0
jnz mul
ret
org 2000h
mov al, num
mov cl, pos
call rotarizq
hlt
end
