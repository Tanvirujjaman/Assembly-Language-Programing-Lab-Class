include emu8086.inc
org 100h

.data
var1 db ?
.code
mov ax,@data
mov ds,ax
mov ax,00

mov ah,01h
int 21h
mov bl,al
printn

mov ah,01h
int 21h
mov cl,al
printn
mov ax,00

mov ah,01h
int 21h
mov var1,al
printn

cmp al,bl
jg nxt

mov al,bl
cmp al,cl
jmp first

second:
printn
print "2nd number is the largest number."
jmp stp

nxt:
mov al,var1
cmp al,cl
jl second
printn
print "3rd number is the largest number."
jmp stp

first:
printn
print "1st number is the largest number."

stp:
ret