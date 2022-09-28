[org 0x7c00]

mov ax, 3
int 0x10

; 初始化寄存器
mov ax, 0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov si, bootMsg
call print

; 阻塞
jmp $

print:
 mov ah, 0x0e 
.next:
  mov al, [si]
  cmp al, 0
  jz .done
  int 0x10
  inc si
  jmp .next
.done:
  ret

bootMsg:
  db "Botting...", 10, 13 ; \n\r

; 填充
times 510 - ($ - $$) db 0

; 标志字
db 0x55, 0xaa
