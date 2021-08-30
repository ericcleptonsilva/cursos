
public class Tecnico  extends Aluno {
	
	private int registroprossional;
	
	public void praticar() {
		System.out.println(this.getNome() + " está praticando sua Programação!");
	}

	public int getRegistroprossional() {
		return registroprossional;
	}

	public void setRegistroprossional(int registroprossional) {
		this.registroprossional = registroprossional;
	}

}
