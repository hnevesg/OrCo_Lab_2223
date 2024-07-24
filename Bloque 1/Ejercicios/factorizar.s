.data
num: .word 72
    
.text
.globl main

factorizar:
move $t0, $a0
li $t1, 1 
li $t2, 2

siguiente_factor:
beq $t0, $t1, fin
rem $t3, $t0,$t2
beqz $t3, primo
add $t2, $t2, 1
b siguiente_factor

primo:
move $a0, $t2
li $v0, 1
syscall
div $t0, $t0, $t2
b siguiente_factor

main:
lw $a0, num
jal factorizar
li $v0 10
syscall

fin:
li $v0, 1
li $a0, 1
syscall
jr $ra