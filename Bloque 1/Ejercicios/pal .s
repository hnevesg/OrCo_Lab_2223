.data
posible_palindromo: .asciiz  "reconocer" 
b: .asciiz "La frase es palindromo"
c: .asciiz "La frase no es palindromo"

.text
.globl main

main: 

la $t1, posible_palindromo  # Colocamos en el extremo inicial
la $t2, posible_palindromo  # Lo ponemos al principio y lo movemos hacia el final:

moverIndicefinal: 
lb   $t3, ($t2)             # Carga en t3 el byte al que apunta t2
beqz $t3, fin_palabra    
addu $t2, $t2, 1            # nos movemos un caracter en la cadena   
b moverIndicefinal            

fin_palabra:   
sub $t2, $t2, 1             # La cadena termina en '\0'


bucle_palindromo:   
beq  $t1, $t2, es_palin      
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
jal   fin                 

no_es_palin:                   # Imprime el mensaje   
la  $a0, c   
li $v0 4
syscall
jal   fin                   

fin:                           
li $v0 10
syscall