import java.util.Scanner; 
public class Ejercicio4
{
    public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        for(int i=1;i<=9;i++){
            int n=i;
            int factorial=1;
            while(n>0){
            factorial=factorial*n;
            n--;
              };
          if(i%2 != 0 ) 
            System.out.println(i +"!: "+ factorial);
        }
        in.close();
    }
}