.386
.model flat, stdcall, c
.stack 4096

.data
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
    ;mov eax, 2
    ;mov ebx, 3
    ;mul ebx
    ;add print, eax
    ;push offset print
    ;call printf
    mov print, 48
    div ebx
    add print, eax
    push offset print
    call printf


main endp
end