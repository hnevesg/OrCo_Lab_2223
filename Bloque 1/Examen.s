.data
long: .asciiz " Longitud: "
esp: .asciiz " Espacios: "
cad: .asciiz "Relax, its only ONES and ZEROS!"

.text
.globl main

contar: move $t0 $a0
li $t4 ' '
bucle:
lb $t5 ($t0)
beqz $t5 imprimir #fin cadena '\0'
beq $t5 $t4 espacios
add $t2 $t2 1 #total caracteres
add $t0 $t0 1
beq $t2 $t1 imprimir
b bucle

espacios: addi $t6 $t6 1 #total espacios
add $t2 $t2 1
add $t0 $t0 1
b bucle

imprimir:
la $a0 long
li $v0 4
syscall

move $a0 $t2
li $v0 1
syscall

la $a0 esp
li $v0 4
syscall

move $a0 $t6
li $v0 1
syscall
jr $ra

main: 
la $a0 cad
li $t1 100 #valor max
jal contar

fin: li $v0 10
syscall