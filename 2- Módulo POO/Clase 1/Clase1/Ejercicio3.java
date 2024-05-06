
import java.util.Scanner; 
public class Ejercicio3{
    public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese un número:");
        int n=in.nextInt();
        int aux=n;
        int factorial=1;
        while(aux>0){
            factorial=factorial*aux;
            aux--;
        } 
        System.out.println(n +"!: "+ factorial);
        in.close();
        }
    }