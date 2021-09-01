public class Cachorro extends Lobo {

    @Override
    public void emitirSom() {
        System.out.println("Au! Au!");
    }

    public void reagir(String frase) {
        if (frase.equals("Comida") || frase.equals("Olá!")) {
            System.out.println("\nAbanar e Latir");
            emitirSom();

        } else {
            System.out.println("\nRosnar!");

        }
    }

    public void reagir(int hora, int minuto) {
        if (hora < 12) {
            System.out.println("\nAbanar");
            emitirSom();

        } else if (hora >= 18) {
            System.out.println("\nIgnorar");

        } else {
            System.out.println("\nAbanar e Latir");
            emitirSom();
        }
    }

    public void reagir(boolean dono) {
        if (dono) {
            System.out.println("\nAbanar e Latir");
            emitirSom();

        } else {
            System.out.println("\nRosnar!");

        }
    }

    public void reagir(int idade, float peso) {
        if (idade < 5) {
            if (peso < 10) {
                System.out.println("\nAbanar");
            } else {
                System.out.println("\nLatir");
                emitirSom();
            }

        } else {
            if (peso < 10) {
                System.out.println("\nRosnar!");

            } else {
                System.out.println("\nIgnorar");
            }
        }
    }

}
