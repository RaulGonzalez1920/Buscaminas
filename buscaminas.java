import java.util.Random;
public class buscaminas {
    public static void main(String[] args) {
        int filas = 8;
        int columnas = 8;
        int minas = 0;
        int [][] tablero = new int[8][8];
        int seleccion;

        do {
            IO.println("================================");
            IO.println("        BUSCAMINAS              ");
            IO.println("================================");
            IO.println("1. facil   (8x8   - 10 minas)");
            IO.println("2. medio   (16x30 - 50 minas)");
            IO.println("3. dificil (16x30 - 99 minas)");
            IO.println("================================");

            seleccion =0;
            String entrada = IO.readln("elige una opcion: ");
            if (entrada != null){
                try {
                    seleccion = Integer.parseInt(entrada.trim());
                } catch (NumberFormatException e) {
                    seleccion = 0;

                }
            }

            switch (seleccion) {
                case 1:{
                    filas = 8;
                    columnas = 8;
                    minas = 10;
                    break;
                }
                case 2:{
                    filas = 16;
                    columnas = 30;
                    minas = 50;
                    break;
                }
                case 3:{
                    filas = 16;
                    columnas = 30;
                    minas = 99;
                    break;
                }
                default:
                    IO.println("Opcion no valida");
            }

        }while (seleccion < 1 || seleccion > 3);

        tablero = new int[filas][columnas];

        Random random = new Random();
        int minasColocadas = 0;

        while (minasColocadas < minas) {
            int fila = random.nextInt(filas);
            int columna = random.nextInt(columnas);

            if (tablero[fila][columna] != -1) {
                tablero[fila][columna] = -1; // Coloca una mina
                minasColocadas++;
            }
        }


        for (int i = 0; i < filas; i++){
            for (int j = 0; j < columnas; j++){
                if (tablero[i][j] == 0) {
                    int contador =0;

                    for (int di = i - 1; di <= i + 1; di++) {
                        for (int dj = j - 1; dj <= j + 1; dj++) {
                            if (di >= 0 && di < filas && dj >= 0 && dj < columnas && tablero[di][dj] == -1) {
                                    contador++;
                            }
                        }
                    }

                    tablero[i][j] = contador;
                } 
            }
        }

        IO.println();
        IO.println("===========Tablero generado==========");

        for (int i = 0; i < filas; i++){
            for (int j = 0; j < columnas; j++){
                IO.print("%3d ".formatted(tablero[i][j]));
            
            }
            IO.println();
        }

        IO.println("====================================");



    }
}