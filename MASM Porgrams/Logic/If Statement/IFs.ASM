.386
.model flat, stdcall, c
.stack 4096

.data
x dword 4
y dword 2
z dword ?

main proc
    mov eax, x
    mov ebx, y
    cmp eax, ebx
    jne L1
    mov z, 1
    jmp L2
    L1:
        mov z, 0
    L2:
main endp
end main