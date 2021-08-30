
public class Aluno extends Pessoa {
	private int numeroMatriculla;
	private String Curso;
	
	
	public void cancelarMatricula() {
		System.out.println("Matrícula será cancelada!");
	}
	
		
	public int getNumeroMatriculla() {
		return numeroMatriculla;
	}
	public void setNumeroMatriculla(int numeroMatriculla) {
		this.numeroMatriculla = numeroMatriculla;
	}
	public String getCurso() {
		return Curso;
	}
	public void setCurso(String curso) {
		Curso = curso;
	}
}
