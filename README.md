# ASM-Art
ASM Art is a minimalistic paint program written in x86 Assembly for DOS, demonstrating low-level graphics programming using VGA mode 13h (320×200, 256 colors). This project is intended as a learning tool for students and enthusiasts to explore pixel manipulation, BIOS interrupts, and real mode graphics programming.

## Usage
- Install NASM and dosbox
  
  Ubuntu/Debian:
  ```bash
  sudo apt install nasm dosbox
  ```
  Arch:
  ```bash
  sudo pacman -S nasm dosbox
  ```
- Assemble to a com file
  ```bash
  nasm -f bin src/main -o asm-art.com
  ```
- Start DOSBox, mount the folder with asm-art.com, then run asm-art.com
  ```bash
  dosbox asm-art.com
  ```
