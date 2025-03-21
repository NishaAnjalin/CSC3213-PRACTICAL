.model small
.stack 100h
.data

msg1 db "Number01: $"
msg2 db "Number02: $"
msg3 db "Addition of num1 and num2: $"

n1 db 2
n2 db 3

.code
start:

mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov dl, n1
add dl, 48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg2
mov ah, 09h
int 21h

mov dl, n2
add dl, 48
mov ah, 02h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg3
mov ah, 09h
int 21h

mov dl, n1
add dl, n2
add dl, 48
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start