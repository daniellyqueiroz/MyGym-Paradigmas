package aspectos;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Date;

import classesBasicas.Aula;
import classesBasicas.Cliente;
import classesBasicas.Pessoa;
import classesBasicas.Treino;

public aspect LoggingAspecto {	
	pointcut gravarLogin(): execution(* *negocios.MyGymFachada.logar(..));
	pointcut gravarTreino() : execution(* *negocios.MyGymFachada.cadastrarTreino(..));
	pointcut gravarAula() : execution(* *negocios.MyGymFachada.cadastrarAulas(..));
	pointcut gravarRemocaoCliente() : execution(* *negocios.MyGymFachada.removerCliente(..));

	after() returning(Pessoa p): gravarLogin() {
		try{	
			String gravar = p.getLogin().getUsuario();
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
	after() returning(Treino t): gravarTreino(){
	   	 
	   	 try{
	   		 	String gravar = t.getNomeTreino();
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
	
	after() returning(Aula a): gravarAula(){
	   	 
	   	 try{
	   		 	String gravar = a.getNomeDaAula(); 
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
	after() returning(Cliente c): gravarRemocaoCliente(){
	   	 
	   	 try{
		    String gravar = c.getLogin().getUsuario();	 
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
	     
	    /*
	
	
	
	pointcut gravarPersistencia(String registro) : call(* negocios.ControladorLogging.gravarPersistencia(..)) && args(registro);
	
	
	
	
	     */
}
