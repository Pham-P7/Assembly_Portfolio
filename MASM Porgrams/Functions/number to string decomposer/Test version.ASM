INCLUDELIB C:\masm32\lib\masm32.lib
;INCLUDE C:\masm32\include\masm32rt.inc

.DATA
    decimalstr db 16 DUP (0)
    myvar db 52

.CODE

start PROC

    movzx eax, myvar         ; Load an 8-bit-byte into a 32-bit-register
    lea edi, decimalstr      ; Load the address of decimalstr
    call EAX_to_DEC
    invoke StdOut, addr decimalstr

    movzx eax, myvar
    printf ("\nAnd the lazy MASM32 way: %u\n",eax)

    invoke ExitProcess, 0
start ENDP

EAX_to_DEC PROC             ; ARG: EDI pointer to string buffer
    mov ebx, 10             ; Divisor = 10
    xor ecx, ecx            ; ECX=0 (digit counter)
  @@:                       ; First Loop: store the remainders
    xor edx, edx
    div ebx                 ; EDX:EAX / EBX = EAX remainder EDX
    push dx                 ; push the digit in DL (LIFO)
    add cl,1                ; = inc cl (digit counter)
    or  eax, eax            ; AX == 0?
    jnz @B                  ; no: once more (jump to the first @@ above)
  @@:                       ; Second loop: load the remainders in reversed order
    pop ax                  ; get back pushed digits
    or al, 00110000b        ; to ASCII
    stosb                   ; Store AL to [EDI] (EDI is a pointer to a buffer)
    loop @B                 ; until there are no digits left
    mov byte ptr [edi], 0   ; ASCIIZ terminator (0)
    ret                     ; RET: EDI pointer to ASCIIZ-string
EAX_to_DEC ENDP

END start