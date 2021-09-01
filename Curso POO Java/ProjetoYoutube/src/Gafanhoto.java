public class Gafanhoto extends Pessoa {

    private String login;
    private int toAssstindo;

    public Gafanhoto(String nome, int idade, String sexo, String login) {
        super(nome, idade, sexo);
        this.login = login;
        this.toAssstindo = 0;

    }

    public String getLogin() {
        return this.login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getToAssstindo() {
        return this.toAssstindo;
    }

    public void setToAssstindo(int toAssstindo) {
        this.toAssstindo = toAssstindo;
    }

    public void viuMaisUM() {
        this.toAssstindo++;

    }

    @Override
    public String toString() {
        return "{" + super.toString() + "\n login='" + getLogin() + "'" + ", toAssstindo='" + getToAssstindo() + "'"
                + "}";
    }

}
