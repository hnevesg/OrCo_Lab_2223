.data
cadena: .asciiz "Hola sE"
aux: .space 24

.text
.globl main

vuelta: move $t2 $a0
bucle:
lb $t1 ($t2) #mete los caracteres
beqz $t1 inversa
add $t2 $t2 1
add $t0 $t0 1
b bucle

inversa:
sub $t2 $t2 1 #para ir al ultimo caracter de la cadena
bucle2:
bgt $a0 $t2 finalcad
lbu $t1, ($t2) 
sb $t1 ($a1)
sub $t2 $t2 1
add $a1 $a1 1
b bucle2

finalcad:
li $t1 0
sb $t1 ($a1) #'\0'
jr $ra

main:
la $a0, cadena
la $a1, aux
li $t0 0 #longitud cadena
li $t1 0
jal vuelta
la $a0, aux #move $a0, $a1 no funciona
li $v0 4
syscall

fin: li $v0 10
syscall