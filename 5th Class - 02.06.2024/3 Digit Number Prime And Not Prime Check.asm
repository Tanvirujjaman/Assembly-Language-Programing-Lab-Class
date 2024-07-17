include emu8086.inc
org 100h

.data
number dw ?       ; number variable assigned with dw 16bit
.code
mov ax,@data
mov ds,ax

mov bl,10
mov ah,00
mov number,0

input:
mov ah,01h
int 21h
cmp al,13         ; compare to find if it's enter which ASCII value is 13
je output         ; je = jump if equal   If it's enter than show the output
sub al,48         ; converting from ASCII
mov cl,al         ; store number in cl
mov ax,number     ; assign number value in al
mul bl            ; multiply al with bl(10)
add al,cl         ; add stored number cl with al
mov number,ax     ; store al in number variable
jmp input

output:
mov ax,00         ; ax = 00
mov ah,00         ; ah = 00
mov bl,2          ; bl = 2
prime_check:
mov ax,number     ; assign number value in ax
div bl            ; divied by bl and increment it to find prime number
cmp ah,0          ; checking reminder  if there reminder = 0 than number in not prime
je not_prime      ; je = jump if equal   if equal than number is not prime so print it
inc bl            ; increment bl to find prime number 
cmp bx,number     ; compare bl with number to track the loop count
jl prime_check    ; jl = jump if less than   return to prime check

prime:
printn
printn "Prime"
jmp stp

not_prime:
printn
printn "Not Prime"

stp:

ret