; adds 2 single-digit numbers entered and display the result
    .model small
    .stack 100h
    .code
start:  mov ax,DGROUP
        mov ds,ax

        mov dx, offset message0
        mov ah,9
        int 21h
        call newline
        mov dx, offset message1
        mov ah,9
        int 21h

        mov dx, offset buffer1
        mov ah,0Ah
        int 21h
        call newline
        
        mov dx, offset message2
        mov ah,9
        int 21h

        mov dx, offset buffer2
        mov ah,0Ah
        int 21h
        call newline

        mov si, offset buffer1 + 2
        mov dl,[si]
        mov ah,2h
        int 21h
        mov dx, offset message3
        mov ah,9h
        int 21h
        mov bl,[si]
        mov si, offset buffer2 + 2
        mov dl,[si]
        mov ah,2h
        int 21h
        mov cl,[si]
        mov dx, offset message4
        mov ah,9h
        int 21h

        sub bl,30h
        sub cl,30h
        add bl,cl

        mov bh,0
        mov cx,1
        cmp bl,10
        jb single_digit

        mov al,bl
        mov ah,0
        mov bl,10
        div bl
        add al,30h
        add ah,30h     

        mov bl,00001011b
        mov temp_ah,ah
        mov ah,9
        int 10h

        mov ah,3
        int 10h
        inc dl
        mov ah,2
        int 10h 
        
        mov al,temp_ah
        mov ah,9
        mov cx,1
        int 10h
        jmp exit_prog

single_digit:
        add bl,30h
        mov al,bl
        mov bl,00001011b
        mov ah,9
        int 10h
exit_prog:   
        mov ax,4C00h
        int 21h

newline proc 
    mov dx,offset crlf
    mov ah,9
    int 21h
    ret
newline endp

    .data
message0 db "Hello! This programm adds 2 single-digit numbers entered and display the result$"
message1 db "Write first term: $"
message2 db "Wtite second term: $"
message3 db " + $"
message4 db " = $"

buffer1 DB 3, ?, 3 DUP('$')
buffer2 DB 3, ?, 3 DUP('$')
crlf db 0Dh,0Ah,'$'
temp_ah db ?

    end start


