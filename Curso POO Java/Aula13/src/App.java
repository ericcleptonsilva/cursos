public class App {
    public static void main(String[] args) {

        Cachorro cachorro = new Cachorro();
        cachorro.reagir("Olá"); // Abanar e latir
        cachorro.reagir("Vai apanhar"); // Rosnar
        cachorro.reagir(11, 45); // Abanar
        cachorro.reagir(12, 00); // Ignorar
        cachorro.reagir(true); // Abanar
        cachorro.reagir(false); // Rosnar e Latir
        cachorro.reagir(2, 12.5f); // Latir
        cachorro.reagir(17, 4.5f); // Rosnar

        /*
         * programa principal Class animal é uma class abstrata e não pode ser
         * estanciada Animal x = new Animal();
         */

        /*
         * Mamifero x = new Mamifero(); x.emitirSom();
         * 
         * Lobo x = new Lobo(); x.emitirSom();
         */

    }
}
