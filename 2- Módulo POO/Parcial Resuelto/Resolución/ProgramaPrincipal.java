import java.util.Scanner;

public class ProgramaPrincipal{
    public static void main(){
        Scanner in = new Scanner(System.in);
        MateriaAprobada[] v=new MateriaAprobada[5];
        
        Alumno a= new Alumno (3443,"Pablo Estrada");
        MateriaAprobada m;
        m= new Cursada("I102","primero",a);
        v[0]=m;
        
        a= new Alumno (3443,"Maria Gonzalez");
        Cursada c= new Cursada ("I102","segundo",a);
        for (int i=0;i<5;i++){
            System.out.println("Ingrese la nota de la autoevaluación nro "+(i+1)+":");
            double n=in.nextDouble();
            c.cargarNota(n,i);
        }
        m=c;
        v[1]=c;
        
        a= new Alumno (3443,"Luca Lopez");
        m= new Final("I102","primero",a,true,5,"12/06/2021");
        v[2]=m;
        
        a= new Alumno (3443,"Ana Martinez");
        m= new Final("I102","primero",a,false,5,"17/09/2022");
        v[3]=m;
        
        a= new Alumno (3443,"Lucia Diaz");
        m= new Final("I102","primero",a,false,5,"20/07/2021");
        v[4]=m;
        for (int i=0;i<5;i++){
            System.out.println(v[i].calcularPromedio());
        }
        for (int i=0;i<5;i++){
            System.out.println(v[i].toString());
        }
        in.close();
         }
        
    }
