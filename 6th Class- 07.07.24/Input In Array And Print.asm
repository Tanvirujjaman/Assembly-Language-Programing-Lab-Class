include emu8086.inc
org 100h

.data
arr1 db 5,8,1,0,3     ; array with integer value
arr2 db 'd','g','a','p','y'    ; array with character value
arr3 db 20 dup(?)     ; 20 size array with no value
var1 db ?

.code
mov ax,@data
mov ds,ax

lea si,arr3           ; lea = load effective address  load array index in si
mov si,0              ; start index from 0 so si = 0

for1:                 ; label for loop input
mov ah,01h
int 21h
cmp al,13             ; compare to find if it's enter which ASCII value is 13
je output             ; je = jump if equal   If it's enter than show the output
sub al,48             ; converting from ASCII
mov arr3[si],al       ; store value in array from input al in index number si
inc si                ; increment si to increment index number
jmp for1              ; jmp = jump   jump in loop continue until enter is pressed


printn

output:
                      
mov cx,si             ; store si to cx because of input index size
lea si,arr3           ; lea = load effective address  load array index in si
mov si,0              ; start index from 0 so si = 0
for2:
mov dl,arr3[si]       ; transfer array value with index in data register
add dl,48             ; converting from ASCII   for print add 48
mov ah,02h
int 21h
print " "
inc si                ; increment si to increment index number
cmp si,cx             ; compare with cx because array size store in cx register
jl for2               ; jl = jump if less than jump until all array index ar visited

ret