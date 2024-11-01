;(2 + 5) - (3 + 8)
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
num1 dword 2
num2 dword 5
num3 dword 3
num4 dword 8
result dword ?

.code
main proc
    mov eax, num1
    add eax, num2
    mov ebx, num3
    add ebx, num4
    mov ecx, eax
    sub ecx, ebx
    mov [result], ecx
main endp
end main