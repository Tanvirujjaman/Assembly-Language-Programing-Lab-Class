include emu8086.inc
org 100h

.data
res db ?
rem db ?

.code
mov ax,@data
mov ds,ax
mov bl,10

mov ah,01h     ; taking input of 2nd digit number
int 21h
sub al,48      ; convert from ASCII
mul bl         ; multiply with 10
mov cl,al      ; store it in cl

mov ah,01h     ; talking input of 1st digit number
int 21h
sub al,48      ; convert from ASCII
add al,cl      ; adding with previous number cl 

mov bl,2       ; set bl = 2
div bl         ; divied the number with 2 to find reminder
mov res,al     ; result store in al
mov rem,ah     ; reminder store in ah


cmp rem,0      ; if there is no reminder means vlaue is 0 than it's a even number  
je Even        ; je = jump if equal  if reminder is 0 than jump to even label
printn
printn "Odd Number"
jmp stp

Even:
printn
printn "Even Number" 

stp:

ret