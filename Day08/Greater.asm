;01) Given three numbers, determine which one is the greatest and display the message.

.model small
.stack 100h

.data

heading db "Which is greatest? $"
	msg1 db "n1 is greatest",10,"$"
	msg2 db "n2 is greatest",10,"$"
	msg3 db "n3 is greatest",10,"$"
	n1 db 5
	n2 db 6
	n3 db 1

.code
start:

mov ax, @data
mov ds, ax

mov dx, offset heading
mov ah, 09h
int 21h

mov dl, 10
mov ah, 02h
int 21h

mov al, n1
cmp al, n2
jge Lb1yes
jl Lb1no

Lb1yes:
mov bl, n3
cmp al, bl
jge Print1
jl Print3

Lb1no:
mov dx, offset msg2
mov ah, 09h
int 21h
jmp Endnn

Print1:
mov dx, offset msg1
mov ah, 09h
int 21h
jmp Endnn

Print3:
mov dx, offset msg3
mov ah, 09h
int 21h

Endnn:
mov ax, 4c00h
int 21h
end start