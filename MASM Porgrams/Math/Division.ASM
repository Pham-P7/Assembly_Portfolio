.386
.model flat, stdcall, c
.stack 4096

.data
check BYTE "true", 012
wrong BYTE "false", 012
result DWORD 0
.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near
public main

division proc var1: DWORD, var2: DWORD ;divides var1 by var2 using recursion
    sub var1, var2
    cmp var1, 0
    jg stop\\\

main proc
    xor ah, ah
    mov ax, 10
    mov dl, 5
    div dl

    
main endp
end main