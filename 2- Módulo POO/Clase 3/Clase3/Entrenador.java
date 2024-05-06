public class Entrenador {
    private String nombre;
    private int DNI;
    private int edad;
    private double sueldo;
    private int cantGanados; 
    
    public Entrenador(String unNombre, double unSueldo, int cant){
        nombre = unNombre;
        sueldo = unSueldo;
        cantGanados = cant; 
    }
    
    public Entrenador(){
     
    }
    
    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }
    
    public double getSueldo() {
        return sueldo;
    }

    public int getCantGanados() {
        return cantGanados;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }
    
    public void setSueldo(double unSueldo) {
        sueldo = unSueldo;
    }

    public void setCantGanados(int cant) {
        cantGanados = cant;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    public double calcularSueldoACobrar(){
        double sueldoF=sueldo;
        if(cantGanados>=1 && cantGanados<=4)
          sueldoF=sueldoF+5000;
        else if(cantGanados>=5 && cantGanados<=10)
          sueldoF=sueldoF+30000;
        else if(cantGanados>10)
          sueldoF=sueldoF+50000;
        return sueldoF;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
    
    
    
    
}
