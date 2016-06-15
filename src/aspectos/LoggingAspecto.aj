package aspectos;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Date;

public aspect LoggingAspecto {
	pointcut gravarLogin(String registro) : call(* negocios.ControladorLogging.registrarLogin(..)) && args(registro);
	pointcut gravarTreino(String registro) : call(* negocios.ControladorLogging.registrarTreino(..)) && args(registro);
	pointcut gravarPersistencia(String registro) : call(* negocios.ControladorLogging.registrarPersistencia(..)) && args(registro);
	pointcut gravarAula(String registro) : call(* negocios.ControladorLogging.registrarAula(..)) && args(registro);
	
	after(String gravar) : gravarLogin(gravar){
    	 
    	 try{
	    	 FileWriter fw = new FileWriter("login.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write( gravar +" - Fez Login no Sistema - "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
    	 
    	 }catch(Exception e){
    		 
    		 System.out.println(e.getMessage());
    	 }
    }
	
	after(String gravar) : gravarAula(gravar){
   	 
   	 try{
	    	 FileWriter fw = new FileWriter("aula.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write( gravar +" - Aula criada no Sistema - "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
   	 
   	 }catch(Exception e){
   		 
   		 System.out.println(e.getMessage());
   	 }
   }
     
}
