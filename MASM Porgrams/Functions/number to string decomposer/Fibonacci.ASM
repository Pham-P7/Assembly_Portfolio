.386
.model flat, stdcall, c
.stack 4096

.data
string DWORD 10 DUP(48) ; set a size 10 array with 0s
one DWORD 0
two DWORD 1
temp DWORD 0
number DWORD 0
print DWORD 48, 0
base DWORD 1000000000
.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main
decomp proc
    mov esi, offset string
    clearer:
        mov eax, 48
        mov [esi], eax
        add esi, 4
        cmp esi, offset string + 40
        jl clearer

    sub esi, 40
    ;sub esi, 4
    top:;;

        mov eax, [number] ;put the current value into eax
        mov ebx, [base]
        ;;sub edx, edx
        call division ; edx has result of eax div ebx
        ;;mov edx, eax
        add [esi], ecx
        mov eax, ecx
        ;;mov eax, edx

        ;;mov eax, edx
        ;;mov ecx, [base]
        call multiplication
        mov ebx, edx
        mov eax, [number]
        sub eax, ebx
        mov [number], eax
        ;;sub edx, edx
        mov eax, [base]
        mov ebx, 10
        call division
        mov [base], ecx
        add esi, 4
        cmp esi, offset string + 40
        jl top
        ;;

    mov eax, 0
    sub esi, 40

    skiper:
        mov ebx, [esi]
        cmp ebx, 48
        jne done
        add esi, 4
        jmp skiper
        done:
    printer:
        mov ebx, [esi]
        mov print, ebx
        push offset print
        call printf
        push 0
        mov print, 48
        add esi, 4
        cmp esi, offset string + 40
        jl printer
    mov eax, 1000000000
    mov [base], eax
decomp endp
division proc;divides var1 by var2 using reiterration
    xor ecx, ecx
    body:
        cmp eax, ebx
        jl done
        sub eax, ebx
        add ecx, 1
        jmp body
        done:
division endp
multiplication proc;multiplies var1 by var2 using reiterration
    xor ecx, ecx
    xor edx, edx
    body:
        add ecx, 1
        cmp ecx, ebx
        jg done
        add edx, eax
        jmp body
        done:
multiplication endp

main proc
    mov eax, one
    add print, eax
    push offset print
    call printf
    push 0
    ;
    mov eax, 32
    mov print, eax
    push offset print
    call printf
    push 0
    ;
    mov eax, two
    mov print, 48
    add print, eax
    push offset print
    call printf
    push 0
    ;
    mov eax, 32
    mov print, eax
    push offset print
    call printf
    push 0
    mov eax, 48
    mov print, eax
    ;
    start:
        mov eax, one
        mov temp, eax
        mov eax, two
        add temp, eax
        mov one, eax
        mov eax, temp
        mov two, eax
        mov temp, 0
        mov number, eax
        call decomp
        ;
        mov eax, 32
        mov print, eax
        push offset print
        call printf
        push 0
        mov eax, 48
        mov print, eax
        jmp start
main endp
end