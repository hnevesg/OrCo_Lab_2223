.data
posible_palindromo: .asciiz  "reconocer" 
b: .asciiz "La frase es palindromo"
c: .asciiz "La frase no es palindromo"

.text
.globl main

main: 

la $t1, posible_palindromo  # Colocarnos en el extremo inicial es fácil # Lo ideal sería tener una función a parte que contara la longitud de la cadena para luego posicionar un puntero (t2) al final de ésta 
la $t2, posible_palindromo  # Lo ponemos al principio y lo movemos hacia el final:

bucle_longitud: 
lb   $t3, ($t2)             # Carga en t3 el byte al que apunta t2
beqz $t3, fin_bucle_long    # si t3 es igual a 0, hemos llegado al final de la cadena
addu $t2, $t2, 1             # sino nos movemos un caracter en la cadena   
b bucle_longitud            # y repetimos el bucle.

fin_bucle_long:   
sub $t2, $t2, 1             # La cadena termina en '\0'


bucle_palindromo:   
bge  $t1, $t2, es_palin      ##probar con beq
lb   $t3, ($t1)              # Carga el byte en el extremo inicial (desplazado)   
lb   $t4, ($t2)              # Carga el byte en el extremo final   (desplazado)  
bne  $t3, $t4, no_es_palin  
addu $t1, $t1, 1             # Desplazamos el extremo inicial  
subu $t2, $t2, 1             # Desplazamos el extremo final   
b bucle_palindromo         


es_palin:                      # Imprime el mensaje   
la  $a0, b   
li $v0 4
syscall   
jal   fin                    # Saltamos a la rutina de salida para terminar

no_es_palin:                   # Imprime el mensaje   
la  $a0, c   
li $v0 4
syscall
jal   fin                    # Saltamos a la rutina de salida para terminar

fin:                           # finaliza el programa (explicar su importancia)
li $v0 10
syscall