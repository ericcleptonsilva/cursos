public class ControleRemoto implements Controlador {
    // atributos
    private int volume;
    private boolean ligado;
    private boolean tocando;

    // Métodos especiais
    public ControleRemoto() {
        this.volume = 50;
        this.ligado = false;
        this.tocando = false;

    }

    public boolean isTocando() {
        return tocando;
    }

    public int getVolume() {
        return volume;
    }

    public boolean isLigado() {
        return ligado;
    }

    public void setLigado(boolean ligado) {
        this.ligado = ligado;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    public void setTocando(boolean tocando) {
        this.tocando = tocando;
    }

    // Métodos Abstratos
    @Override
    public void ligar() {
        this.setLigado(true);

    }

    @Override
    public void desligar() {
        this.setLigado(false);

    }

    @Override
    public void abrirMenu() {
        System.out.println("A TV está ligado? " + isLigado());
        System.out.println("A TV está tocando? " + isTocando());
        System.out.print("Volume: " + getVolume() + " ");
        for (int i = 0; i <= this.getVolume(); i += 5) {
            System.out.print("|");

        }

    }

    @Override
    public void fecharMenu() {
        System.out.println("Fechando menu...");

    }

    @Override
    public void maisVolume() {
        if (this.isLigado()) {
            this.setVolume(this.getVolume() + 5);

        } else {
            System.out.println("TV desligada!");

        }
    }

    @Override
    public void menosVolume() {
        if (this.isLigado()) {
            this.setVolume(this.getVolume() - 5);

        } else {
            System.out.println("TV desligada!");

        }
    }

    @Override
    public void ligarMudo() {
        if (this.isLigado() && this.getVolume() > 0) {
            this.setVolume(0);

        } else if (this.getVolume() == 0) {
            System.out.println("O volume já está no mudo!");
        } else {
            System.out.println("TV desligada!");
        }

    }

    @Override
    public void desligarMudo() {
        if (this.isLigado() && this.getVolume() == 0) {
            this.setVolume(50);

        } else {
            System.out.println("TV desligada!");
        }

    }

    @Override
    public void play() {
        if (this.isLigado() && !this.isTocando()) {
            this.setTocando(true);
        }
    }

    @Override
    public void pause() {
        if (this.isLigado() && this.isTocando()) {
            this.setTocando(false);
        }

    }

}
