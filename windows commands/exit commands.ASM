format PE64 NX GUI 6.0 ;command for FASM compiler instructions
entry start ;where the program starts

section '.text' code readable executable ; "main" method of the program 
start: ;start of the program
     int3 ;breakpoint
     sub rsp, 8 * 5 ;adjust stack ptr and allocates "shadow space"
     xor rcx, rcx ;the only arguent is the return code from the rcx
     call [ExitProcess] ;calls the exit process...

section '.idata' import readable writeable ;modifying the data section (runs before the .text section)
idt: ;import directory table starts here
     ;also entry point for KERNEL32.DLL
     dd rva kernel32_iat
     dd 0
     dd 0
     dd rva kernel32_name
     dd rva kernel32_iat
     ;Null entry, end of IDT
     dd 5 dup(0)
name_table: ;hint/name table
     _ExitProcess_Name dw 0
     db "ExitProcess", 0, 0
kernel32_name: db "KERNEL32.DLL", 0
kernel32_iat: ;import address table for KERNEL32
     ExitProcess dq rva _ExitProcess_Name
     dq 0 ;end of KERNEL32's IAT