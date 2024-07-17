include emu8086.inc   ; header file
org 100h

.data                 ; data segment 

.code                 ; code segment 
mov ax,@data          ; copy content of data segment to code segment
mov ds,ax             ; make a copy of ax to ds

mov ax,40    ; ax = 40

cmp ax,0     ; compare ax with 0
jl invaid    ; jl = jump of less than
jge tes      ; jge = jump if greater than or equal

tes:         ; label
cmp ax,100   ; compare ax with 100
jg invaid    ; jg = jump if greater than
jle check    ; jle = jump if less than or equal

invaid:      ; label
print "Invaid Mark !" ; print text
jmp stp      ; jmp = jump

check:       ; label
cmp ax,40    ; compare ax with 40
jge pass     ; jge = jump if greater than or equal

fail:        ; label
print "Fail"          ; print text
jmp stp      ; jmp = jump 

pass:        ; label
print "Pass" ; print text

stp:         ; label

ret          ; end program