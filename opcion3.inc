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

crear macro
     		UBICCAD 03D, 15D, msg4       
            UBICCAD 05D, 15D, mg
            mov si, 3
            call ciclo   
            
            mov ah, 3ch
            mov cx,0  
            mov dx,offset ruta
            int 21h
            mov handle, ax
            
            mov bx,ax
            mov ah,3eh
            int 21h
            
            UBICCAD 07D, 15D, msg3 
            mov ah,01h
            int 21h
            
endm


abrir macro
            UBICCAD 03D, 15D, msg4  
            UBICCAD 05D, 15D, mg
            mov si,3
            call ciclo
            
            abrir:
                mov ah,3dh
                mov al,0h
                mov dx,offset ruta
                int 21h
                mov handle,ax
                
                ;leer archivo
                mov ah,3fh ;Lectura del archivo
                mov bx,handle
                mov dx,offset vec
                mov cx,aux
                int 21h 
                
                UBICCAD 07D, 15D, texto
                
                UBICCAD 09D, 15D, vec
                
                mov ah,01h
                int 21h
        
                mov ah,3eh
                int 21h
endm

pedir macro
		UBICCAD 03D, 15D, msg4        
            UBICCAD 05D, 15D, mg2
            mov si,0
            pedir:
                mov ah,01h
                int 21h
                mov vec[si], al
                inc si
                cmp al, 0dh
                ja pedir
                jb pedir
                
                UBICCAD 07D, 15D, decision1
                mov ah,01h
                int 21h
                mov opcion,al
                mov ah,02h
                mov dl,02h
                int 21h
                cmp opcion,6eh
                je cancelar
             
             editar:
                push si
                mov si,3
                UBICCAD 09D, 15D, mg
                call ciclo
                pop si
                mov ah,3dh
                mov al,1h
                mov dx,offset ruta
                int 21h
                jc error
                
                mov bx,ax
                mov cx,si
                mov dx,offset vec
                mov ah,40h
                int 21h
                cmp cx,ax
                jne error
                mov ah,3eh
                int 21h
                UBICCAD 11D, 15D,exito
                mov ah,01h
                int 21h 
endm

borrar macro
		UBICCAD 03D, 15D, msg4  
            UBICCAD 05D, 15D, decision2
                mov ah,01h
                int 21h
                mov opcion,al
                mov ah,02h
                mov dl,0ah
                int 21h
                cmp opcion,6eh
                je cancelar
                
                mov bx,ax
                mov ah,3eh
                int 21h 
                
                UBICCAD 07D, 15D, mg
                
                mov si,3
                call ciclo 
                
                mov ah,41h  
                mov cx,0
                mov dx,offset ruta
                int 21h      
                mov handle,ax
                
                UBICCAD 09D, 15D, exito
			mov ah,01h
                int 21h 
endm