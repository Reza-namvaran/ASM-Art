org 0x100

%include "include/constants.inc"
%include "include/macros.inc"

start:
    ; Set VGA 13h
    mov ax, 0x0013
    int 0x10

    ; Point ES to video memory
    mov ax, VIDEO_SEGMENT
    mov es, ax

    ; Set initial cursor position (center)
    mov cx, SCREEN_WIDTH/2
    mov dx, SCREEN_HEIGHT/2

    ; Start in move mode
    xor si, si          ; si = 0

main_loop:
    ; Wait for key press
    mov ah, 0
    int 0x16           ; AL = ASCII, AH = scan code

    cmp ah, KEY_UP
    je move_up
    cmp ah, KEY_DOWN
    je move_down
    cmp ah, KEY_LEFT
    je move_left
    cmp ah, KEY_RIGHT
    je move_right
    cmp ah, KEY_SPACE
    je toggle_mode
    cmp ah, KEY_ESC
    je quit

    jmp main_loop

move_up:
    cmp dx, 0
    jz main_loop
    dec dx
    jmp after_move

move_down:
    cmp dx, SCREEN_HEIGHT-1
    jz main_loop
    inc dx
    jmp after_move

move_left:
    cmp cx, 0
    jz main_loop
    dec cx
    jmp after_move

move_right:
    cmp cx, SCREEN_WIDTH-1
    jz main_loop
    inc cx
    jmp after_move

after_move:
    cmp si, 0
    je draw_cursor       ; if move mode, draw cursor
    jmp paint_mode       ; if paint mode, draw permanent pixel

toggle_mode:
    xor si, 1            ; flip 0 <--> 1
    jmp main_loop

draw_cursor:
    PLOT_PIXEL cx, dx, COLOR_WHITE
    jmp main_loop

paint_mode:
    PLOT_PIXEL cx, dx, COLOR_RED
    jmp main_loop

quit:
    ; Restore text mode
    mov ax, 0x0003
    int 0x10
    ret
