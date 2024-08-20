; Phat Pham 8/19/2024
; all comments from tutorialspoint assembly course
section.text
  global _start
_start:
  mov edx,len; moves len value to the edx memory variable
  mov ecx,msg; makes space for the message
  mov ebx,1; file descriptor?
  mov eax,4 ;system call to write (sys_write)
  int 0x80; calls kernel
  
  mov eax,1;system call to exit (sys_exit)
  int 0x80
section.data
msg db "Hello, World", 0xa;string I want to print
len equ $ - msg