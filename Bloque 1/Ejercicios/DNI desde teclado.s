.data
longitud_DNI: .word 8
b: .asciiz " Introduce el numero "
c: .asciiz " de tu DNI "
d: .asciiz " El resultado es "

.text
.globl main

contador: bgt $t1, $t0 imprimir
la $a0, b
li $v0 4
syscall

move $a0, $t1
li $v0 1
syscall

la $a0, c
li $v0 4
syscall

li $v0 5
syscall

add $t2, $t2, $v0 # valor introducido por teclado
add $t1, $t1, 1
b contador


imprimir: la $a0, d
li $v0, 4
syscall
move $a0, $t2
li $v0 1
syscall
jr $ra

main:
lw $t0, longitud_DNI
li $t1, 1
jal contador
jal fin

fin: 
li $v0 10
syscall