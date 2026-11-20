Algoritmo buscaminas
	definir filas, columnas , minas, tablero, seleccion Como Entero
	
	definir fila , columna Como Entero
	definir minasColocadas , contador Como Entero
	
	fila = 8
	columnas = 8 
	Dimension tablero[8,8]
	Repetir
		Escribir "=============================================="
		Escribir "                 BUSCAMINAS                   "
		Escribir "=============================================="
		Escribir "1.Facil   (8x8   - 10 minas" 
		Escribir "2.medio   (16x30 - 50 minas"
		Escribir "3.dificil   (16x30 - 99 minas"
		Escribir "______________________________________________"
		Escribir Sin Saltar "elige una opcion: "
		leer seleccion
		
		Segun seleccion Hacer
			1:
				filas =8
				columnas = 8
				minas = 10
			2:
				filas =16
				columnas =30
				minas = 50
			3:
				filas =16
				columnas =30
				minas = 99
			De Otro Modo:
				Escribir "opcion no valida , elige otra."
		FinSegun
	Hasta Que seleccion >= 1 && seleccion <=3
	
	Redimensionar tablero[filas,columnas]
	
	para i = 1 Hasta filas Hacer
		para j = 1 Hasta columnas Hacer
			tablero[i,j]=0
		FinPara
	FinPara
	
	Mientras minasColocadas < minas Hacer
		fila = Aleatorio(1, filas)
		columna = Aleatorio(1, columnas)
		
		si tablero[fila, columna] != -1 Entonces
			tablero[fila,columna] = -1
			minasColocadas = minasColocadas + 1
		FinSi
	FinMientras
	
	para i = 1 Hasta filas Hacer
		para j = 1 Hasta columnas Hacer
			
			//solo se procesara celdas vacias
			si tablero[i,j]=0 Entonces
				contador=0
				
				para k = i - 1 Hasta i + 1 Hacer
					para l = j - 1 Hasta j + 1 Hacer
						
						//verifican posicion
						si k>=1 && k<= filas && l >= 1 && l <= columnas Entonces
							si tablero[k,l] = -1 Entonces
								contador = contador + 1
							FinSi
						FinSi
						
					FinPara
				FinPara
				tablero[i,j] =  contador
			FinSi
			
		FinPara
	FinPara
	
	Escribir ""
	Escribir "========== TABLERO GENERADO =========="
	
	para i = 1 hasta filas Hacer
		para j = 1 hasta columnas Hacer
			
			si tablero[i,j] = - 1 Entonces
				Escribir Sin Saltar " -1 "
			SiNo
				si tablero[i, j ] < 10 Entonces
					Escribir Sin Saltar "  " , tablero[i,j], " "
				sino 
					Escribir Sin Saltar " " , tablero[i,j] , " "
				FinSi
			FinSi 
			
		FinPara
		Escribir "";
	FinPara
	
	Escribir "================================="
FinAlgoritmo
