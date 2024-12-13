import java.util.HashMap; 
import java.util.Map;
/**
 * Write a description of class NóminaDeMateriasIC here.
 * 
 * @author (Leandro Romanut) 
 * @version (1.0)
 */
public class NóminaDeMateriasIC
{
     
    public NóminaDeMateriasIC()
    {

    }

    /**
     * Método para saber si un grupo familiar puede acceder, o no, a un subsidio
     * 
     * @params ingresos del grupo familiar y región
     * @return verdadero o falso
     */
    public static String obtenerNombre(String codigo)
    {
        
        Map<String, String> map = new HashMap<String, String>();
        
        map.put("F0301", "Matemática A");
        map.put("I101", "Programación I");
        map.put("U0902", "Química");
        map.put("F302", "Matemática B");
        map.put("I102", "Programación II");
        map.put("M0670", "Sistemas de Representación C");
        map.put("F0316", "Física I");
        map.put("I103", "Programación III");
        map.put("I104", "Taller de Lenguajes I");
        map.put("I105", "Conceptos de Arquitectura de Computadoras");
        map.put("F304", "Matemática C");
        map.put("F317", "Física II");
        map.put("I106", "Conceptos de Sistemas Operativos");
        map.put("I107", "Taller de Lenguajes II");
        map.put("F0312", "Probabilidades");
        map.put("F0310", "Matemática D1");
        map.put("E0282", "Electrotecnia y Electrónica");
        map.put("I108", "Conceptos de Bases de Datos");
        map.put("E0301", "Introducción al Diseño Lógico");
        map.put("F0307", "Estadística");
        map.put("E0302", "Introducción al Procesamiento de Señales");
        map.put("I109", "Taller de Arquitectura");
        map.put("I110", "Ingeniería de Software");
        map.put("E0303", "Redes de Datos I");
        map.put("I111", "Concurrencia y Paralelismo");
        map.put("E0304", "Instrumentación y Control");
        map.put("I112", "Bases de Datos");
        map.put("E0305", "Circuitos Digitales y Microcontroladores");
        map.put("I113", "Economía y Emprendedorismo");
        map.put("I114", "Redes de Datos II");
        map.put("I115", "Sistemas de Tiempo Real");
        map.put("E0306", "Taller de Proyecto I");
        map.put("I116", "Sistemas Distribuidos y Paralelos");
        map.put("I117", "Aspectos Legales de Ingeniería Informática");
        map.put("I118", "Taller de Proyecto II");
        map.put("S0012", "Seminario de Redacción de Textos Profesionales");
        map.put("E0228", "Práctica Profesional Supervisada");
        map.put("INFIN", "Inglés");
        
        return map.get(codigo);
    }
}
