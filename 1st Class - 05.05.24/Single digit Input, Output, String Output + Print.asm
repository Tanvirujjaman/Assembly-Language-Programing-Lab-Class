include emu8086.inc      ; header file
org 100h

.data                    ; data segment 
var1 db ?                ; variable_name variable_byte/define-directive variable_value  ?-NULL
const equ 100            ; constant_name constant_tag(EQU/TEXTEQU) constant_value
string db "I am Tanvir$" ; stirng_name define-directive stirng_value "$"  $-string is ended
array db 1,2,3,4
array1 db 10 dup(?)      ; array_name define-directive array-size array_value to all index

.code                    ; code segment 
mov ax,@data             ; copy content of data segment to code segment
mov ds,ax                ; make a copy of ax to ds

lea dx,string ; lea = load effective address
mov ah,09h    ; print string
int 21h       ; int = interrupt
printn        ; print new line
print "I am tanvir"      ; print text

printn
printn

print "Enter a number: " ; print text
mov ah,01h    ; single input
int 21h       ; int = interrupt
printn        ; print new line
print "The number is: "  ; print text
mov dl,al     ; copy content of al to dl
mov ah,02h    ; single output
int 21h       ; int = interrupt
printn        ; print new line
 

ret           ; end program