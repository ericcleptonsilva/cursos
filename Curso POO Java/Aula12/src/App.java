public class App {
    public static void main(String[] args) {

        // programa principal
        Mamifero mamifero = new Mamifero();
        mamifero.setCorDoPelo("Preto");
        mamifero.setIdade(5);
        mamifero.setPeso(22.5f);
        mamifero.setPats(4);
        mamifero.alimentar();
        mamifero.locomover();
        mamifero.emitirSom();

        Reptil reptil = new Reptil();
        reptil.setPeso(4.6f);
        reptil.alimentar();
        reptil.locomover();
        reptil.emitirSom();

        Peixe peixe = new Peixe();
        peixe.setCorDasEscamas("vermelho");
        peixe.setPeso(8.5f);
        peixe.alimentar();
        peixe.soltarBolhas();
        peixe.locomover();
        peixe.emitirSom();

        Ave ave = new Ave();
        ave.setCorDaPena("Azul");
        ave.setIdade(3);
        ave.setPeso(5.5f);
        ave.alimentar();
        ave.locomover();
        ave.emitirSom();
        ave.fazerNinho();

        Canguru canguru = new Canguru();
        canguru.setNome("Canguru");
        System.out.println("\n" + canguru.getNome());
        canguru.locomover();
        canguru.usarBolsa();
        canguru.emitirSom();

        Cachorro cachorro = new Cachorro();
        cachorro.setNome("Cachorro");
        System.out.println("\n" + cachorro.getNome());
        cachorro.locomover();
        cachorro.emitirSom();

        Cobra cobra = new Cobra();
        cobra.setNome("Cobra");
        System.out.println("\n" + cobra.getNome());
        cobra.alimentar();
        cobra.locomover();

        Tartaruga tartaruga = new Tartaruga();
        tartaruga.setNome("Tartaruga");
        System.out.println("\n" + tartaruga.getNome());
        tartaruga.alimentar();
        tartaruga.locomover();

        GoldFish goldFish = new GoldFish();
        goldFish.setNome("GoldFish");
        System.out.println("\n" + goldFish.getNome());
        goldFish.alimentar();
        goldFish.soltarBolhas();

        Arara arara = new Arara();
        arara.setNome("Arara");
        System.out.println("\n" + arara.getNome());
        arara.alimentar();
        arara.locomover();
        arara.fazerNinho();

    }
}
