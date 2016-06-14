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
       aviso("CPF Inválido", mensagem, Alert.AlertType.ERROR);
    }
    public static void objetoNaoExiste(String mensagem) {
        aviso("Não Encontrado", mensagem, Alert.AlertType.ERROR);
     }
     
    public static void objetoJaExiste(String mensagem) {
        aviso("Já está cadastrado", mensagem, Alert.AlertType.ERROR);
     }
    
    public static void senhaNaoExiste(String mensagem) {
        aviso("Senha Inválida", mensagem, Alert.AlertType.ERROR);
     }
    
    public static void usuarioJaExiste(String mensagem) {
        aviso("Usuário já está cadastrado", mensagem, Alert.AlertType.ERROR);
     }
     
    public static void usuarioOUsenhaInvalido(String mensagem) {
        aviso("Usuário e/ou senha incorretos", mensagem, Alert.AlertType.ERROR);
     }
     
    
     
}
