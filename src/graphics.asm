%include "../include/constants.inc"

plot_pixel:
    ; expects x in BX, y in CX, color in AL
    push ax
    push bx
    push cx
    push dx
    mov ax, cx
    mov dx, SCREEN_WIDTH
    mul dx          ; ax = y * 320
    add ax, bx      ; ax += x
    mov di, ax
    stosb
    pop dx
    pop cx
    pop bx
    pop ax
    ret
