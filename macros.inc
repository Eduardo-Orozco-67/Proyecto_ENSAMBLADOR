COLOREAR MACRO CC0, C1, C2, C3, C4
    ;Asignar colores
    MOV  AX, 0600H
    MOV BH, CC0; letra-fondo 
    MOV CH, C1 ;inicial abajo colum
    MOV CL, C2 ;inicial derecha
    MOV DH, C3 ;final abajo colum
    MOV DL, C4 ;final derecha
    INT 10H    
ENDM ;finalizar macros

;macros para imprimir y unicar cadena
 UBICCAD MACRO A1, A2, A3
    MOV AH, 02H
    MOV BH, 0H   ;indica la pagina
    MOV DH, A1  
    MOV DL, A2    
    INT 10H
    MOV AH,09H
    MOV DX, OFFSET A3
    INT 21H
 ENDM ;fin macro

;Funcion para limpiar pantalla
LIMPIAR MACRO LIM1
    MOV AH, 06H      
    MOV AL, 00H       
    MOV BH, LIM1      ;pantall-letra
    MOV CX, 0000H    
    MOV DX, 184fH    
    INT 10H
 ENDM ;fin macro

IMPRIMIR MACRO CADENA
MOV AH, 09H
MOV DX, CADENA
INT 21H
ENDM ;finalizar macros

PEDIRN MACRO DIGITO1
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV DIGITO1, AL		
ENDM ;finalizar macros
;el mov digito, al se agrega en el codigo

PEDIRS MACRO DIGITOS
    MOV AH, 01H
    INT 21H
    ;SUB AL, 30H
    MOV DIGITO1, AL		
ENDM ;finalizar macros
;el mov digito, al se agrega en el codigo

PEDIRNUMOP MACRO SOLCAD, SOLDIG
    MOV AH, 09H  
    LEA DX, SOLCAD
    INT 21H     
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV SOLDIG, AL
ENDM ;finalizar macros
;el mov digito, al se agrega en el codigo
