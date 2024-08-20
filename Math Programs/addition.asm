;Phat Pham 
.include "m328pdef.inc" ;import standard package
;create 4 variables with 16 bits resereved for each
.def num1low = r16
.def num2low = r17
.def num1high = r18
.def num2high = r19

.cseg ;start flash
.org 0x00 ;system code to start flash

ldi num1low,0x34 ; "load" assign the 0x34 value to the num1low variable
ldi num2low,0x12;
ldi num1high,0xCD
ldi num2high,0xAB

add num1low,num2low ; add the 2 lower byte variables
adc num1high,num2high ; adc the 2 higher byte variables

loop: rjmp loop