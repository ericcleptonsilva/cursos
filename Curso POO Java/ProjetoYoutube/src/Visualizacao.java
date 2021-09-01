public class Visualizacao {
    private Gafanhoto espectador;
    private Video filmes;

    public Visualizacao(Gafanhoto espectador, Video filmes) {
        this.espectador = espectador;
        this.filmes = filmes;
        this.espectador.setToAssstindo(this.espectador.getToAssstindo() + 1);
        this.filmes.setViews(this.filmes.getViews() + 1);

    }

    public void avaliar() {
        this.filmes.setAvaliacao(5);
    }

    public void avaliar(int nota) {
        this.filmes.setAvaliacao(nota);
    }

    public void avaliar(float porcentagem) {
        int total = 0;
        if (porcentagem <= 20) {
            total = 3;

        } else if (porcentagem <= 50) {
            total = 5;

        } else if (porcentagem <= 90) {
            total = 80;

        } else {

            total = 10;

        }
        this.filmes.setAvaliacao(total);
    }

    public Gafanhoto getEspectador() {
        return this.espectador;
    }

    public void setEspectador(Gafanhoto espectador) {
        this.espectador = espectador;
    }

    public Video getFilmes() {
        return this.filmes;
    }

    public void setFilmes(Video filmes) {
        this.filmes = filmes;
    }

    @Override
    public String toString() {
        return "{" + " espectador='" + getEspectador() + "'" + ",\n filmes='" + getFilmes() + "'" + "}";
    }

}
