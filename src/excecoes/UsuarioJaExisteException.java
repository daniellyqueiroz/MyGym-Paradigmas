package excecoes;

import classesBasicas.Login;

public class UsuarioJaExisteException extends Exception{
	
	public UsuarioJaExisteException(Login login){
		super("Usu�rio j� existe");
	}
	

}
