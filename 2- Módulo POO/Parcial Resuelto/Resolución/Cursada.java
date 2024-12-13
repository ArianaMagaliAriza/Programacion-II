
public class Cursada extends MateriaAprobada{
    private double [] autoevalu;
    private int diml;
    
    public Cursada(String cod,String semestre,Alumno alumno){
        super(cod,semestre,alumno);
        this.autoevalu= new double[8];
        this.diml=0;
    }
    
    public int getDiml(){
        return diml;
    }
    
    public void cargarNota(double nota,int i){
        boolean aux=true;
        if(diml>=8) aux=false;
        if(aux){
          autoevalu[i]=nota;
          diml++;
        }
    }
    
    public double calcularPromedio(){
        double aux;
        if (diml<=4)
          aux=4;
        else {
          aux=0;
          for(int i=0;i<diml;i++)
             aux=aux+autoevalu[i];
          aux=aux/diml;
        }
        return aux;
    }
    //public String toString(){
       // return (super.toString()+" "+calcularPromedio());
    //}
    
}
