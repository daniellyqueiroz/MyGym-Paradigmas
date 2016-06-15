package aspectos;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Date;

public aspect LoggingAspecto {
	pointcut registrarLogin(String registro) : call(* negocios.ControladorLogging.registrarLogin(..)) && args(registro);
	pointcut registrarTreino(String registro) : call(* negocios.ControladorLogging.registrarTreino(..)) && args(registro);
	pointcut registrarPersistencia(String registro) : call(* negocios.ControladorLogging.registrarPersistencia(..)) && args(registro);
	pointcut registrarAula(String registro) : call(* negocios.ControladorLogging.registrarAula(..)) && args(registro);
	
	after(String registro) : registrarLogin(registro){
    	 
    	 try{
	    	 FileWriter fw = new FileWriter("login.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write( registro +" - Realizou Login no Sistema - "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
    	 
    	 }catch(Exception e){
    		 
    		 System.out.println(e.getMessage());
    	 }
    }
     
}
