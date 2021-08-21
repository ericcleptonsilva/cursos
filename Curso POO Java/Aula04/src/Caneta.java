public class Caneta {
    public String modelo;
    private float ponta;
    private boolean tampada;
    private String cor;

    public Caneta(String modelo, String cor, float ponta, boolean tampada) {
        this.setModelo(modelo);
        this.setCor(cor);
        this.setPonta(ponta);
        this.setTampada(tampada);
        this.tampar();
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public boolean getTampada() {
        return tampada;
    }

    public void setTampada(boolean tampada) {
        this.tampada = tampada;
    }

    public void tampar() {
        this.setTampada(true);
    }

    public void destampar() {
        this.setTampada(false);
    }

    public String getModelo() {
        return this.modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;

    }

    public float getPonta() {
        return this.ponta;
    }

    public void setPonta(float ponta) {
        this.ponta = ponta;
    }

    public void status() {
        System.out.println("Status da Caneta!");
        System.out.println("Modelo: " + this.modelo);
        System.out.println("Ponta: " + this.ponta);
        System.out.println("Cor: " + this.cor);
        System.out.println("Tampada: " + this.tampada);

    }

}
