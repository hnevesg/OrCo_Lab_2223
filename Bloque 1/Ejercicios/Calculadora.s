.data
a: .space 4
b: .space 4
c: .asciiz " El resultado es "
d: .asciiz " Quieres sumar o restar? Si quieres sumar introduce 0, si no cualquier otro número "
e: .asciiz " Introduce un valor "

.text
.globl main

sumar:
add $t3, $t2, $t1
la $a0, c
li $v0 4
syscall
move $a0, $t3
li $v0 1
syscall
jr $ra

restar:
sub $t3, $t2, $t1
la $a0, c
li $v0 4
syscall
move $a0, $t3
li $v0 1
syscall
jr $ra

main:
li $t0, 2
bucle: bge $0, $t0 continue
la $a0, e
li $v0 4
syscall
li $v0 5
syscall
bgt $t0, 1 salto
move $t1, $v0
sub $t0, $t0, 1
b bucle

salto:
move $t2, $v0
sub $t0, $t0, 1
b bucle

continue:
la $a0 d
li $v0 4
syscall
li $v0 5
syscall
beqz $v0 sumar
jal restar

fin: 
li $v0 10
syscall