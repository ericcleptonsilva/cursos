public class Ave extends Animal {

    private String corDaPena;

    public String getCorDaPena() {
        return corDaPena;
    }

    public void setCorDaPena(String corDaPena) {
        this.corDaPena = corDaPena;
    }

    @Override
    public void locomover() {
        System.out.println("Voando!");

    }

    @Override
    public void alimentar() {
        System.out.println("Come Frutas!");

    }

    @Override
    public void emitirSom() {
        System.out.println("Som de Ave");

    }

    public void fazerNinho() {
        System.out.println("Fazendo ninho na Arvore");
    }

}
