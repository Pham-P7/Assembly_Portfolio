.386
.model flat, stdcall, c
.stack 4096

.data
array DWORD 0,1,2,3,4
print DWORD 48
space DWORD 32
.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main
main proc
    mov eax, 0
    mov esi, offset array
    itt:
        mov ebx, [esi]
        add esi, 4
        add print, ebx
        push offset print
        call printf
        push offset space
        call printf
        mov print, 48
        inc eax
        cmp esi, offset array + 20
        jl itt
main endp
end