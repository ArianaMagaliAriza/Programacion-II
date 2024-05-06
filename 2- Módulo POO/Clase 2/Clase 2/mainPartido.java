import java.util.Scanner;
public class mainPartido{
    final static int partidos = 2;

    public static void main(String[] args) {
        Partido[] vector = new Partido[partidos];
        for (int i = 0; i < partidos; i++) {
            Scanner in = new Scanner(System.in);
            System.out.println("Ingrese equipo local");
            String local = in.next();
            System.out.println("Ingrese equipo visitante");
            String visitante = in.next();
            System.out.println("Ingrese goles del equipo local");
            int golesL = in.nextInt();
            System.out.println("Ingrese goles del equipo visitante");
            int golesV = in.nextInt();
            vector[i] = new Partido(local, visitante, golesL, golesV);
            in.close();
        }
        System.out.println("River ganó " + ganoRiver(vector)+" partidos");
        System.out.println("En total goles que Boca hizo de local son " + golesLocalBoca(vector) + " goles");
        System.out.println("El porcentaje de partidos empatados es " + porcentajeEmpates(vector));
    }
    
    public static int ganoRiver(Partido[] vector) {
        int cant = 0;
        for (int i = 0; i < partidos; i++) {
            if (vector[i].getGanador().equals("River")) {
                cant++;
            }
        }
        return cant;
    }

    public static int golesLocalBoca(Partido[] vector) {
        int cant = 0;
        for (int i = 0; i < partidos; i++) {
            if (vector[i].getLocal().equals("Boca"))
                cant = cant + vector[i].getGolesLocal();
        }
        return cant;
    }

    public static double porcentajeEmpates(Partido[] vector) {
        int empates = 0;
        for (int i = 0; i < partidos; i++) {
            if (vector[i].hayEmpate())
                empates++;
        }
        double porcentaje=(empates / partidos) * 100;
        return porcentaje;
    }
}
