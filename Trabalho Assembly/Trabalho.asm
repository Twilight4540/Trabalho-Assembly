.data
	msg1: .asciiz "\nDigite um numero entre 1 e 10000: "
	msg2: .asciiz "\nValor invalido, digite novamente"
	msg3: .asciiz "\nNúmero primo: "
	
.text
main:
	#ler msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input $t0
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#if $t0 < 2
	blt $t0, 2, invalido 
	
	#if $t0 > 9999
	bgt $t0, 9999, invalido
	
	#$v0 = 2
	li $s0, 2
	
	j calculo
	
invalido:
	#ler msg2
	li $v0, 4
	la $a0, msg2
	syscall
	j main
	
calculo:
	#If $s0 == $t0:
	bgt $s0, $t0, fim
	
	li $s1, 2
calculo_primos:
	#if $s0 == $s1: Primo
	beq $s0, $s1, eh_primo
	
	#if $s0 % $s1 = 0: Proximo
	rem $s2, $s0, $s1
	beq $s2, 0, proximo
	
	#$s1 = $s1 + 1
	add $s1, $s1, 1
	j calculo_primos
	
eh_primo:
	#print ("Número primo: ")
	li $v0, 4
	la $a0, msg3
	syscall
	
	#print ("numero primo")
	li $v0, 1
	add $a0, $s0, 0
	syscall

proximo:
	#$s0 = $s0 + 1
	add $s0, $s0, 1
	
	j calculo

fim:
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
