.model small
.stack 100h
.data

msg db "Enter two digit number: $"

t db 0
o db 0
dig db 0
r db 0

.code

start:

mov ax, @data
mov ds, ax

mov dx, offset msg
mov ah, 09h
int 21h

mov ah, 01h
int 21h
sub al, 48
mov t, al ;t=2

mov ah, 01h
int 21h
sub al, 48
mov o, al ;o=3

mov bl, 10
mov al, t
mul bl

mov dl, al
add dl, o ; dl=23

mov dig, dl

mov dl, 10
mov ah, 02h
int 21h

mov ah, 00 ; ah=0
mov bl, 10 ;bl=10
mov al, dig ; al=23
div bl ;al=2

mov r, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov dl, r
add dl,48
mov ah, 02h
int 21h

mov ax, 4c00h
int 21h
end start
