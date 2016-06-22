package aspectos;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Date;

public aspect LoggingAspecto {
	pointcut gravarLogin(String registro) : call(* negocios.ControladorLogging.gravarLogin(..)) && args(registro);
	pointcut gravarTreino(String registro) : call(* negocios.ControladorLogging.gravarTreino(..)) && args(registro);
	pointcut gravarPersistencia(String registro) : call(* negocios.ControladorLogging.gravarPersistencia(..)) && args(registro);
	pointcut gravarAula(String registro) : call(* negocios.ControladorLogging.gravarAula(..)) && args(registro);
	pointcut gravarRemocaoCliente(String registro) : call(* negocios.ControladorLogging.gravarRemocaoCliente(..)) && args(registro);
	
	after(String gravar) returning: gravarLogin(gravar){// AFTER RETURN
    	 
    	 try{
	    	 FileWriter fw = new FileWriter("RegistroLogin.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write( gravar +" - Fez Login no Sistema - "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
    	 
    	 }catch(Exception e){
    		 
    		 System.out.println(e.getMessage());
    	 }
    }
	
	after(String gravar) returning: gravarAula(gravar){
   	 
   	 try{
	    	 FileWriter fw = new FileWriter("RegistroAula.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write( gravar +" - Aula criada no Sistema - "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
   	 
   	 }catch(Exception e){
   		 
   		 System.out.println(e.getMessage());
   	 }
   }
     
	after(String gravar) returning: gravarTreino(gravar){
	   	 
	   	 try{
		    	 FileWriter fw = new FileWriter("RegistroTreino.txt", true );
		    	 BufferedWriter bw = new BufferedWriter( fw );
		    	 bw.write( gravar +" - treino gravado no sistema - "+ new Date() );
		    	 bw.newLine();
		    	 bw.close();
		    	 fw.close();
	   	 
	   	 }catch(Exception e){
	   		 
	   		 System.out.println(e.getMessage());
	   	 }
	   }
	     
	after(String gravar) returning: gravarRemocaoCliente(gravar){
	   	 
	   	 try{
		    	 FileWriter fw = new FileWriter("RegistroExcluirCliente.txt", true );
		    	 BufferedWriter bw = new BufferedWriter( fw );
		    	 bw.write( gravar +" - removido do sistema - "+ new Date() );
		    	 bw.newLine();
		    	 bw.close();
		    	 fw.close();
	   	 
	   	 }catch(Exception e){
	   		 
	   		 System.out.println(e.getMessage());
	   	 }
	   }
	     
}
