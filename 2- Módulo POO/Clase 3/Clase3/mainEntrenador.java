import java.util.Scanner;
public class mainEntrenador{
    public static void main(){
       Scanner in= new Scanner(System.in);
       System.out.println("Ingese nombre:");
       String nombre=in.next();
       System.out.println("Ingese sueldo:");
       double sueldo=in.nextDouble();
       System.out.println("Ingese cant:");
       int cant=in.nextInt();
       Entrenador e= new Entrenador(nombre,sueldo,cant);
       System.out.println("El sueldo a cobrar es "+e.calcularSueldoACobrar());
       System.out.println(e.toString());
       in.close();
    }
}
