
public class Tecnico  extends Aluno {
	
	private int registroprossional;
	
	public void praticar() {
		System.out.println(this.getNome() + " est� praticando sua Programa��o!");
	}

	public int getRegistroprossional() {
		return registroprossional;
	}

	public void setRegistroprossional(int registroprossional) {
		this.registroprossional = registroprossional;
	}

}
