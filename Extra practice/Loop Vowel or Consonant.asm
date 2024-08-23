include emu8086.inc
org 100h

.data
str db 10,13,"Enter a alphabet: $"

.code
mov ax,@data
mov ds,ax
mov ax,00

mov cx,5
loop_check:
lea dx,str
mov ah,09h
int 21h

mov ah,01h
int 21h
printn

cmp al,'a'
je V
cmp al,'A'
je V

cmp al,'e'
je V
cmp al,'E'
je V

cmp al,'i'
je V
cmp al,'I'
je V

cmp al,'o'
je V
cmp al,'O'
je V

cmp al,'u'
je V
cmp al,'U'
je V

C:
print "The alphabet is Consonant" 
jmp stp

V:
print "The alphabet is Vowel"

stp:
printn
loop loop_check

ret