import java.util.Scanner;
public class ProgramaArba{
    final static int cantv=1;
    public static Propietario LeerPropietario(){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el nombre del propietario");
        String nom = in.next();
        System.out.println("Ingrese el apellido del propietario");
        String ap = in.next();
        System.out.println("Ingrese el CIT del propietario");
        int cit = in.nextInt(); 
        in.close();
        Propietario p =new Propietario(nom, ap, cit);
        return p;
    }
    public static Vehiculo LeerVehiculo(){
        Scanner in = new Scanner(System.in);
        Vehiculo v = null;
        System.out.println("Ingrese propietario");
        Propietario p= new Propietario();
        p=LeerPropietario();
        System.out.println("Ingrese año");
        int a=in.nextInt();
        System.out.println("Ingrese importe");
        int i=in.nextInt();
        System.out.println("Ingrese el tipo de vehiculo (Auto/Embarcacion)");
        String op = in.next();
        if(op.equals("Auto")){
            System.out.println("Ingrese patente");
            int pat=in.nextInt();
            System.out.println("Ingrese importe adicional");
            double imp=in.nextDouble();
            System.out.println("Ingrese descripcion");
            String desc=in.next();
            v= new Automotor(a,i,p,pat,imp,desc);
        }
        else if(op.equals("Embarcacion")){
            System.out.println("Ingrese REY");
            String rey=in.next();
            System.out.println("Ingrese nombre");
            String nom=in.next();
            System.out.println("Ingrese tipo de embarcacion");
            String tipo=in.next();
            System.out.println("Ingrese eslora");
            double e=in.nextDouble();
            System.out.println("Ingrese tonelaje");
            double ton=in.nextDouble();
            System.out.println("Ingrese valor");
            double valor=in.nextDouble();
            v= new Embarcacion(a,i,p,rey, nom, tipo, e, ton, valor);
        }
        in.close();
        return v;
    }
    public static void main(String[]args){
        Vehiculo[] vector = new Vehiculo[cantv];
        for(int i=0;i<cantv;i++){
            vector[i]=LeerVehiculo();
        }
    }
}