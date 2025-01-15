.386
.model flat, stdcall, c
.stack 4096

.data
array DWORD 0,1,2,3,4
print DWORD 48

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main
main proc
    mov eax, -1
    mov esi, offset array
    itt:
        mov ebx, [esi]
        add print, ebx
        add esi, SIZE(DWORD)
        push offset print
        call printf
        push 0
        mov print, 48
        inc eax
        cmp eax, 5
        jl itt
main endp
end