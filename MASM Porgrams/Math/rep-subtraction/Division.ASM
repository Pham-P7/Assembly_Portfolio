.386
.model flat, stdcall, c
.stack 4096

.data
number DWORD 48, 012, 0 ;array of number 0, new line, terminate string

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main

division proc;divides var1 by var2 using reiterration
    xor ecx, ecx
    body:
        cmp eax, ebx
        jl done
        sub eax, ebx
        add ecx, 1
        jmp body
        done:
            ret
division endp

main proc
    mov eax, 15
    mov ebx, 3
    call division
    add number, ecx
    push offset number
    call printf
    push 0
main endp
end