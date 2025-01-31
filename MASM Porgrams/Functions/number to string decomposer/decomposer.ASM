.386
.model flat, stdcall, c
.stack 4096


.data
number DWORD 67
string DWORD 10 DUP(48) ; set a size 10 array with 0s

base DWORD 1000000000
.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main
string DWORD 

main proc
    mov ax, 0
    top:
        mov string[ax], number / base
        mov number, number - base * string[ax]
        mov base, base / 10
        cmp ax, 0
        inc ax
        jg
    mov ax, 0
    printer:
        cmp ax, 10
        j

main endp
end