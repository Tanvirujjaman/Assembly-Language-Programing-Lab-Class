include emu8086.inc
org 100h

.data
str1 db 10,13,"Enter a lowercase alphabet: $" 
str2 db 10,13,"Changed alphabet to uppercase: $"
.code
mov ax,@data
mov ds,ax

lea dx,str1
mov ah,09h
int 21h

mov ah,01h
int 21h
mov bl,al

mov dx,offset str2
mov ah,09h
int 21h

sub bl,32
mov dl,bl
mov ah,02h
int 21h


ret