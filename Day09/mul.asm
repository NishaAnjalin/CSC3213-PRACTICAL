;Use a loop to display multiplication of numbers from 1 to 5 

.model small
.stack 100h
.data

n db 5
mu db 1
rt db 0
rh db 0

msg db "multiplication of 1 to 5:  $"
.code

start:
mov ax, @data
mov ds, ax

mov cl, n

lstart:
mov al, mu
mul cl
mov mu, al

loop lstart

mov dx, offset msg
mov ah, 09h
int 21h

mov ah, 00
mov al, mu
mov bl, 100
div bl

mov rh, ah

mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov ah, 00
mov al, rh
mov bl, 10
div bl

mov rt, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov dl, rt
add dl, 48
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start