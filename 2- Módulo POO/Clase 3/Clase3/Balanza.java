
public class Balanza{
    private double monto;
    private int cantItems;
    
    public void iniciarCompra(){
        monto=0;
        cantItems=0;
    }
    public void registrarProducto(double pesoEnKg,double precioPorKg){
        monto=monto+(pesoEnKg*precioPorKg);
        cantItems++;
    }
    public double devolverMontoAPagar(){
        return monto;
        
    }
    public void devolverResumenDeCompra(){
         System.out.println("Total a pagar "+monto+" por "+cantItems+" productos");
        
    }
}
