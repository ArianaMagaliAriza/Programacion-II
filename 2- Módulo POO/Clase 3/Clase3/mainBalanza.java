import java.util.Scanner;
public class mainBalanza{
    public static void main(String[] args){
      Scanner in=new Scanner(System.in);
      Balanza b=new Balanza();
      System.out.println("Ingrese un peso en Kg: ");
      double peso= in.nextDouble();
      while(peso!=0){
        System.out.println("Ingrese el precio por Kg: ");
        double precio= in.nextDouble();
        b.registrarProducto(peso,precio);  
        System.out.println("Ingrese un peso en Kg: ");
        peso= in.nextDouble();
        }
      b.devolverResumenDeCompra();  
      in.close();    
    }
}