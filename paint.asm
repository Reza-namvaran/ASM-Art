org 0x100   ; COM program entry

start:
     ; Set VGA mode 13h

     mov ax, 0x0013
     int 0x10
     
     ; ES = 0xA000 (video memory)

     mov ax, 0xA000
     mov es, ax

     ; Plot a single pixel at (100, 50) with color 12
     mov di, 50  ; y
     mov bx, 320 ; screen width
     mul bx      ; offset = y * 320
     add di, 100 ; offset += x
     mov al, 12  ; color
     stosb       ; ES:[DI] = AL
     
     ; Wait for key press
     mov ah, 0
     int 0x16

     ; Restore text mode
     mov ax, 0x0003
     int 0x10
     ret
