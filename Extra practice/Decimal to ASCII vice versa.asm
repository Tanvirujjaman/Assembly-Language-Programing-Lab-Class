include emu8086.inc
org 100h

.data

.code
mov ax,@data
mov ds,ax

mov ah,01h
int 21h
sub al,48
printn
mov dl,al
add dl,48
mov ah,02h
int 21h

ret