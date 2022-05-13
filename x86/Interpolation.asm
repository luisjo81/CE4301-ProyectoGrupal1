%include        'seek.asm'
%include        'read.asm'

ZERO equ 0

global  _start
section .text
_start:
    ;2x2 matrix
    mov ebp,10; 0,0 value
    mov esi,20; 0,1 value
    mov edi,30; 1,0 value
    mov r8d,40; 1,1 value

;horizontal and vertical values
_ptA:
    mov r9d,ebp
    mov r10d,esi
    call _calcPt

_ptB:
    mov r9d,esi
    mov r10d,ebp
    call _calcPt

_ptC: ;C and F need to be grouped together to get D and E values
    mov r9d,ebp
    mov r10d,edi
    call _calcPt
    mov r11d,r15d

_ptF:
    mov r9d,esi
    mov r10d,r8d
    call _calcPt
    mov r12d,r15d
    jmp _ptD

_ptG: ;G and J need to be grouped together to get H and I values
    mov r9d,edi
    mov r10d,ebp
    call _calcPt
    mov r11d,r15d

_ptJ:
    mov r9d,r8d
    mov r10d,esi
    call _calcPt
    mov r12d,r15d
    jmp _ptH

_ptK:
    mov r9d,edi
    mov r10d,r8d
    call _calcPt

_ptL:
    mov r9d,r8d
    mov r10d,edi
    call _calcPt
    jmp _quit

;Intermediate points
_ptD:
    mov r9d,r11d
    mov r10d,r12d
    call _calcPt
    jmp _ptE

_ptE:
    mov r9d,r12d
    mov r10d,r11d
    call _calcPt
    jmp _ptG

_ptH:
    mov r9d,r11d
    mov r10d,r12d
    call _calcPt
    jmp _ptI

_ptI:
    mov r9d,r12d
    mov r10d,r11d
    call _calcPt
    jmp _ptK
    

;Calc value function
_calcPt:
    xor eax, eax
    xor edx,edx
    xor r15d,r15d
    imul r9d,2
    mov eax,r10d
    add eax,r9d
    mov ecx,3
    mov r14,0
    call _div
    mov r15d,r14d
    ;div ecx
    ;mov r15d,eax
    ; aqui se deberia tener un puntero al cual escribir
    ;aqui se escribiria el punto en el archivo
    ret

;Division using recursive substraction
_div:
    cmp eax,ZERO
    jg _divAux
    sub r14d, 1
    ret

_divAux:
    sub eax,ecx
    inc r14d
    jmp _div

_quit:
    ;exit the program
    mov	eax,1	; system call number (sys_exit)
    int	0x80	; call kernel

