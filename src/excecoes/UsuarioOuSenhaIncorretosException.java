package excecoes;

public class UsuarioOuSenhaIncorretosException extends Exception{
	public UsuarioOuSenhaIncorretosException(){
		
		super("Usu�rio e/ou senha incorretos");
	}

}
