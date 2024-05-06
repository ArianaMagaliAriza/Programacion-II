import java.util.Scanner; 
public class Ejercicio6{
     public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        int[][]matriz;
        int[]vector;
        int dimf=10;
        matriz=new int[dimf][dimf];
        vector= new int[dimf];
        int pos=0;
        for(int f=0;f<dimf;f++){
            for(int c=0;c<dimf;c++){
                matriz[f][c]=pos;
                pos=pos+2;
                System.out.println("["+f+"]"+"["+c+"]= "+ matriz[f][c]);
            }
            System.out.println("");
        }
        
        int sumaFilas=0;
        for(int f=2;f<=9;f++){
            for(int c=0;c<dimf;c++){
                sumaFilas= sumaFilas+matriz[f][c];
            }
        }
        System.out.println("Suma de filas(2 a 9): "+ sumaFilas);

        int sumaColumnas=0;
        for(int c=0;c<=3;c++){
            for(int f=0;f<dimf;f++){
                sumaColumnas= sumaColumnas+matriz[f][c];
            }
        }
        System.out.println("Suma de columnas(0 a 3): "+ sumaColumnas);
        
        sumaColumnas=0;
        for(int c=0;c<dimf;c++){
            for(int f=0;f<dimf;f++){
                sumaColumnas= sumaColumnas+matriz[f][c];
            }
            vector[c]=sumaColumnas;
            sumaColumnas=0;
        }
        
        for(int i=0;i<dimf;i++)
           System.out.println("Suma de columna "+i+": "+vector[i]);
           
        System.out.println("Ingrese un número:");
        int n=in.nextInt();
        boolean NoEncontre=true;
        int f=0;
        int c=0;
        while((NoEncontre) && (f<dimf)){
            while((NoEncontre) && (c<dimf)){
                if(n == matriz[f][c]){
                     NoEncontre=false;
                     System.out.println("El número "+n+" se encuentra en la posición:["+f+"]"+"["+c+"]");
                     }
                c++;
            }
            
            if(NoEncontre){
              c=0;
              f++;   
            }
        }
        if(NoEncontre)
          System.out.println("No se encontró el elemento");
        in.close();
       }
    }