include emu8086.inc
org 100h

.data
count1 dw ?

.code
mov ax,@data
mov ds,ax

mov bx,0       ; counter initialize
input:         ; loop
mov ah,01h     ; single input
int 21h        ; int = interrupt
cmp al,13      ; 13 = Enter in ASCII code 
je output      ; If enter to to output  je = jump if  equal
inc bx         ; increment counter
jmp input      ; jmp = jump   jump back to the loop

output:        ; label
printn         ; printn = print new line
;mov count1,bx   store counter value to a variable  (not needed) 
add bx, 48     ; adding 48 to convert ASSCII to number
mov dx,bx      ; Transfering to data register for output bx - 16bit  dx - 16bit  16bit works with 16bit 
mov ah,02h     ; Single output
int 21h        ; interrupt

ret




