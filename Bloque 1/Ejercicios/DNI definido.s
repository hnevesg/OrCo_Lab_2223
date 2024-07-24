.data
longitud_DNI: .word 8,2,5,6,7,4,1,0
total: .word 8
d: .asciiz " El resultado es "

.text
.globl main

contador: 
move $t0, $a0
bucle:
bgt $t1, $a2 imprimir
lw $t3, ($t0)
add $t2, $t2, $t3 
addi $t1, $t1, 1
addi $t0, $t0, 4
b bucle

imprimir: la $a0, d
li $v0, 4
syscall
move $a0, $t2
li $v0 1
syscall
jr $ra

main:
la $a0, longitud_DNI
li $t1, 1
lw $a2, total
jal contador

fin: 
li $v0 10
syscall