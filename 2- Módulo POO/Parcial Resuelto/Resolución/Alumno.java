
public class Alumno
{ 
    private int legajo;
    private String NomApe;
    
    public Alumno(int legajo,String NomApe){
        this.NomApe=NomApe;
        this.legajo=legajo;
        
    }
    
    
    public String toString(){
        return (legajo+" "+NomApe);
    }
    //semestre-->string
    //categoria-->numero
    
    }
