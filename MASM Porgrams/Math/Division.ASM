.386
.model flat, stdcall, c
.stack 4096

.data
a DWORD 4
b DWORD 3
result BYTE ?
check BYTE "true", 012
wrong BYTE "false", 012
why BYTE "its working" ,012 ;012 is new line character

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main

main proc
    mov eax, a
    mov ebx, b
    div ebx

    ;cmp eax, 1
    ;jne false
    ;push offset check
    ;call printf
    ;push 0
    ;ret
    ;false:
    ;    push offset wrong
    ;    call printf
    ;    push 0
    ;    ret

    push offset why
    call printf
    push 0
main endp
end