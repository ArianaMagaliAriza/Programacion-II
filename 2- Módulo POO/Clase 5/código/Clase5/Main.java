import java.util.Scanner;
public  class Main{
    public static void main(String[]args){
    Scanner in=new Scanner(System.in);
    Jugador j=new Jugador("jose",498,26,600,20,28);
    Entrenador en=new Entrenador("mario",567,32,500,16);
    System.out.println(j.toString());
    System.out.println(en.toString());
    in.close();
  }
}
