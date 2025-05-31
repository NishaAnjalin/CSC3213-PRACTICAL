;print even numbers from 2 to 9
.model small
.stack 100h
.data
msg db "Even number between 2 to 9 :- $"
.code
start:

mov ax, @data
mov ds, ax
mov dx, offset msg
mov ah, 09h
int 21h

mov bl, 2        ; Start from 2
print_loop:
    cmp bl, 10    ; Stop at 10 (since 9 is the last number to check)
    jge end_loop

    mov al, bl
    mov ah, 0
    mov dl, 2
    div dl        ; AL / 2 → quotient in AL, remainder in AH

    cmp ah, 0     ; Is remainder 0? (even number)
    jne skip_print

    mov dl, bl
    add dl, 48    ; Convert to ASCII
    mov ah, 02h
    int 21h

    mov dl, 32    ; Print space
    mov ah, 02h
    int 21h

skip_print:
    inc bl
    jmp print_loop

end_loop:
mov ax, 4c00h
int 21h
end start

