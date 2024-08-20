import java.util.Scanner;
public class mainFlotas
{
    public static void main(String[]args){
        Scanner in=new Scanner(System.in);
        Flota f1= new Flota();
        System.out.println("Ingrese una patente");
        String p=in.next();
        System.out.println("Ingrese un destino");
        String d=in.next();
        while(!(p.equals("ZZZ000"))&&(f1.FlotaCompleta()==false)){
            Micro m = new Micro(p, d, "05:00");
            f1.agregarMicro(m);
            System.out.println("Ingrese una patente");
            p=in.next();
            System.out.println("Ingrese un destino");
            d=in.next();
        }
        System.out.println("Ingrese una patente a borrar");
        p=in.next();
        if(f1.buscarMicroPorPatente(p)!=null){
            f1.eliminarMicro(p);
            System.out.println("El micro con patente "+p+" fue borrado");
        }else
            System.out.println("El micro con patente "+p+" no se encontro en la flota");
        System.out.println("Ingrese un destino a comprobar");
        d=in.next();
        if(f1.buscarMicroPorDestino(d)!=null)
            System.out.println("El micro que va a "+d+" tiene la patente "+f1.buscarMicroPorDestino(d).getPatente()+" y hora de salida "+f1.buscarMicroPorDestino(d).getHoraSalida());
        else
            System.out.println("No se encontro un micro en la flota con destino a "+ d);
    }
}
