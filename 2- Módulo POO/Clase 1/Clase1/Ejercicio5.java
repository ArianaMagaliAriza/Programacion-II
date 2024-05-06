import java.util.Scanner; 
public class Ejercicio5
{
    //Método main//
    public static void main(String[]args)
    {
        //Paso 1: Declarar la variable vector de alturas
        double[]vector;
        //Paso 2: Declarar indice y promedio (iniciarlo)
        double promedio=0;
        int cantMasProm=0;
        int dimf=15;
        //Paso 3: Declarar y crear el scanner
        Scanner in = new Scanner(System.in);
        //Paso 4: Crear el vector para 15 valores
        vector= new double[dimf];
        //Paso 5: Ingresar 15 numeros, cargarlos en el vector, ir calculando la suma
        for(int i=0;i<dimf;i++){
            System.out.println("Ingrese una altura ("+ (i+1) +") :");
            vector[i]=in.nextDouble();
            promedio=promedio+vector[i];
        }
        //Paso 6: Calcular el promedio
        promedio=promedio/(dimf);
        System.out.println("La altura promedio es "+promedio);
        //Paso 7: Recorrer el vector, contar los números que son mayores que el promedio
        for(int j=0;j<dimf;j++){
            if (vector[j]>promedio);
              cantMasProm++;
        }
        System.out.println("La cantidad de Jugadores con altura mayor al promedio es "+ cantMasProm);
    }
}
