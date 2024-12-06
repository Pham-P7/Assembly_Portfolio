.386
.model flat, stdcall, c
.stack 4096

.data
num1 DWORD 1
num2 DWORD 1
check BYTE "its working" ,012

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main

addition proc var1: DWORD, var2: DWORD
    xor eax, eax
    add eax, var1
    add eax, var2
    cmp eax, 2
    jne false
    push offset check
    call printf
    push 0
    false:
    ret
addition endp


main proc
    mov ebx, [num1]
    mov ecx, [num2]
    push ebx 
    push ecx
    call addition
    call addition
    top: ;pauses the program by keeping it in a loop to check the output
    jmp top
main endp
end