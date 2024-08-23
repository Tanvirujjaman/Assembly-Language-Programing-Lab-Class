include emu8086.inc
org 100h

.data

.code
mov ax,@data
mov ds,ax

print "Enter a stirng under 9 number: "

mov bx,0      
input:         
mov ah,01h    
int 21h       
cmp al,13       
je output      
inc bx        
jmp input      

output:       
printn
printn 
print "String length: "        
add bx, 48     
mov dx,bx      
mov ah,02h    
int 21h       

ret




