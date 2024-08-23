include emu8086.inc
org 100h

.data

.code
mov ax,@data
mov ds,ax
mov ax,00

print "Enter any string: "
mov cx,0       ; counter for stack
for1:          ; loop input by creating label
mov ah,01h
int 21h
cmp al,13
je output
mov bl,al
push bx
inc cx
jmp for1

output:
printn
print "Reversed string is: " 
                ;cx value already initialize from up
for2:
pop dx          ; directly poping in dx register 
mov ah,02h
int 21h
loop for2       ; default loop   this loop will work until 0


stp:

ret