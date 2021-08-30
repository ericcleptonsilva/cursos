public class Peixe extends Animal {

    private String corDasEscamas;

    public String getCorDasEscamas() {
        return corDasEscamas;
    }

    public void setCorDasEscamas(String corDasEscamas) {
        this.corDasEscamas = corDasEscamas;
    }

    @Override
    public void locomover() {
        System.out.println("Nadando!");

    }

    @Override
    public void alimentar() {
        System.out.println("Comendo substancia!");

    }

    @Override
    public void emitirSom() {
        System.out.println("Nao emiti som!");

    }

    public void soltarBolhas() {
        System.out.println("Solta Bolhas!");
    }

}
