
package aspectos;


import javax.swing.JOptionPane;

import excecoes.CpfInvalidoException;
import excecoes.ObjetoJaExisteException;
import excecoes.ObjetoNaoExisteException;
import excecoes.SenhaNaoExisteException;
import excecoes.UsuarioJaExisteException;
import excecoes.UsuarioOuSenhaIncorretosException;
import gui.TelaLogin;
import util.MensagemErro;

public aspect ExceptionAspecto {
	
	//POINTCUT LOGIN
	pointcut logar(): execution(* *negocios.MyGymFachada.logar(..));
		
	//POINTCUTS CLIENTE
	pointcut cadastrarCliente(): call(* negocios.MyGymFachada.cadastrarCliente(..));
	pointcut removerCliente(): call(* negocios.MyGymFachada.removerCliente(..));
	pointcut procurarCliente(): call(* negocios.MyGymFachada.procurarCliente(..));
	pointcut atualizarCliente(): call(* negocios.MyGymFachada.atualizarCliente(..));
	
	//POINTCUTS TREINADOR
	pointcut cadastrarTreinador(): call(* negocios.MyGymFachada.cadastrarTreinador(..));
	pointcut removerTreinador(): call(* negocios.MyGymFachada.removerTreinador(..));
	pointcut procurarTreinador(): call(* negocios.MyGymFachada.procurarTreinador(..));
	pointcut atualizarTreinador(): call(* negocios.MyGymFachada.atualizarTreinador(..));
	
	//POINTCUTS ADM
	pointcut cadastrarAdministrador(): call(* negocios.MyGymFachada.cadastrarAdministrador(..));
	pointcut removerAdministrador(): call(* negocios.MyGymFachada.removerAdministrador(..));
	pointcut procurarAdministrador(): call(* negocios.MyGymFachada.procurarAdministrador(..));
	pointcut atualizarAdministrador(): call(* negocios.MyGymFachada.atualizarAdministrador(..));
	
	//POINTCUTS TREINO
	pointcut cadastrarTreino(): call(* negocios.MyGymFachada.cadastrarTreino(..));
	pointcut removerTreino(): call(* negocios.MyGymFachada.removerTreino(..));
	pointcut procurarTreino(): call(* negocios.MyGymFachada.procurarTreino(..));
	pointcut atualizarTreino(): call(* negocios.MyGymFachada.atualizarTreino(..));
	
	//POINTCUTS AULA
	pointcut cadastrarAula(): call(* negocios.MyGymFachada.cadastrarAula(..));
	pointcut removerAula(): call(* negocios.MyGymFachada.removerAula(..));
	pointcut procurarAula(): call(* negocios.MyGymFachada.procurarAula(..));
	pointcut atualizarAula(): call(* negocios.MyGymFachada.atualizarAula(..));
	
	//ADVICES
	after()throwing(ObjetoJaExisteException e) : cadastrarCliente() || cadastrarTreino() || cadastrarAula() ||
	cadastrarTreinador() || cadastrarAdministrador(){
			
		System.out.println(e.getMessage());
		}
	
	after()throwing(ObjetoNaoExisteException e) : removerCliente() || removerTreino() || removerAula() ||
	removerTreinador() || removerAdministrador() || procurarCliente() || procurarTreino() || procurarAula() ||
	procurarTreinador() || procurarAdministrador(){
			
		System.out.println(e.getMessage());
		}
	
	after()throwing(UsuarioJaExisteException e) : cadastrarCliente() || cadastrarTreinador() {
			
		System.out.println(e.getMessage());
		}
	
	after()throwing(UsuarioJaExisteException e) : cadastrarCliente() || cadastrarTreinador() {
		
		System.out.println(e.getMessage());
	}
	
	after()throwing(UsuarioOuSenhaIncorretosException e) : logar() {
			
		JOptionPane.showMessageDialog(null, e.getMessage());
		}
	/*
	after()throwing(CpfInvalidoException e) : logar() {
		
		MensagemErro.cpfInvalido(e.getMessage());
	}
*/	
	after()throwing(IllegalArgumentException e) : cadastrarCliente() || cadastrarTreinador() || cadastrarAula() || cadastrarAdministrador() || atualizarAula() ||
	atualizarTreinador() || atualizarCliente() || atualizarAdministrador() || procurarCliente() || procurarAula() ||
	procurarTreinador() || procurarAdministrador() || logar(){
			
		System.out.println(e.getMessage());
		}

}
