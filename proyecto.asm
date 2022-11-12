include "menuprincipal.inc"
include "macros.inc"
include "presentacion.inc"
include "opcion2.inc" 
include "opcion3.inc"
include "opcion4.inc"

DATOS SEGMENT
    ;MENU PRINCIPAL
    CADENA DB "°  °  ° BIENVENIDO °  °  ° $"
    CADENA1 DB "1.- PRESENTACION DEL EQUIPO$"
    CADENA2 DB "2.- COMPARACION DE DOS NUMEROS$"
    CADENA3 DB "3.- OPERACIONES CON ARCHIVOS$"
    CADENA4 DB "4.- REGALOS NAVIDENIOS$"  
    CADENA5 DB "5.- CASA DE ASTERISCOS$"
    CADENA6 DB "6.- SALIR DEL PROGRAMA $"
    CADENA7 DB "OPCION: $"   
    DIGITO DB ?
    CADENA8 DB "CONTINUAR [ENTER] $" 
    
    ;SUBMENU
    CADENASUB1 DB "1.- REGRESAR AL MENU PRINCIPAL$" 
    CADENASUB2 DB "2.- SALIR$"
    
    ;OPCION 1
    CADENAOP1 DB "°  °  ° PRESENTACION DEL EQUIPO °  °  ° $"
    CADENA1OP1 DB "UNIVERSIDAD AUTONOMA DE CHIAPAS$"
    CADENA2OP1 DB "FACULTAD DE NEGOCIOS C-IV$"
    CADENA3OP1 DB "TRADUCTORES DE BAJO NIVEL$" 
    CADENA4OP1 DB "PEDRO OCTAVIO CULEBRO PRADO$"
    CADENA5OP1 DB "SAMUEL SANCHEZ GUZMAN$"
    CADENA6OP1 DB "PAULINO ENRIQUE NORIEGA VELAZQUEZ$"
    CADENA7OP1 DB "JOSE EDUARDO OROZCO CARDENAS$"
    CADENA8OP1 DB "EMILIA ZUNIGA LOSADA$"
    
    ;OPCION 2
    CADENAOP2 DB "°  °  ° COMPARACION DE DOS NUMEROS °  °  ° $"
    CADENA1OP2 DB "INGRESE UN VALOR [0...9]: $"
    CADENA2OP2 DB "INGRESE UN VALOR [0...9]: $"
    CADENAMAYOR DB "EL PRIMER VALOR ES MAYOR$"
    CADENAMENOR DB "EL PRIMER VALOR ES MENOR$"  
    CADENAIGUAL DB "SON IGUALES$" 
    DIG1OP2 DB ?
    DIG2OP2 DB ?
    DIGISOP2 DB ?          
    
    ;SUBMENU OPCION 2
    CADENASMOP21 DB "DESEA OTRA COMPARACION? (CUALQUIER TECLA EXCEPTO 1 Y 2)$" 
    CADENASMOP22 DB "1.- REGRESAR AL MENU PRINCIPAL$"
    CADENASMOP23 DB "2.- SALIR$"
    OPCIONSI DB 115 ;115"s$"
    CADENASMOP25 DB ?

    ;OPCION 3
    letrero0 DB '<<<<< SUBMENU DE ARCHIVOS >>>>>$'
    msg1 db "EDITOR DE TEXTO $"
    op1 db  "1.- CREAR ARCHIVO $" 
    op2 db  "2.- LEER ARCHIVO $"
    op3 db  "3.- ESCRIBIR ARCHIVO $"
    op4 db  "4.- ELIMINAR ARCHIVO $"
    op5 db  "5.- SALIR $"
    msg2 db "ELIJA SU OPCION : $"
    ruta db 'C', ':', '\', '$',00h
    nombre db 13 dup('$')
    decision1 db  "ESTA SEGURO QUE DESEA AGREGAR ESTE CAMBIO S/N : $"
    decision2 db  "ESTA SEGURO QUE DESEA ELIMINAR S/N : $"  
    texto db  "CONTENIDO : $"  
    msg3 db "ARCHIVO CREADO : $"
    msg4 db "NO SE OLVIDE AGREGAR EL .txt AL FINAL DEL NOMBRE DEL ARCHIVO $" 
    exito db "EXITO : $"
    cancel db  "OPERACION CANCELADA : $"  
    mg db "INGRESA EL NOMBRE DEL ARCHIVO : $"
    mg2 db "INGRESA EL CONTENIDO : $"      
    errorm db "HUBO UN ERROR $"   
    opcion db 0
    handle dw 0
    aux dw 0
    vec db 50 dup('$')
    
    
    ;OPCION 5
    ASTERISCO DB '* ', '$'
    x DB 28H
    y DB 0H
    x1 DB 37D
    CANTAST DB 1 ;1
    ANTECH DB 3;3 aux
    ANTECH1 DB 6;4 aux
    CASA DB 10;7 aux
    aument db 1 ;1  cant
    aument2 db 7H;7      cant
    aument3 db 7;7      cant
    
