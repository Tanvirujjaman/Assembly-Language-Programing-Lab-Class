include emu8086.inc
org 100h

.data
username db "Tanvir$"
pass db "123$"
.code
mov ax,@data
mov ds,ax

print "Enter user name: "
lea si,username
mov si,0
input:
mov ah,01h
int 21h
cmp al,username[si]
jne missmatch_u
inc si
cmp si,6
jl input

printn
print "User name matched :)"
printn
printn
print "Enter password: "
lea si,pass
mov si,0
input1:
mov ah,01h
int 21h
cmp al,pass[si]
jne missmatch_p
inc si
cmp si,3
jl input1

printn
print "Congratulations password matched :)"
jmp stp

missmatch_u:
printn
print "User name is not matched! Please try again :|"
jmp stp

missmatch_p:
printn
print "Password is not matched! Please try again :|"


stp:
ret