include emu8086.inc
org 100h

.data
number db ?
res db ?
rem db ?

.code
mov ax,@data
mov ds,ax

mov ah,00
mov bl,10
mov number,0
input:
mov ah,01h
int 21h
cmp al,13         ; compare to find if it's enter which ASCII value is 13
je output         ; je = jump if equal   If it's enter than show the output
sub al,48         ; converting from ASCII
mov cl,al         ; store number in cl
mov al,number     ; assign number value in al
mul bl            ; multiply al with bl(10)
add al,cl         ; add stored number cl with al
mov number,al     ; store al in number variable
jmp input         ; looping input until enter is pressed

output:
printn
printn
mov al,number
cmp al,255        ; checking number with specific number
je ok             ; je = jump if equal   if matched jump to ok label
jne nok           ; jne = jump if not equal    if not matched jump to nok label

ok:
printn "Ok"
jmp stp

nok:
printn "Not Ok"

stp:
ret