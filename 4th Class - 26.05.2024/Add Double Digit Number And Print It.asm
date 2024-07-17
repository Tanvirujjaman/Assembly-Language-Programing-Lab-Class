include emu8086.inc
org 100h

.data
res db ?
rem db ?

.code
mov ax,@data
mov ds,ax
mov bl,10
mov ah,00    ; ah = 0

mov ah,01h   ; single input
int 21h
sub al,48    ; sub 48 to convert from ASCII
mul bl       ; multiply with 10 to get double digit number
mov cl,al    ; storing number in cl

mov ah,01h
int 21h
sub al,48    ; sub 48 to convert from ASCII
add al,cl    ; adding 2nd input with previous number
mov cl,al    ; storing number in cl
 
mov ax,cx    
div bl       ; divied by 10 to result and reminder
mov res,al   ; result is the 2nd digit number
mov rem,ah   ; reminder is the 1st digit number

printn
printn
mov dl,res
add dl,48
mov ah,02h
int 21h

mov dl,rem
add dl,48
mov ah,02h
int 21h


ret