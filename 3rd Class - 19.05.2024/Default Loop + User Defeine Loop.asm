include emu8086.inc 
org 100h

.data

.code
mov ax,@data
mov ds,ax

mov cx,5       ; default loop always cx with value because it's descending
printn "Default loop"
printn
default_loop:     ; label
printn "Sonargaon University"
Loop default_loop ; back to label

printn
printn
printn "User defeine loop"
printn
mov ax,1          ; can use any register
user_defeine_loop:   ; label
printn "Sonargaon University"
inc ax            ; inc = increment
cmp ax,5          ; cmp = compare with 5  loop will go 5 times
jle user_defeine_loop   ; jle = jump if less than or equal

printn
printn
printn "User defeine loop increase by 2"
printn
mov ax,2          ; loop initial with value
user_defeine_loop2:  ; label
printn "Sonargaon University"
add ax,2          ; incrementing by adding 2 with initial value
cmp ax,10         ; cmp = compare 
jle user_defeine_loop2  ; jle = jump if less than or equal

printn
printn
printn "User defeine loop decrease by 5"
printn
mov ax,25         ; loop initial with value
user_defeine_loop5:  ; label
printn "Sonargaon University"
sub ax,5          ; decrement by substracting 5 with initial value
cmp ax,0          ; cmp = compare with 0
jnz user_defeine_loop5  ; jnz = jump if not zero

ret