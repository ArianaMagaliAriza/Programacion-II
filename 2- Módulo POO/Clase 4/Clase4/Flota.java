public class Flota
{
    final int dimfF=15;
    private int diml;
    private Micro[] flota;
    
    public Flota(){
        diml=0;
        flota= new Micro[dimfF];
        for(int i=0; i<dimfF; i++){
            flota[i]=null;
        }
    }
    public boolean FlotaCompleta(){
        boolean aux=true;
        int i=0;
        while((i<dimfF)&&(aux)){
            if(flota[i]==null)
                aux=false;
            i++;
        }
        return aux;
    }
    public void agregarMicro(Micro unMicro){
        for(int i=0; i<diml; i++){
            if (flota[i]==null){
                flota[i]=unMicro;
                break;
            }
        }
        diml++;
    }
    public void eliminarMicro(String p){
        for (int i=0; i<diml; i++){
            if(flota[i].getPatente().equals(p)){
                flota[i]=null;
                diml--;
            }
        }
    }
    public Micro buscarMicroPorPatente(String p){
        Micro aux=null;
        for(int i=0; i<diml; i++){
            if(flota[i]!=null){
                if(flota[i].getPatente().equals(p))
                    aux=flota[i];
            }
        }
        return aux;
    }
    public Micro buscarMicroPorDestino(String d){
        Micro aux=null;
        for(int i=0; i<diml; i++){
            if(flota[i]!=null){
                if(flota[i].getDestino().equals(d))
                    aux=flota[i];
            }
        }
        return aux;
    }
}
