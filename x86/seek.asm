section .data
filename db 'output.txt',0h  ; the filename to create
contents  db '123',   ; the contents to write at the start of the file

section .text

_seek:
 
    mov     ecx, 1              ; flag for writeonly access mode (O_WRONLY)
    mov     ebx, filename       ; filename of the file to open
    mov     eax, 5              ; invoke SYS_OPEN (kernel opcode 5)
    int     80h                 ; call the kernel
    

    mov     edx, 1             ; whence argument (SEEK_END)
    mov     ecx, r13d           ; move the cursor 0 bytes
    mov     ebx, eax            ; move the opened file descriptor into EBX
    mov     eax, 19             ; invoke SYS_LSEEK (kernel opcode 19)
    int     80h                 ; call the kernel
 
    mov     edx,  3           ; number of bytes to write - one for each letter of our contents string
    mov     ecx, contents       ; move the memory address of our contents string into ecx
    mov     ebx, ebx            ; move the opened file descriptor into EBX (not required as EBX already has the FD)
    mov     eax, 4              ; invoke SYS_WRITE (kernel opcode 4)
    int     80h                 ; call the kernel

    ; close the file
    mov eax, 6
    mov ebx, 1
    int     80h
    
    ret