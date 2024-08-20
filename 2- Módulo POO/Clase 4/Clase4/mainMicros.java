import java.util.Scanner;
public class mainMicros
{
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        Micro m1= new Micro("ABC123", "Mar del Plata", "5:00 am");
        System.out.println("Ingrese el numero de asiento");
        int asiento = in.nextInt();
        while((asiento!=-1)&&(m1.MicroLleno()==false))
        {
            if(m1.validarAsiento(asiento)){
                if(!m1.estadoAsiento(asiento)){
                    m1.OcuparAsiento(asiento);
                    System.out.println("Exito en la operacion");
                }
                else{
                    System.out.println("El asiento esta ocupado");
                    System.out.println("El priner asiento libre es el "+(m1.primerLibre()+1));
                }
            }  
            System.out.println("Ingrese el numero de asiento");
            asiento = in.nextInt();
        }
        System.out.println("La cantidad de asientos ocupados son "+ m1.Ocupados());
    }
}
