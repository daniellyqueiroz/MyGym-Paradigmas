package util;

import javafx.scene.control.Alert;

public class MensagemErro {
	public static void aviso(String tit, String msg, Alert.AlertType tipo) {
        Alert alert = new Alert(tipo);
        alert.setTitle(tit);
        alert.setHeaderText(msg);

        alert.showAndWait();
    }

    public static void cpfInvalido(String mensagem) {
       aviso("CPF Inv�lido", mensagem, Alert.AlertType.ERROR);
    }
    public static void objetoNaoExiste(String mensagem) {
        aviso("N�o Encontrado", mensagem, Alert.AlertType.ERROR);
     }
     
    public static void objetoJaExiste(String mensagem) {
        aviso("J� est� cadastrado", mensagem, Alert.AlertType.ERROR);
     }
    
    public static void senhaNaoExiste(String mensagem) {
        aviso("Senha Inv�lida", mensagem, Alert.AlertType.ERROR);
     }
    
    public static void usuarioJaExiste(String mensagem) {
        aviso("Usu�rio j� est� cadastrado", mensagem, Alert.AlertType.ERROR);
     }
     
    public static void usuarioOUsenhaInvalido(String mensagem) {
        aviso("Usu�rio e/ou senha incorretos", mensagem, Alert.AlertType.ERROR);
     }
     
    
     
}
