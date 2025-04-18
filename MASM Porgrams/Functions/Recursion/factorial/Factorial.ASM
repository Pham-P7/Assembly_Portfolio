.386
.model flat, stdcall, c
.stack 4096

.data
string DWORD 10 DUP(48) ; set a size 10 array with 0s
number DWORD 5
result DWORD 1
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
main proc
    call factor
    mov eax, result
    mov number, eax
    call decomp
main endp

factor proc
    mov eax, result
    mov ebx, number
    call multiplication
    mov result, edx
    sub ebx, 1
    mov number, ebx
    cmp number, 1
    jpe done
    call factor
    done:
        ret
factor endp

decomp proc
    mov esi, offset string
    sub esi, 4
    top:;;
        add esi, 4
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
        cmp esi, offset string + 36
        jl top
        ;;

    mov eax, 0
    sub esi, 36

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
        
        ;;

decomp endp
division proc;divides var1 by var2 using reiterration
    mov ecx, 0
    body:
        cmp eax, ebx
        jl done
        sub eax, ebx
        add ecx, 1
        jmp body
    done:
        ret
division endp
multiplication proc;multiplies var1 by var2 using reiterration
    ;xor ecx, ecx
    ;xor edx, edx
    body:
    ;    add ecx, 1
    ;    add edx, eax
    ;    cmp ecx, ebx
    ;    jg done
    cmp ebx, 0
        jmp body
        done:
            ret
multiplication endp
end