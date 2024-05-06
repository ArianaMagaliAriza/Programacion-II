
import java.util.Scanner;
public class Ejercicio2
{
     public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        
        int cantAutos=0;
        int Permitidos=0;
        int NoPermitidos=0;
        System.out.println("Ingrese una patente:");
        int p=in.nextInt();
        while(p!=0){
         cantAutos++;  
         int aux=p;
         aux=aux%2;
         if(aux==0){
             System.out.println("Tiene permitido pasar");
             Permitidos++;
          }
         else
             System.out.println("No tiene permitido pasar");
         System.out.println("Ingrese una patente:");
         p=in.nextInt();
    }
    double porcentaje=(Permitidos*100)/cantAutos;
    System.out.println("El porcentaje de autos ingresados es "+ porcentaje);
    in.close();
  }
}
