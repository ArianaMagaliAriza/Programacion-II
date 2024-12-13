
public class Final extends MateriaAprobada{   
    private boolean promo;
    private double nota;
    private String fecha;
  
    public Final(String cod,String semestre,Alumno alumno,boolean promo,double nota,String fecha){
       super(cod,semestre,alumno);
       this.promo=promo;
       this.nota=nota;
       this.fecha=fecha;
    }
    public double calcularPromedio(){
        double aux=nota;
        if(promo)
          aux=aux+2;
        else {
        if(super.getSemestre().equals("primero")){
            if(fecha.compareTo("15/08/2022")==0  || fecha.compareTo("17/09/2022")==0)
                   aux=aux+1;
                }
        else if(super.getSemestre().equals("segundo")){
            if((fecha.compareTo("15/02/2023")== 0) || (fecha.compareTo("17/03/2023")==0))
                   aux=aux+1;
        }
        }
        return aux;
    }
    //public String toString(){
      //  return (super.toString()+" ");
    //}
}
