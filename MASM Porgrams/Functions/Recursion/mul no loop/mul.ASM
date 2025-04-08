.386
.model flat, stdcall, c
.stack 4096

.data
number DWORD 1000000
times DWORD 4
print DWORD 48, 012

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main

main proc
    mov eax, times
    mov ebx, number
    call multiplication
    add print, edx
    push offset print
    call printf
    push 0
main endp

multiplication proc
    xor edx, edx
    body:
        cmp eax, 0
        je done
        ;;if eax is even, skip adding
        add edx, ebx
        shl ebx, 1
       shr eax, 1
        jmp body
        done:
            ret
multiplication endp

end