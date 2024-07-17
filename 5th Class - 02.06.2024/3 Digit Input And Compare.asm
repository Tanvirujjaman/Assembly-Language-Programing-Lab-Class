include emu8086.inc
org 100h

.data
number db ?

.code
mov ax,@data
mov ds,ax
mov ah,00
mov bl,10
mov number,0
mov cl,0

input:
mov ah,01h
int 21h
cmp al,13      ; compare to find if it's enter which ASCII value is 13
je output      ; je = jump if equal   If it's enter than show the output
sub al,48      ; converting from ASCII 
mov cl,al
mov al,number
mul bl
add al,cl
mov  number,al
jmp input      ; looping input until enter is pressed 

output:
cmp number,255  ; comparing the number with 255 which is the max value of this code for 8bit register
je ok          ; je = jump if equal
jne nok        ; jne = jump if not equal

ok:
printn
printn "Number matched."
jmp stp

nok:
printn
printn "Number not matched!"

stp:

ret