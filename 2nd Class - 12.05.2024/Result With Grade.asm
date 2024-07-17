include emu8086.inc
org 100h

.data

.code
mov ax,@data
mov ds,ax

mov ax,39

cmp ax,0
jl invalid

cmp ax,100
jg invalid
jle grade

invalid:
print "Invaild Marks!"
jmp stp

grade:
cmp ax,80
jge A_Plus
jl check_A

A_Plus:
print "You Got A+"
jmp stp

check_A:
cmp ax,75
jge A
jl check_A_Minus

A:
print "You Got A Grade"
jmp stp

check_A_Minus:
cmp ax,70
jge A_Minus
jl check_B_Plus

A_Minus:
print "You Got A-"
jmp stp

check_B_Plus:
cmp ax,65
jge B_Plus
jl check_B

B_Plus:
print "You Got B+"
jmp stp

check_B:
cmp ax,60
jge B
jl check_B_Minus

B:
print "You Got B Grade"
jmp stp

check_B_Minus:
cmp ax,55
jge B_Minus
jl check_C_Plus

B_Minus:
print "You Got B-"
jmp stp

check_C_Plus:
cmp ax,50
jge C_Plus
jl check_C

C_Plus:
print "You Got C+"
jmp stp

check_C:
cmp ax,45
jge C
jl check_D

C:
print "You Got C Grade"
jmp stp

check_D:
cmp ax,40
jge D

Fail:
print "You Failed in Exam."
jmp stp

D:
print "You Got D Grade"

stp:
ret