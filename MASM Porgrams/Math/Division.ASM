.386
.model flat, stdcall, c
.stack 4096

.data
check BYTE "true", 012

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main

division proc;divides var1 by var2 using recursion
    xor ecx, ecx
    body:
        sub eax, ebx
        cmp eax, 0
        jnle cont
        ret
        cont:
            add ecx, 1
            jmp body
division endp

main proc
    mov eax, 4
    mov ebx, 2
    call division
    cmp ecx, 2
    jl right
    ret
    right:
        push offset check
        call printf
        push 0
main endp
end