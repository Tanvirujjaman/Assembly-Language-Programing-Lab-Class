include emu8086.inc
org 100h

.data
arr1 db 5,8,1,0,3  ; array with integer value
arr2 db 'd','g','a','p','y'     ; array with character value
arr3 bd 20 dup(?)  ; 20 size array with no value

.code
mov ax,@data
mov ds,ax

lea si,arr1        ; lea si,arr2   lea = load effective address  load array index in si
mov si,0           ; start index from 0 so si = 0
for1:
mov dl,arr1[si]    ; mov dl,arr2[si]     transfer array value with index in data register
add dl,48          ; arr2 - add dl,48    converting from ASCII   for print add 48
mov ah,02h
int 21h
print " "
inc si             ; increment si to increment index number
cmp si,4           ; compare with 4 because array size 5 and index 4
jle for1           ; jle = jump less than or equal  jump in loop for array output

ret