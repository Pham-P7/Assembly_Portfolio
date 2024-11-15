.386
.model flat, stdcall, c
.stack 4096

.data
msg BYTE ?

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main
main proc
    ;mov al, 0x01 ;tells to store the input into the al register
    ;int 0x21 ;calls the input
    ;mov msg, al ;moves the input into my msg variable
    mov ah, 00h
    int 16h
    mov msg, ah
    push    offset msg
    call    printf
    push    0
main endp
end