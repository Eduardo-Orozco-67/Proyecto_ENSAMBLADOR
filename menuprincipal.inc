MENUPRINCIPAL MACRO
;FUNCION PARA LIMPIAR PANTALLA Y VOLVER A DAR COLOR
        LIMPIAR 10000000B
        
        ;Dar color a la pantalla      
        ;                    U1  U2   U3   U4
        COLOREAR 11110001B, 00D, 00D, 24D, 79D ;blanco-azul
	  ;COLOREAR 11110001B, 03D, 00D, 24D, 03D ;blanco-azul
        COLOREAR 10001111B, 02D, 02D, 22D, 77D ;gris
	  ; ROBOTIN
	  COLOREAR 11111111B, 05D, 60D, 05D, 60D
	  COLOREAR 11111111B, 06D, 60D, 06D, 60D
	  COLOREAR 11111111B, 05D, 63D, 05D, 63D
	  COLOREAR 11111111B, 06D, 63D, 06D, 63D
	  COLOREAR 11111111B, 07D, 58D, 07D, 65D
	  COLOREAR 11111111B, 08D, 57D, 08D, 58D
	  COLOREAR 11111111B, 08D, 60D, 08D, 60D
	  COLOREAR 11111111B, 08D, 63D, 08D, 63D
	  COLOREAR 11111111B, 08D, 65D, 08D, 66D
	  COLOREAR 11111111B, 09D, 57D, 09D, 57D
	  COLOREAR 11111111B, 09D, 60D, 09D, 60D
	  COLOREAR 11111111B, 09D, 63D, 09D, 63D
	  COLOREAR 11111111B, 09D, 66D, 09D, 66D
	  COLOREAR 11111111B, 10D, 57D, 10D, 58D
	  COLOREAR 11111111B, 10D, 65D, 10D, 66D
	  COLOREAR 11111111B, 11D, 58D, 11D, 65D
	  COLOREAR 11111111B, 12D, 60D, 12D, 63D
	  COLOREAR 11111111B, 13D, 57D, 13D, 66D
	  COLOREAR 11111111B, 14D, 56D, 14D, 59D
	  COLOREAR 11111111B, 14D, 64D, 14D, 67D
	  COLOREAR 11111111B, 15D, 55D, 15D, 58D
	  COLOREAR 11111111B, 15D, 61D, 15D, 62D
	  COLOREAR 11111111B, 15D, 65D, 15D, 68D                                       
	  COLOREAR 11111111B, 16D, 55D, 16D, 56D
	  COLOREAR 11111111B, 16D, 58D, 16D, 58D
	  COLOREAR 11111111B, 16D, 65D, 16D, 65D
	  COLOREAR 11111111B, 16D, 67D, 16D, 68D
	  COLOREAR 11111111B, 17D, 54D, 17D, 54D
	  COLOREAR 11111111B, 17D, 56D, 17D, 56D
	  COLOREAR 11111111B, 17D, 58D, 17D, 59D
	  COLOREAR 11111111B, 17D, 64D, 17D, 65D
	  COLOREAR 11111111B, 17D, 67D, 17D, 67D
	  COLOREAR 11111111B, 17D, 69D, 17D, 69D
	  COLOREAR 11111111B, 18D, 58D, 18D, 65D
	  COLOREAR 11111111B, 19D, 58D, 19D, 59D
	  COLOREAR 11111111B, 19D, 64D, 19D, 65D
	  COLOREAR 11111111B, 20D, 58D, 20D, 59D
	  COLOREAR 11111111B, 20D, 64D, 20D, 65D
	  COLOREAR 11111111B, 21D, 57D, 21D, 60D
	  COLOREAR 11111111B, 21D, 63D, 21D, 66D
	  ; LINEAS DE DECORACION
	  COLOREAR 11111111B, 00D, 00D, 24D, 2D
	  COLOREAR 11111111B, 00D, 4D, 24D, 4D
	  COLOREAR 11111111B, 00D, 6D, 24D, 6D
	  COLOREAR 11111111B, 00D, 8D, 24D, 8D
	  COLOREAR 11111111B, 00D, 10D, 24D, 10D
	  COLOREAR 11111111B, 00D, 12D, 24D, 12D
	  COLOREAR 11111111B, 00D, 14D, 24D, 14D
	  ;COLOREAR 11111111B, 00D, 16D, 24D, 16D

        ;IMPRIMIR MENU PRINCIPAL
        UBICCAD 01D, 27D, CADENA
        UBICCAD 03D, 16D, CADENA1
        UBICCAD 04D, 16D, CADENA2
        UBICCAD 05D, 16D, CADENA3
        UBICCAD 06D, 16D, CADENA4
        UBICCAD 07D, 16D, CADENA5
        UBICCAD 08D, 16D, CADENA6
	  UBICCAD 09D, 16D, CADENA7                
        PEDIRN DIGITO;PEDIR DIGITO
ENDM

SUBMENU MACRO
	  LIMPIAR 10000000B        
        ;Dar color a la pantalla      
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
	  COLOREAR 11111111B, 00D, 16D, 24D, 16D    
    
        ;IMPRIMIR MENU PRINCIPAL
        UBICCAD 03D, 16D, CADENASUB1
        UBICCAD 04D, 16D, CADENASUB2
	  UBICCAD 05D, 16D, CADENA7               
        PEDIRN CADENASUB4	   
ENDM