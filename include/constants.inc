; Screen
SCREEN_WIDTH equ 320
SCREEN_HEIGHT equ 200
VIDEO_SEGMENT equ 0xA000

; Colors
COLOR_BLACK equ 0
COLOR_WHITE equ 15
COLOR_RED equ 12

; Keyboard scan codes (from BIOS int 16h)
KEY_UP          equ 0x48
KEY_DOWN        equ 0x50
KEY_LEFT        equ 0x4B
KEY_RIGHT       equ 0x4D
KEY_ESC         equ 0x01