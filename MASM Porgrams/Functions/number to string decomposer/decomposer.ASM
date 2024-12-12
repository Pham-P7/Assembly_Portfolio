.386
.model flat, stdcall, c
.stack 4096


.data
givenNumber BYTE 19
places BYTE ?
n BYTE 0 ;power
index BYTE ?
Itt BYTE ?
ASCII_value BYTE 48

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main

power proc


power endp

                    
decompose proc


decompose endp

main proc


main endp
end