.model small
.stack 100h
.data

msg1 db "Enter the first number: $"
msg2 db "Enter the second number: $"

msg3 db "The Addition is :$"
msg4 db "The Subtraction is : $"
msg5 db "The Multiplication is :$"

msg6 db "The division quotient is : $"
msg7 db "The division reminder is : $"

n1 db 0
n2 db 0

n3 db ?

.code
start:

mov ax, @data
mov ds, ax

;msg1
mov dx, offset msg1
mov ah, 09h
int 21h

;num1
mov ah, 01h 
int 21h
mov dl, al
sub dl, 48
mov n1, dl
mov dl, 10
mov ah, 02h
int 21h

;msg2
mov dx, offset msg2
mov ah, 09h
int 21h

;num2
mov ah, 01h
int 21h
mov dl, al
sub dl, 48
mov n2, dl
mov dl, 10
mov ah, 02h
int 21h

;msg3 Addition
mov dx, offset msg3
mov ah, 09h
int 21h

mov dl, n1
add dl, n2
add dl, 48
mov ah, 02h
int 21h
mov dl, 10
mov ah, 02h
int 21h

;msg4 Subtraction
mov dx, offset msg4
mov ah, 09h
int 21h
mov dl,n1
sub dl,n2
add dl,48 
mov ah,02h
int 21h
mov dl, 10
mov ah, 02h
int 21h

;msg5 Multiplication
mov dx, offset msg5
mov ah, 09h
int 21h
mov al, n1
mul n2
mov dl, al
add dl, 48
mov ah, 02h
int 21h
mov dl, 10
mov ah, 02h
int 21h

;msg6 division
mov dx, offset msg6
mov ah, 09h
int 21h

mov ah, 00
mov al, n1
div n2
mov n3, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h
mov dl,10
mov ah, 02h
int 21h

;Reminder
mov dx, offset msg7
mov ah, 09h
int 21h
mov dl, n3
add dl, 48
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start

