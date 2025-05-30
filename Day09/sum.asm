;Use a loop to display sum of numbers from 1 to 5 

.model small
.stack 100h
.data

n db 5
sum db 0
r db 0

msg db "Sum of 1 to 5:  $"
.code

start:
mov ax, @data
mov ds, ax

mov cl, n

lstart:
mov dl, sum
add dl, cl
mov sum, dl

loop lstart

mov dx, offset msg
mov ah, 09h
int 21h

mov al, sum

mov ah, 00
mov bl, 10
div bl

mov r, ah
mov dl,al
add dl, 48

mov ah, 02h
int 21h

mov dl, r
add dl, 48
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start