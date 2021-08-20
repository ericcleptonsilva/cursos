public class App {
    public static void main(String[] args) {
        Caneta c1 = new Caneta();
        c1.cor = "Azul";
        c1.ponta = 0.5f;
        c1.destampar();
        c1.status();
        c1.rabiscar();
        System.out.println("-----------------------------------");
        Caneta c2 = new Caneta();
        c2.modelo = "Bic";
        c2.cor = "Vermelho";
        c2.ponta = 1.0f;
        c2.tampar();
        c2.status();
        c2.rabiscar();

    }
}
