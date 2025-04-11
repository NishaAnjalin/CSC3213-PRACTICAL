;Write an assembly language program to read a three-digit intger from user, and print the Number

.model small
.stack 100h
.data

msg db "Enter the number: $"

h db 0
t db 0
o db 0
h1 db 0
dig db 0
rh db 0
rt db 0

.code

start:

mov ax, @data
mov ds, ax

mov dx, offset msg
mov ah, 09h
int 21h

;read 1st digit
mov ah, 01h
int 21h

mov dl, al
sub dl, 48
mov h, dl

;read 2nd digit
mov ah, 01h
int 21h

mov dl, al
sub dl, 48
mov t, dl

;read 3rd digit
mov ah, 01h
int 21h

mov dl, al
sub dl, 48
mov o, dl

mov al, h
mov bl, 100
mul bl

mov h1, al

mov al, t
mov bl, 10
mul bl
mov dl, al
add dl, h1

add dl, o

mov dig, dl

mov dl, 10
mov ah, 02h
int 21h

mov ah, 00
mov al, dig
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
