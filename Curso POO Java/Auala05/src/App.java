public class App {
    public static void main(String[] args) {

        ContaBanco p1 = new ContaBanco();
        p1.setNumConta(2323);
        p1.abrirConta("cc");
        p1.setDono("Eric");
        p1.depositar(500);
        p1.sacar(550);
        p1.fecharConta();
        p1.estadoAtual();

    }
}
