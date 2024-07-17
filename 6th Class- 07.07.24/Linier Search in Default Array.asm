include emu8086.inc
org 100h

.data
arr1 db 5,8,1,0,3     ; array with integer value
var1 db ?

.code
mov ax,@data
mov ds,ax

mov ah,01h            ; single input to which number we want to find
int 21h
sub al,48             ; converting from ASCII
mov var1,al           ; store the number in var1

lea si,arr1           ; lea = load effective address  load array index in si
mov si,0              ; start index from 0 so si = 0
for2:
mov dl,arr1[si]       ; transfer array value with index in data register
cmp dl,var1           ; cmp = compare   compare with the number we want to find
je found              ; je = jump if equal   if equal than number is found  print found
inc si                ; increment si to increment index number
cmp si,4              ; compare with 4 because array size 5 and index 4
jle for2              ; jle = jump less than or equal  jump in loop for find the number in array

printn
printn "Not Found !"
jmp stp
 
found:
printn
printn "Found."

stp:

ret