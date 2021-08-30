
public class Bolsista  extends Aluno {
	private int bolsa;
	
	public void renovarBolsa() {
		System.out.println("Renovando a bolsa de estudos do(a) Aluno(a) " + this.getNome() + " do Curso de " + this.getCurso() +"." );

	}
	
	@Override
	public void pagarMensalidade() {
		System.out.println(this.getNome() + " é bolsista  do Curso " + this.getCurso() +", mensaldiade com desconto." );

	}
	
}
