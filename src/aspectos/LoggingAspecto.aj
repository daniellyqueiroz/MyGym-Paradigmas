package aspectos;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Date;

import classesBasicas.Administrador;
import classesBasicas.Aula;
import classesBasicas.Cliente;
import classesBasicas.Pessoa;
import classesBasicas.Treinador;
import classesBasicas.Treino;

public aspect LoggingAspecto {	
	Treino t;
	Aula a;
	Cliente c;
	pointcut gravarLogin(): execution(* *negocios.MyGymFachada.logar(..));
	pointcut gravarTreino() : call(* negocios.MyGymFachada.cadastrarTreino(..));//Retorna null
	pointcut gravarAula() : call(* negocios.MyGymFachada.cadastrarAulas(..));//Retorna null
	pointcut gravarRemocaoCliente() : execution(* *negocios.MyGymFachada.removerCliente(..));//Retorna null
	pointcut gravarProcuraCliente() : call(* negocios.MyGymFachada.procurarCliente(..));
	pointcut gravarProcuraTreinador() : call(* negocios.MyGymFachada.procurarTreinador(..));
	pointcut gravarProcuraTreino() : call(* negocios.MyGymFachada.procurarTreino(..));
	pointcut gravarProcuraAula() : call(* negocios.MyGymFachada.procurarAulas(..));
	pointcut gravarProcuraAdm() : call(* negocios.MyGymFachada.procurarAdministrador(..));

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
	after() returning: gravarTreino(){
	   	 
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
	
	after() returning(): gravarAula(){
	   	 
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
	after() returning(): gravarRemocaoCliente(){
	   	 
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
	     
	after() returning(Cliente c): gravarProcuraCliente() {
		try{	
			String gravar = c.getNome();
			FileWriter fw = new FileWriter("RegistroProcuraCliente.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O cliente " + gravar + " foi pesquisado em " + new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
   	 
   	 }catch(Exception e){
   		 
   		 System.out.println(e.getMessage());
   	 }

	}
	
	after() returning(Treinador t): gravarProcuraTreinador() {
		try{	
			String gravar = t.getNome();
			FileWriter fw = new FileWriter("RegistroProcuraTreinador.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O treinador " + gravar + " foi pesquisado em " + new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
   	 
   	 }catch(Exception e){
   		 
   		 System.out.println(e.getMessage());
   	 }

	}
	after() returning(Treino t): gravarProcuraTreino() {
		try{	
			String gravar = t.getNomeTreino();
			FileWriter fw = new FileWriter("RegistroProcuraTreino.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O treino " + gravar + " foi pesquisado em " + new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
   	 
   	 }catch(Exception e){
   		 
   		 System.out.println(e.getMessage());
   	 }

	}
	after() returning(Aula a): gravarProcuraAula() {
		try{	
			String gravar = a.getNomeDaAula();
			FileWriter fw = new FileWriter("RegistroProcuraAula.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("A aula " + gravar + " foi pesquisado em " + new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
   	 
   	 }catch(Exception e){
   		 
   		 System.out.println(e.getMessage());
   	 }

	}
	after() returning(Administrador ad): gravarProcuraAdm() {
		try{	
			String gravar = ad.getNome();
			FileWriter fw = new FileWriter("RegistroProcuraAdm.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O treino" + gravar + " foi pesquisado em " + new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
   	 
   	 }catch(Exception e){
   		 
   		 System.out.println(e.getMessage());
   	 }

	}
}
