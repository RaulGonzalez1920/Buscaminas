
import random

filas = 8
columnas = 8
minas = 0
seleccion = 0

while seleccion < 1 or seleccion > 3:
    print("================================")
    print("          BUSCAMINAS            ")
    print("================================")
    print("1. Facil   (8x8   - 10 minas)")
    print("2. Medio   (16x30 - 50 minas)")
    print("3. Dificil (16x30 - 99 minas)")
    print("================================")

    seleccion = int(input("Elige una opcion: "))

    if seleccion == 1:
        filas = 8
        columnas = 8
        minas = 10

    elif seleccion == 2:
        filas = 16
        columnas = 30
        minas = 50

    elif seleccion == 3:
        filas = 16
        columnas = 30
        minas = 99

    else:
        print("Opcion no valida, elige otra.")
        seleccion = 0


tablero = []

for i in range(filas):
    fila = []
    for j in range(columnas):
        fila.append(0)
    tablero.append(fila)


minasColocadas = 0

while minasColocadas < minas:
    fila = random.randint(0, filas - 1)
    columna = random.randint(0, columnas - 1)

    if tablero[fila][columna] != -1:
        tablero[fila][columna] = -1
        minasColocadas = minasColocadas + 1


for i in range(filas):
    for j in range(columnas):

        if tablero[i][j] == 0:
            contador = 0

            for k in range(i - 1, i + 2):
                for l in range(j - 1, j + 2):

                    if k >= 0 and k < filas and l >= 0 and l < columnas:
                        if tablero[k][l] == -1:
                            contador = contador + 1

            tablero[i][j] = contador


print()
print("========== TABLERO GENERADO ==========")

for i in range(filas):
    for j in range(columnas):

        if tablero[i][j] == -1:
            print(" -1 ", end="")

        elif tablero[i][j] < 10:
            print("  " + str(tablero[i][j]) + " ", end="")

        else:
            print(" " + str(tablero[i][j]) + " ", end="")

    print()

print("=====================================")
