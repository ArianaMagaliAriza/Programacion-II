import java.lang.Math;
import java.util.Scanner;
public class mainTriangulo{
    public static void main(String[]args){
        Scanner in=new Scanner(System.in);
        Triangulo t= new Triangulo();
        System.out.println("Ingrese lado 1:");
        double l1= in.nextDouble();
        System.out.println("Ingrese lado 2:");
        double l2= in.nextDouble();
        System.out.println("Ingrese lado 3:");
        double l3= in.nextDouble();
        System.out.println("Ingrese color relleno:");
        String cr= in.next();
        System.out.println("Ingrese color linea:");
        String cl= in.next();
        t.setLado1(l1);
        t.setLado2(l2);
        t.setLado3(l3);
        t.setColorRelleno(cr);
        t.setColorLinea(cl);
        System.out.println("Area: "+t.calcularArea());
        System.out.println("Perimetro: "+t.calcularPerimetro());
        in.close();
    }
}
