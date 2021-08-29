public class Livro implements Puclicacao {

    private String titulo;
    private String autor;
    private int totalPaginas;
    private int paginaAtual;
    private boolean aberto;
    private Pessoa leitor;

    public String detalhes() {
        return "Livro{\n" + "titulo=" + titulo + ",\n autor=" + autor + ",\n totalPaginas=" + totalPaginas
                + ",\n paginaAtual=" + paginaAtual + ",\n aberto=" + aberto + ",\n leitor=" + leitor.getNome()
                + ",\n idade=" + leitor.getIdade() + ",\n sexo=" + leitor.getSexo() + ",\n" + '}';
    }

    public Livro(String titulo, String autor, int totalPaginas, Pessoa leitor) {
        this.setTitulo(titulo);
        this.setAutor(autor);
        this.setTotalPaginas(totalPaginas);
        this.setPaginaAtual(0);
        this.setAberto(false);
        this.setLeitor(leitor);
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getTotalPaginas() {
        return totalPaginas;
    }

    public void setTotalPaginas(int totalPaginas) {
        this.totalPaginas = totalPaginas;
    }

    public int getPaginaAtual() {
        return paginaAtual;
    }

    public void setPaginaAtual(int paginaAtual) {
        this.paginaAtual = paginaAtual;
    }

    public boolean isAberto() {
        return aberto;
    }

    public void setAberto(boolean aberto) {
        this.aberto = aberto;
    }

    public Pessoa getLeitor() {
        return leitor;
    }

    public void setLeitor(Pessoa leitor) {
        this.leitor = leitor;
    }

    @Override
    public void abrir() {
        this.aberto = true;

    }

    @Override
    public void fechar() {
        this.aberto = false;
    }

    @Override
    public void folhear(int pagina) {
        if (pagina > this.totalPaginas) {
            this.paginaAtual = this.totalPaginas;
        } else {
            this.paginaAtual = pagina;

        }
    }

    @Override
    public void avancarpagina() {
        this.paginaAtual++;

    }

    @Override
    public void voltarpagina() {
        this.paginaAtual--;

    }


}
