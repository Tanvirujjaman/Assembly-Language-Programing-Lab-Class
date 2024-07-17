include emu8086.inc    ; header file
org 100h

.data            ; data segment

.code            ; code segment 
mov ax,@data     ; copy content of data segment to code segment
mov ds,ax        ; make a copy of ax to ds

mov ax,30        ; ax = 30

cmp ax,0         ; compare ax with 0
jge label1       ; jge = jump if greater than or equal 

Negative:        ; label
print "Invaid Mark !"  ; print text
jmp stp          ; jmp = jump

label1:          ; label
cmp ax,100       ; compare ax with 100
jle label3       ; jle = jump if less than or equal

Grater_than_100: ; label
print "Invaid Mark !"  ; print text
jmp stp          ; jmp = jump

label3:          ; label
cmp ax,40        ; compare ax with 40
jge label4       ; jge = jump if greater than or equal

label2:          ; label
print "Fail"     ; print text
jmp stp          ; jmp = jump

label4:          ; label
print "Pass"     ; print text


stp:             ; label

ret              ; end program




