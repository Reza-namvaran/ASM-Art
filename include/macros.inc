%macro PLOT_PIXEL 3
    ; Usage: PLOT_PIXEL x, y, color
    push ax
    push bx
    push dx
    mov ax, %2            ; y
    mov bx, SCREEN_WIDTH 
    mul bx                ; ax = y * 320
    add ax, %1            ; ax += x
    mov di, ax
    mov al, %3            ; color
    stosb                 ; ES:[DI] = color
    pop dx
    pop bx
    pop ax
%endmacro 