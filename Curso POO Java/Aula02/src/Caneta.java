public class Caneta {
    String modelo;
    String cor;
    float ponta;
    int cargar;
    boolean tampada;

    void status() {
        System.out.println("Modelo: " + this.modelo);
        System.out.println("Está tampada? " + this.tampada);
        System.out.println("Uma caneta: " + this.cor);
        System.out.println("Ponta: " + this.ponta);
        System.out.println("Carga: " + this.cargar);
    }

    void rabiscar() {
        if (this.tampada == true) {
            System.out.println("ERRO! Não posso rabiscar!");
        } else {
            System.out.println("Estou Rabiscando!");
        }
    }

    void tampar() {
        this.tampada = true;

    }

    void destampar() {
        this.tampada = false;
    }

}
