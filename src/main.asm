org 0x100

%include "include/constants.inc"
%include "include/macros.inc"

start:
    ; set VGA 13h
    mov ax, 0x0013
    int 0x10

    ; point ES to video memory
    mov ax, VIDEO_SEGMENT
    mov es, ax

    ; test pixel: (100,50), red
    PLOT_PIXEL 100, 50, 12

    ; wait for key
    mov ah, 0
    int 0x16

    ; restore text mode
    mov ax, 0x0003
    int 0x10
    ret
