;adding two 32 bit integers together
.386 ;processor type
.model flat, stdcall ;memory model
.stack 4096 ;stack amount
ExitProcess proto,dwExitCode:dword ;states the exit process

.data ;where all my variables are delcaired
sum DWORD ? ;variable named sum with space of a DWORD with the value of nothing

.code ;where my code goes
main proc ;main procedure
        mov eax, 7 ;moves the integer to the register eax (extended ax)
        add eax, 4 ;adds the integer to the register eax
        mov sum, eax ;moves the value of eax to the variable of sum

        invoke ExitProcess, 0 ;calls the exit process

main endp ;main endpoint
end main ;ends main                     