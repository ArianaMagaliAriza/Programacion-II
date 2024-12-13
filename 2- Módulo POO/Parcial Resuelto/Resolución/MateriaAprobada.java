
public abstract class MateriaAprobada{
    private String cod;
    private String semestre;
    private Alumno alumno;
    private NóminaDeMateriasIC n;
    
    public MateriaAprobada(String cod,String semestre,Alumno alumno)
    {  this.cod=cod;
       this.semestre=semestre;
       this.alumno=alumno;
    }
    public String getSemestre(){
        return semestre;
    }
    public abstract double calcularPromedio();
    public String toString(){
        return n.obtenerNombre(cod)+"("+cod+")"+" "+semestre+" "+alumno.toString();
    }
    
}
