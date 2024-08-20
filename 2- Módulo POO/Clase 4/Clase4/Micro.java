public class Micro
{
    final int dimfM=20;
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean[] asientos;
    private int ocupados;
    
    public Micro(String patente, String destino, String horaSalida){
        this.patente=patente;
        this.destino=destino;
        this.horaSalida=horaSalida;
        asientos = new boolean[dimfM];
        for (int i=0; i<dimfM; i++){
            asientos[i]=false;
        }
        ocupados=0;
    }
    
    public void setPatente(String patente){
        this.patente=patente;
    }
    public void setDestino(String destino){
        this.destino=destino;
    }
    public void setHoraSalida(String horaSalida){
        this.horaSalida=horaSalida;
    }
    public String getPatente(){
        return patente;
    }
    public String getDestino(){
        return destino;
    }
    public String getHoraSalida(){
        return horaSalida;
    }
    
    public int Ocupados(){
        return ocupados;
    }
    public boolean MicroLleno(){
        boolean aux=false;
        if (ocupados==dimfM){
            aux=true;
        }
        return aux;
    }
    public boolean validarAsiento(int unAsiento){
        boolean aux=true;
        if(unAsiento<0){
            aux=false;
        }
        else if(unAsiento>dimfM){
            aux=false;
        }
        return aux;
    }
    public boolean estadoAsiento(int unAsiento){
        return asientos[unAsiento];
    }
    public void OcuparAsiento(int unAsiento){
        asientos[unAsiento]=true;
        ocupados++;
    }
    public void LiberarAsiento(int unAsiento){
        asientos[unAsiento]=false;
        ocupados--;
    }
    public int primerLibre(){
        int i=0;
        int aux=0;
        boolean encontre=false;
        while((i<dimfM)&&(!encontre)){
            if(asientos[i]==false){
                aux=i;
                encontre=true;
            }    
            else 
              i++;
        }
        return aux;
    }
}
