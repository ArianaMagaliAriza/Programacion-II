import java.util.Scanner;
public class mainPersona{
    final static int dimf=3;
    
    public static void main(String[] args){
       Scanner in= new Scanner(System.in);
       Persona[]vector;
       vector= new Persona[dimf];
       for(int i=0;i<=dimf;i++){
         System.out.println("Ingrese nombre:");
         String nombre=in.next();
         System.out.println("Ingrese dni:");
         int dni= in.nextInt();
         System.out.println("Ingrese edad:");
         int edad= in.nextInt();
         vector[i]= new Persona(nombre,dni,edad);
         System.out.println(vector[i].toString());
       }
       System.out.println("La cantidad de personas mayores de 65 es "+mayores65(vector));
       System.out.println("Representación de persona con menor DNI: "+menorDNI(vector));
       in.close();
    }
   
    public static int mayores65(Persona[]vector){
       int cant=0;
       for(int i=0;i<dimf;i++){
           if(vector[i].getEdad()>65)
             cant++;
       }
       return cant;
    }
   
    public static String menorDNI(Persona[]vector){
       int min=99999999;
       String menorPersona="";
       for(int i=0;i<dimf;i++){
           if(vector[i].getDNI()<min){
             min=vector[i].getDNI();
             menorPersona=vector[i].toString();
           }
       }
       return menorPersona;
    }
}
