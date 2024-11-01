.386
.model flat, stdcall, c
.stack 4096

.data
num1 dword 0 ;variable num1 with space dword with the value 0
comp dword 1000000000; variable named comp (comparitor) with the value of 10
debug dword 8

.code
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near

public main
main proc
	push	offset msg
	call	printf
	push	0
	mov eax, num1
	mov ebx, comp
	top: ;while loop aka (while num1 < comp)

	cmp eax,ebx ;compares (cmp) 2 arguements for bit equality
	jae next ; jae (jump if above or equal) jumps to the "next" block (exits the loop)
	push	offset msg
	call	printf
	push	0
	inc eax; increments eax register by 1
	jmp top ;unconditional jump to the "top" block (restarts the loop)

	next:
	push	offset msg
	call	printf
	push	0
	mov eax, debug
	;call exit
main endp
end