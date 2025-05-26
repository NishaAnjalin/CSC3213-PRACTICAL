;Given a mark from 0-100 , display a grade
;90-100->A
;75-89->B
;60-74->C
;50-59->D
;Below 50->Fail

.model small
.stack 100h

.data
    msgFail db "Fail $"
    msgA    db "A $"
    msgB    db "B $"
    msgC    db "C $"
    msgD    db "D $"

    mark db 95      ; Example mark (change this value to test)

.code

start:
    mov ax, @data
    mov ds, ax

    mov al, mark        ; load mark into AL for comparison

    cmp al, 90
    jge printA          ; if mark >= 90 jump to print A

    cmp al, 75
    jge printB          ; if mark >= 75 jump to print B

    cmp al, 60
    jge printC          ; if mark >= 60 jump to print C

    cmp al, 50
    jge printD          ; if mark >= 50 jump to print D

    ; if mark < 50
printFail:
    mov dx, offset msgFail
    mov ah, 09h
    int 21h
    jmp Endnn

printA:
    mov dx, offset msgA
    mov ah, 09h
    int 21h
    jmp Endnn

printB:
    mov dx, offset msgB
    mov ah, 09h
    int 21h
    jmp Endnn

printC:
    mov dx, offset msgC
    mov ah, 09h
    int 21h
    jmp Endnn

printD:
    mov dx, offset msgD
    mov ah, 09h
    int 21h


Endnn:
    mov ax, 4C00h
    int 21h
end start
