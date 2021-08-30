public abstract class Animal {
    // Atributos de Animal
    protected float peso;
    protected int idade;
    protected int pats;
    protected String nome;

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getPeso() {
        return this.peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public int getIdade() {
        return this.idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getPats() {
        return this.pats;
    }

    public void setPats(int pats) {
        this.pats = pats;
    }

    // Métodos de Animal
    public abstract void locomover();

    public abstract void alimentar();

    public abstract void emitirSom();

}
