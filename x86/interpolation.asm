%include        'seek.asm'

ZERO equ 0

global  _start
section .text
_start:
    ;2x2 matrix
    mov ebp,10; 0,0 value
    mov esi,20; 0,1 value
    mov edi,30; 1,0 value
    mov r8d,40; 1,1 value
    mov r13d,0x0; write pointer

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
    div ecx
    mov r15d,eax
    ret
    
_quit:
    ;exit the program
    mov	eax,1	; system call number (sys_exit)
    int	0x80	; call kernel

