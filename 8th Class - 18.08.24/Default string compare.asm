include emu8086.inc
org 100h

.data
var1 db "CSE123$"
var2 db "CSE123$"
.code
mov ax,@data
mov ds,ax

lea si,var1
lea di,var2
mov cx,6

repe cmpsb ; repe =  repeat if equal  cmpsb = compare string byte
je match

n_match:
print "String are not same"
jmp stp

match:
print "Stirng matched"

stp:
ret