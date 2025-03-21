.model small
.stack 100h
.data

n1 db 5
n2 db 2
n3 db ?

.code

start:

mov ax, @data
mov ds, ax

mov ah, 00

mov al, n1
div n2

mov n3, ah

mov dl, al
add dl, 48

mov ah, 02h
int 21h

mov dl, n3
add dl, 48

mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start