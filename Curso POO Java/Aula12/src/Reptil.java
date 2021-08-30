public class Reptil extends Animal {
    private String corDasEscamas;

    public String getCorDasEscamas() {
        return corDasEscamas;
    }

    public void setCorDasEscamas(String corDasEscamas) {
        this.corDasEscamas = corDasEscamas;
    }

    @Override
    public void locomover() {
        System.out.println("Rastejando!");

    }

    @Override
    public void alimentar() {
        System.out.println("Engole");
    }

    @Override
    public void emitirSom() {
        System.out.println("Som de chocalho!");

    }

}
