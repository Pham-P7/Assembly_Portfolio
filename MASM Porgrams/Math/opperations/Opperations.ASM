.386
.model flat, stdcall, c
.stack 4096

.data
print DWORD 48,0
.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main
main proc
    mov eax, 4 / 2
    add print, eax
    push offset print
    call printf
    push 0
main endp
end