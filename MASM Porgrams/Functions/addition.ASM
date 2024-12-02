.386
.model flat, stdcall, c
.stack 4096

.data
num1 BYTE 1
num2 BYTE 1
check DWORD ?

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main

addition proc var1: BYTE, var2: BYTE
    xor eax, eax
    add eax, var1
    add eax, var2
    mov [check], eax
    push offset check
    call printf
    push 0
    ret
addition endp


main proc
    push offset num1
    push num2
    call addition
    pause: ;pauses the program by keeping it in a loop to check the output
        jmp pause
main endp
end