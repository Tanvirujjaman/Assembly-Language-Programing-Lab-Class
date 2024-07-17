include emu8086.inc
org 100h

.data
arr1 db 5,8,1,0,3       ; array with integer value
arr2 db 'd','g','a','p','y'    ; array with character value
arr3 db 20 dup(?)       ; 20 size array with no value
var1 db ?

.code
mov ax,@data
mov ds,ax

lea si,arr3             ; lea = load effective address  load array index in si
mov si,0                ; start index from 0 so si = 0

for1:
mov ah,01h
int 21h
cmp al,13               ; compare to find if it's enter which ASCII value is 13
je next                 ; je = jump if equal   If it's enter than move on to the next label
sub al,48               ; converting from ASCII
mov arr3[si],al         ; store value in array from input al in index number si
inc si                  ; increment si to increment index number
jmp for1                ; jmp = jump   jump in loop continue until enter is pressed

next:  
printn
mov ah,01h              ; single input to which number we want to find 
int 21h
cmp al,13               ; compare to find if it's enter which ASCII value is 13
je invalid              ; je = jump if equal If it's enter than we can't find number so it's invalid
sub al,48               ; converting from ASCII
mov var1,al             ; store the number from al to var1
printn

mov cx,si               ; store si to cx because of input index size
lea si,arr3             ; lea = load effective address  load array index in si
mov si,0                ; start index from 0 so si = 0
for2:
mov dl,arr3[si]         ; transfer array value with index in data register
;add dl,48
;mov ah,02h
;int 21h
;print " "
cmp dl,var1             ; cmp = compare   compare with the number we want to find
je found                ; je = jump if equal   if equal than number is found  print found
inc si                  ; increment si to increment index number
cmp si,cx               ; compare with cx because array size cx
jl for2                 ; jl = jump less than  jump in loop for find the number in array

not_found:
print
printn "Not Found"
jmp stp

invalid:
print
printn "invaid input"
jmp stp

found:
print
printn "Found"

stp:

ret