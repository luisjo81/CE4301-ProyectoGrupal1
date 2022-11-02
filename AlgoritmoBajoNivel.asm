%include "io64.inc"

ZERO equ 0

section .text
global  CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;6 element vector
    mov ebp, 10; R value 1
    mov esi, 20; R value 2
    mov edi, 15; B value 1
    mov r8d, 25; B value 2
    mov r9d, 30; G value 1
    mov r10d, 40; G value 2
    mov ecx, 10; Counter
    mov r13d, 1; Constante
    mov r14d, 1; Degradado

_degradadoRojo:
    xor r11d, r11d
    xor r12d, r12d
    ;Cycle started
    mov r11d, ebp
    mov r12d, esi
    dec ebp
    dec esi
    dec ecx
    cmp ecx, ZERO
    jne _degradadoRojo
    call _contador
  
_degradadoAzul:
    xor r11d, r11d
    xor r12d, r12d
    ;Cycle started
    mov r11d, edi
    mov r12d, r8d
    dec edi
    dec r8d
    dec ecx
    cmp ecx, ZERO
    jne _degradadoAzul
    call _contador
  
_degradadoVerde:
    xor r11d, r11d
    xor r12d, r12d
    ;Cycle started
    mov r11d, r9d
    mov r12d, r10d
    dec r9d
    dec r10d
    dec ecx
    cmp ecx, ZERO
    jne _degradadoVerde
    call _contador
  
_composicionAlfaRojo:
    sub r13d, r14d
    imul ebp, r13d
    imul esi, r14d
    add ebp, esi
    call _recomposicion
    
_composicionAlfaAzul:
    sub r13d, r14d
    imul edi, r13d
    imul r8d, r14d
    add edi, r8d
    call _recomposicion
    
_composicionAlfaVerde:
    sub r13d, r14d
    imul r9d, r13d
    imul r10d, r14d
    add r9d, r10d
    call _recomposicion

_recomposicion:
    mov r13d, 1
    mov r14d, 1
    ret

_contador:
    mov ecx, 10
    mov eax, r11d
    mov ebx, r12d
    ret

_quit:
    ;exit the program
    mov	eax,1	; system call number (sys_exit)
    int	0x80	; call kernel  
