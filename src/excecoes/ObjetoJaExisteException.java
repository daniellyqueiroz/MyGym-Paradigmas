package excecoes;

import classesBasicas.Entidade;



public class ObjetoJaExisteException extends Exception {
	
	private Entidade objeto;

	public ObjetoJaExisteException(Entidade obj) {

		super("N�o foi poss�vel cadastrar, objeto j� existe"
				+ obj.toString() + "\n");
		this.setObjeto(obj);
	}

	public Entidade getObjeto() {
		return objeto;
	}

	public void setObjeto(Entidade objeto) {
		this.objeto = objeto;
	}

}