DATOS ENDS

CODIGO SEGMENT 
    ASSUME DS:DATOS, CS:CODIGO 
    
INICIO:
    MOV AX, DATOS
    MOV DS, AX
    
    MENU_PRINCIPAL:
        ;IMPORTAR MACRO DEL MENU PRINCIPAL  
        MENUPRINCIPAL
                        
        ;Comprar las opciones ingresadas
        CMP AL, 01h      
        JE slt_opcion1        
        
        CMP AL, 02h
        JE slt_opcion2
        
        CMP AL, 03h
        JE slt_opcion3
        
        CMP AL, 04h
        JE slt_opcion4
        
        CMP AL, 05h
        JE slt_opcion5
        
        CMP AL, 06h
        JE slt_opcion6
                   
        
    JMP MENU_PRINCIPAL ;fin de la etiqueta 
    
    ;LISTADO DE OPCIONES
    slt_opcion1:
    JMP opcion1
    
    slt_opcion2:
    JMP opcion2
    
    slt_opcion3:
    JMP opcion3 
    
    slt_opcion4:
    JMP opcion4 
    
    slt_opcion5:
    JMP opcion5

    slt_opcion6:
    JMP opcion6    
    
    ;---------------------------------------------------------------------------------------------+
    ;OPCION DE LA PRESENTACION DEL EQUIPO 
    opcion1:   
       ;Importar macro de la presentacion
       PRESENTACION
      SUBMENU:
       LIMPIAR 10000000B        
       ;Dar color a la pantalla      
       ;                    U1  U2   U3   U4
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
	   
       UBICCAD 03D, 16D, CADENASUB1
       UBICCAD 04D, 16D, CADENASUB2
	   UBICCAD 05D, 16D, CADENA7  
    
       MOV AH, 01H
       INT 21H
       SUB AL, 30H
       CMP AL, 01D  ;COMPRARA NUMERO CON REGISTRO AL
       JE MENU_PRINCIPAL        
       CMP AL, 02D
       JE FIN        
    
    ;---------------------------------------------------------------------------------------------+
    ;OPCION COMPARACION DE NUMEROS 
    opcion2:    
          
        COMPARACION ;MACRO PARA PEDIR NUMEROS
         MOV AL, DIG2OP2  
         CMP DIG1OP2, AL 
         JA MAYOR
         JB MENOR
         JE IGUAL 
         
        ;Da un salto segun sea el resultado de la comparacion
        MAYOR:
         UBICCAD 05D, 16D, CADENAMAYOR         
         jmp SUBMENUOP2 
                
        MENOR:
         UBICCAD 05D, 16D, CADENAMENOR
         JMP SUBMENUOP2
         
        IGUAL:
         UBICCAD 05D, 16D, CADENAIGUAL
         JMP SUBMENUOP2                
        
        ;Menu secundario para el usuario 
        SUBMENUOP2:
         UBICCAD 10D, 16D, CADENASMOP21
         UBICCAD 11D, 16D, CADENASMOP22
	     UBICCAD 12D, 16D, CADENASMOP23
	     UBICCAD 13D, 16D, CADENA7 
         PEDIRN DIGISOP2 
         
         MOV AL, DIGISOP2
         CMP OPCIONSI, AL ;COMPRARA NUMERO CON REGISTRO AL
         JE slt_opcion2r
         
         CMP AL, 01D        
         JE MENU_PRINCIPAL
                 
         CMP AL, 02D
         JE FIN
         
         slt_opcion2r:
         JMP opcion2    
    ;---------------------------------------------------------------------------------------------+ 
    
    ;---------------------------------------------------------------------------------------------+
    opcion3:    
        mostrar_menuar:       ; etiqueta donde vamos a redireccionar nuestro menu
                    
            SUBMENUARC ;importar macro para el submenu de archivos
            
            mov opcion,al
            cmp opcion,31h      ; compara las opciones que el usuario ingresa 
            je sub_opcion1  ; si presiono 1 realizara un salto intermedio a la opcion 1
            cmp opcion,32h      ; si presiono 2 realiza el salto intermedio a la opcion 2
            je sub_opcion2
            cmp opcion,33h
            je sub_opcion3
            cmp opcion,34h
            je sub_opcion4
            cmp opcion,35h
            je sub_opcion5
            
        jmp mostrar_menuar    ; si no actua por default y va de nuevo a presentar el menu
    
          sub_opcion1:
            jmp opcion1ar    ; cuando llegamos a esta opcion saltamos a la primera opcion
          sub_opcion2:
            jmp opcion2ar
          sub_opcion3:
            jmp opcion3ar
          sub_opcion4:
            jmp opcion4ar
          sub_opcion5:
            jmp opcion5ar          
            
        ;opcion 1 CREAR         
        opcion1ar:        
            
            LIMPIAR 00001111B  ; funcion para limpiar pantalla
            COLOREAR 11110001B, 00D, 00D, 24D, 79D ;blanco-azul
            COLOREAR 10001111B, 02D, 02D, 22D, 77D ;gris  
            COLOREAR 11111111B, 00D, 00D, 24D, 2D
        	COLOREAR 11111111B, 00D, 4D, 24D, 4D
        	COLOREAR 11111111B, 00D, 6D, 24D, 6D
        	COLOREAR 11111111B, 00D, 8D, 24D, 8D
        	COLOREAR 11111111B, 00D, 10D, 24D, 10D
        	COLOREAR 11111111B, 00D, 12D, 24D, 12D
        	COLOREAR 11111111B, 00D, 14D, 24D, 14D        
           
            crear
            
        jmp mostrar_menuar  
        
        ;opcion 2 LEER        
        opcion2ar:
            LIMPIAR 00001111B  ; funcion para limpiar pantalla  
            COLOREAR 11110001B, 00D, 00D, 24D, 79D ;blanco-azul
            COLOREAR 10001111B, 02D, 02D, 22D, 77D ;gris  
            COLOREAR 11111111B, 00D, 00D, 24D, 2D
        	COLOREAR 11111111B, 00D, 4D, 24D, 4D
        	COLOREAR 11111111B, 00D, 6D, 24D, 6D
        	COLOREAR 11111111B, 00D, 8D, 24D, 8D
        	COLOREAR 11111111B, 00D, 10D, 24D, 10D
        	COLOREAR 11111111B, 00D, 12D, 24D, 12D
        	COLOREAR 11111111B, 00D, 14D, 24D, 14D 
            
            abrir
            
        jmp mostrar_menuar   
        
        ;opcion 3  MODIFICAR
        
        opcion3ar:            
            LIMPIAR 00001111B
            COLOREAR 11110001B, 00D, 00D, 24D, 79D ;blanco-azul
            COLOREAR 10001111B, 02D, 02D, 22D, 77D ;gris  
            COLOREAR 11111111B, 00D, 00D, 24D, 2D
        	COLOREAR 11111111B, 00D, 4D, 24D, 4D
        	COLOREAR 11111111B, 00D, 6D, 24D, 6D
        	COLOREAR 11111111B, 00D, 8D, 24D, 8D
        	COLOREAR 11111111B, 00D, 10D, 24D, 10D
        	COLOREAR 11111111B, 00D, 12D, 24D, 12D
        	COLOREAR 11111111B, 00D, 14D, 24D, 14D      
            
            pedir
            
        jmp mostrar_menuar 
                   
                   
        ;opcion 4  BORRAR 
        opcion4ar: 
            LIMPIAR 00001111B
            COLOREAR 11110001B, 00D, 00D, 24D, 79D ;blanco-azul
            COLOREAR 10001111B, 02D, 02D, 22D, 77D ;gris  
            COLOREAR 11111111B, 00D, 00D, 24D, 2D
        	COLOREAR 11111111B, 00D, 4D, 24D, 4D
        	COLOREAR 11111111B, 00D, 6D, 24D, 6D
        	COLOREAR 11111111B, 00D, 8D, 24D, 8D
        	COLOREAR 11111111B, 00D, 10D, 24D, 10D
        	COLOREAR 11111111B, 00D, 12D, 24D, 12D
        	COLOREAR 11111111B, 00D, 14D, 24D, 14D 
            
            borrar
            
        jmp mostrar_menuar 
        
        ;opcion 5 REGRESAR
        opcion5ar:
            LIMPIAR 00001111B  ; funcion para limpiar pantalla                  
        
        JMP MENU_PRINCIPAL
        
        ciclo:
            ciclo
            
        cancelar:
            cancelar
        error:
            error
    ;---------------------------------------------------------------------------------------------+  
    
    ;---------------------------------------------------------------------------------------------+
    ;OPCION REGALOS NAVIDENOS 
    opcion4:

         REGALITOS ;importar macro regalitos       
        
    JMP MENU_PRINCIPAL 
    ;-------------------------------+
    ;---------------------------------------------------------------------------------------------+
    ;OPCION CASA DE ASTERISCOS 
    opcion5:
     ;Llamar procedimiento
      CALL CASAAST 
      ;Crear procedimiento
      CASAAST PROC NEAR    
        MOV AH,06H       ;Funcion que limpia la pantalla
        MOV AL,00H
        MOV BH,00000000B ;Dar color inicial negro-negro
        MOV CX,0000H     ;coordenadas inicio
        MOV DX,184fH    ; coordenadas final
        INT 10H
        COLOREAR 00110000B, 00D, 00D, 05D, 79D  ;Dar color al panel
        COLOREAR 00100000B, 06D, 00D, 24D, 79D  ;Dar color al panel  
        MOV CX,0000H ;Reiniciar el contador 
    
        ;------------------------------------------------------------ antena   
        Comparacion1:
            MOV ah, 02h   ;Posicionar el cursor
            MOV bh, 00h 
            MOV dh, y     ;Coordenadas para filas
            MOV dl, x     ;Coordenadas para columnas
            int 10h    
            MOV bx, cx    ;Almacenar contador (temporal)
                
            MOV CX,0000h  ;Se reinicia el contador
            XOR cx, cx
          
                Comparacion2:
                    MOV ah, 02h      ;Inicio de la impresion del *
                    MOV dl,ASTERISCO
                    INT 21h   
                    INC cl
                    CMP cl,aument    ;Comprara la cantidad de * con la que se declaro
                    JB Comparacion2  ;sino se ha cumplido regresa al mismo
      
                    MOV cx, bx       ;Extrae contador principal                 
                    INC y    
                    INC cl           ;Incrementar en 1 el contador cl    
                    CMP cl, ANTECH   ;Repetir 3 veces    
                    JB Comparacion1
        ;------------------------------------------------------------ 
        
        ;------------------------------------------------------------ techo   
        Comparacion3:
            MOV ah, 02h        
            MOV bh, 00h 
            MOV dh, y
            MOV dl, X1 ;Se declara una variable que tenga la ubicacion
            DEC x1 ;Con el decremento se disminuye una posicion      
            INT 10h    
            MOV bx, cx       
            XOR cx, cx
          
                Comparacion4: 
                    MOV ah, 02h  
                    MOV dl, ASTERISCO
                    INT 21h   
                    INC cl
                    CMP cl, aument2 ;Compara si se ha cumplido con la cantidad  
                    JB Comparacion4            
                      
                    MOV cx, bx              
                    INC y
                    ADD aument2, 2            
                    INC cl          ;Incrementa en 1 el contador cl    
                    CMP cl, ANTECH1 ;Repetir 3 VECES    
                    JB Comparacion3
          ;------------------------------------------------------------  
          
          ;------------------------------------------------------------ habitaciones   
          Comparacion5:
            MOV ah, 02h        
            MOV bh, 00h 
            MOV dh, y
            MOV dl, 37D ;Definir el punto de inicio      
            INT 10h    
            MOV bx, cx       
            XOR cx, cx
              
                Comparacion6: 
                    MOV ah, 02h  
                    MOV dl, ASTERISCO
                    INT 21h   
                    INC cl
                    CMP cl, aument3   
                    JB Comparacion6            
                      
                    MOV cx, bx              
                    INC y
                               
                    INC cl          ;Incrementa en 1 el contador cl    
                    cmp cl, CASA ;Repetir 7 veces    
                    JB Comparacion5
            
            MOV CX,0000H ;Reiniciar el contador
            
            MOV y, 0H     ;Coordenadas para filas
            MOV x, 28h     ;Coordenadas para columnas
            MOV X1, 37D
            MOV aument2, 7H 
            int 10h    
            MOV bx, cx    ;Almacenar contador (temporal)
                
            MOV CX,0000h  ;Se reinicia el contador
            XOR cx, cx
            
            PEDIRN DIGITO
            JMP MENU_PRINCIPAL
            
        RET
        CASAAST ENDP        
    ;---------------------------------------------------------------------------------------------+
     
    ;---------------------------------------------------------------------------------------------+
    ;CERRAR EL PROGRAMA
    opcion6:
        MOV AH, 4CH
        INT 21H
    jmp MENU_PRINCIPAL
    ret                
    ;---------------------------------------------------------------------------------------------+
    
    FIN:
        MOV AH, 4CH
        INT 21H 
    
CODIGO ENDS
END INICIO