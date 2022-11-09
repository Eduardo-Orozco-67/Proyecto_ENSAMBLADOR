SUBMENUARC MACRO
	LIMPIAR 10000000B          
      COLOREAR 11110001B, 00D, 00D, 24D, 79D ;blanco-azul
      COLOREAR 10001111B, 02D, 02D, 22D, 77D ;gris     

	;LINEAS DE DECORACION
	COLOREAR 11111111B, 00D, 00D, 24D, 2D
	COLOREAR 11111111B, 00D, 4D, 24D, 4D
	COLOREAR 11111111B, 00D, 6D, 24D, 6D
	COLOREAR 11111111B, 00D, 8D, 24D, 8D
	COLOREAR 11111111B, 00D, 10D, 24D, 10D
	COLOREAR 11111111B, 00D, 12D, 24D, 12D
	COLOREAR 11111111B, 00D, 14D, 24D, 14D

      UBICCAD 01D, 28D, letrero0
      UBICCAD 03D, 16D, op1
      UBICCAD 04D, 16D, op2
    	UBICCAD 05D, 16D, op3
    	UBICCAD 06D, 16D, op4
      UBICCAD 07D, 16D, op5
    	UBICCAD 08D, 16D, msg2          
      
	mov ah,01h      ; solicita una opcion al usuario
      int 21h
ENDM

imprime macro cadena
    mov ax,datos
    mov ds,ax
    mov ah,09h
    mov dx,offset cadena
    int 21h
endm

 ciclo macro
            mov ah,1h
            int 21h
            cmp al,13d
            je terminar
            cmp si,16
            je terminar
            mov ruta[si], al
            inc si
            jb ciclo
            terminar:
            mov ruta[si],0
            ret 
endm

cancelar macro
            imprime cancel
            jmp mostrar_menuar
endm

error macro 
            imprime errorm
            jmp mostrar_menuar
endm