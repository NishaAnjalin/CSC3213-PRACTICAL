;print even numbers from 2 to 9
.model small
.stack 100h
.data

msg db "Even number between 2 to 9 :- $   "

.code
start:

mov ax, @data
mov ds, ax

mov dx, offset msg
mov ah, 09h
int 21h

mov cl, 8
mov bl, 2     

next_num:
mov al, bl
mov ah, 00
mov dl, 2
div dl
cmp ah, 0
jnz not_even

mov al, bl
add al, 48
mov dl, al
mov ah, 02h
int 21h

not_even:
inc bl
loop next_num 

Endnn:
mov ax, 4c00h
int 21h
end start

