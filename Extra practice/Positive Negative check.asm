include emu8086.inc
org 100h

.data

.code
mov ax,@data
mov ds,ax

mov al,-0

cmp al,0
jl Negative

print "Given number is a positive number." 
jmp stp

Negative:
print "Given number is a negative number." 

stp:

ret