include emu8086.inc
org 100h

.data
res db ?
rem db ?

.code
mov ax,@data
mov ds,ax
mov bl,2

mov ah,01h
int 21h
sub al,48

div bl        ; divied by to find the reminder 
mov res,al    ; result store in al
mov rem,ah    ; reminder store in ah


cmp rem,0     ; comparing reminder with 0 
je Even       ; je = jump if equal   if equal than it's a even number so jump to even label
printn
printn "Odd Number"
jmp stp

Even:
printn
printn "Even Number" 

stp:

ret