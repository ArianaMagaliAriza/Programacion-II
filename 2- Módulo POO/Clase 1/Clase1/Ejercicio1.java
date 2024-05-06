
import java.util.Scanner; 
public class Ejercicio1
{
    public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        
        System.out.println("Ingrese un lado:");
        double a=in.nextDouble();
        System.out.println("Ingrese un lado:");
        double b=in.nextDouble();
        System.out.println("Ingrese un lado:");
        double c=in.nextDouble();
        if(a < b + c && b < a + c && c < a + b)
           System.out.println("El perimetro es "+(a+b+c));
        in.close();
  }
}