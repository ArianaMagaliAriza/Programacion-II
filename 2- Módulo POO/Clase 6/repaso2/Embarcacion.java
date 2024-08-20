
public class Embarcacion extends Vehiculo
{
    private String REY;
    private String nombre;
    private String tipo;
    private double eslora;
    private double tonelaje;
    private double valor;
    public Embarcacion(int año,double importe,Propietario propietario,String nombre, String REY, String tipo, double eslora, double tonelaje, double valor){
        super(año,importe,propietario);
        this.REY=REY;
        this.nombre=nombre;
        this.tipo=tipo;
        this.eslora=eslora;
        this.tonelaje=tonelaje;
        this.valor=valor;
    }
    public String getREY(){
        return REY;
    }
    public String getNombre(){
        return nombre;
    }
    public String getTipo(){
        return tipo;
    }
    public double getEslora(){
        return eslora;
    }
    public double getTonelaje(){
        return tonelaje;
    }
    public double getValor(){
        return valor;
    }
    public void setREY(String REY){
        this.REY=REY;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setTipo(String tipo){
        this.tipo=tipo;
    }
    public void setEslora(double eslora){
        this.eslora=eslora;
    }
    public void setTonelaje(double tonelaje){
        this.tonelaje=tonelaje;
    }
    public void setValor(double valor){
        this.valor=valor;
    }
    public double calcularImpuesto(){
        double aux;
        if(valor<6000)
            aux=valor*0.04;
        else if((valor>=6000)&&(valor<180000))
            aux=valor*0.02;
        else
            aux=valor*0.05;
        return aux;
    }
}