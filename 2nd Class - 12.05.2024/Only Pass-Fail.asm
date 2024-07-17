include emu8086.inc    ; header file
org 100h

.data                  ; data segment 

.code                  ; code segment 
mov ax,@data           ; copy content of data segment to code segment
mov ds,ax              ; make a copy of ax to ds

mov ax, 40     ; ax = 40
mov bx,40      ; bx = 40

cmp ax,bx      ; cmp = compare 
jge label1     ; jge = jump if greater than or equal
jl label2      ; jl = jump if less than

label1:        ; label 
print "Pass"   ; print text
jmp stp        ; jmp = jump

label2:        ; label
print "Fail"   ; print text
jmp stp        ; jmp = jump


stp:           ; label

ret            ; end program




