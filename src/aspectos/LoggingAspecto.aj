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
	Cliente c;
	Treinador t;
	pointcut gravarLogin(): execution(* *negocios.MyGymFachada.logar(..));
	pointcut gravarCadastroCliente(Cliente c) : call(* negocios.MyGymFachada.cadastrarCliente(..)) && args(c);
	pointcut gravarCadastroTreinador(Treinador t) : call(* negocios.MyGymFachada.cadastrarTreinador(..)) && args(t);
	pointcut gravarCadastroAdm(Administrador ad) : call(* negocios.MyGymFachada.cadastraAdministrador(..)) && args(ad);
	pointcut gravarTreino(Treino t) : call(* negocios.MyGymFachada.cadastrarTreino(..)) && args(t);
	pointcut gravarAula(Aula a) : call(* negocios.MyGymFachada.cadastrarAulas(Aula)) && args(a);
	pointcut gravarRemocaoCliente(Long cpf) : call(* negocios.MyGymFachada.removerCliente(..)) && args(cpf);
	pointcut gravarRemocaoTreinador(Long cpf) : call(* negocios.MyGymFachada.removerTreinador(..)) && args(cpf);
	pointcut gravarProcuraCliente() : call(* negocios.MyGymFachada.procurarCliente(..));
	pointcut gravarProcuraTreinador() : call(* negocios.MyGymFachada.procurarTreinador(..));
	pointcut gravarProcuraTreino() : call(* negocios.MyGymFachada.procurarTreino(..));
	pointcut gravarProcuraAula() : call(* negocios.MyGymFachada.procurarAulas(..));
	pointcut gravarProcuraAdm() : call(* negocios.MyGymFachada.procurarAdministrador(..));
	
	//LOGIN

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
	
	//CADASTROS
	
	after(Cliente c) returning: gravarCadastroCliente(c){
	   	 
	   	 try{
	   		String gravar = c.getLogin().getUsuario();
	    	 FileWriter fw = new FileWriter("RegistroCadastroCliente.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O cliente de login " + gravar + " foi cadastrado no sistema em "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
	   	 
	   	 }catch(Exception e){
	   		 
	   		 System.out.println(e.getMessage());
	   	 }
	   }
	
	after(Treinador t) returning: gravarCadastroTreinador(t){
	   	 
	   	 try{
	   		String gravar = t.getLogin().getUsuario();
	    	 FileWriter fw = new FileWriter("RegistroCadastroTreinador.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O treinador de login " + gravar +" foi cadastrado no sistema em "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
	   	 
	   	 }catch(Exception e){
	   		 
	   		 System.out.println(e.getMessage());
	   	 }
	   }
	
	after(Administrador ad) returning: gravarCadastroAdm(ad){
	   	 
	   	 try{
	   		String gravar = ad.getLogin().getUsuario();
	    	 FileWriter fw = new FileWriter("RegistroCadastroAdm.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O adm de login " + gravar +" foi cadastradoo no sistema em "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
	   	 
	   	 }catch(Exception e){
	   		 
	   		 System.out.println(e.getMessage());
	   	 }
	   }
	
	after(Treino t) returning: gravarTreino(t){
	   	 
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
	
	after(Aula a) returning: gravarAula(a){
	   	 
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
	//REMOÇÕES
	
	after(Long cpf) returning(): gravarRemocaoCliente(cpf){
	   	 try{
			     String gravar = c.getLogin().getUsuario();	 
		   		 FileWriter fw = new FileWriter("RegistroRemocaoCliente.txt", true );
		    	 BufferedWriter bw = new BufferedWriter( fw );
		    	 bw.write( gravar +" - removido do sistema - "+ new Date() );
		    	 bw.newLine();
		    	 bw.close();
		    	 fw.close();
	   	 
	   	 }catch(Exception e){
	   		 
	   		 System.out.println(e.getMessage());
	   	 }
	   }
	after(Long cpf) returning: gravarRemocaoTreinador(cpf){
	   	 
	   	 try{
	   		String gravar = t.getLogin().getUsuario();
	    	 FileWriter fw = new FileWriter("RegistroRemocaoTreinador.txt", true );
	    	 BufferedWriter bw = new BufferedWriter( fw );
	    	 bw.write("O treinador de login " + gravar +" foi removido no sistema em "+ new Date() );
	    	 bw.newLine();
	    	 bw.close();
	    	 fw.close();
	   	 
	   	 }catch(Exception e){
	   		 
	   		 System.out.println(e.getMessage());
	   	 }
	   }
	
	//PROCURAS
	
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
