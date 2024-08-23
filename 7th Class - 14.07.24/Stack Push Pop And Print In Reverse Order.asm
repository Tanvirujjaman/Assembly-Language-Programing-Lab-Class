include emu8086.inc
org 100h

.data

.code
mov ax,@data
mov ds,ax
mov ax,00

;mov ax,3456h
;push ax
;mov ax,4567h
;push ax
;pop bx
;pop cx 

print "Enter any string: "
mov cx,0       ; counter for stack
for1:          ; loop input by creating label
mov ah,01h
int 21h
cmp al,13
je output
;cmp al,32     ; checking for white space ASCII code White Space = 32
;je skip
mov bl,al
push bx
inc cx
;skip:         ; skipping push operation for white space input
jmp for1

output:
printn
print "Reversed string is: " 
;cx value already initialize from up
for2:
;pop bx          ; popping from the last push in the stack
;mov dx,bx
pop dx          ; directly poping in dx register 
mov ah,02h
int 21h
;dec cx         ; for user defeine loop
;cmp cx,0
;jg for2
loop for2       ; default loop   this loop will work until 0


stp:

ret