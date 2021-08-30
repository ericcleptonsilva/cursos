
public class Aula11 {
	public static void main(String[] args) {
		Aluno aluno = new Aluno();		
		aluno.setNome("Eric");
		aluno.setIdade(37);
		aluno.setMatricula(2520);
		aluno.setCurso("ADS");
		aluno.setSexo("M");
		aluno.pagarMensalidade();
		
		Bolsista bolsista = new Bolsista();		
		bolsista.setCurso("ADS");
		bolsista.setNome("Eric");
		bolsista.setMatricula(2520);
		bolsista.pagarMensalidade();
		
		Professor professor = new Professor();
		professor.setNome("Ricardo");
		professor.setEspecialidade("Engenharia de Software.");
		professor.setSalario(3000.00f);
		professor.receberAumento(1000.00f);
		System.out.println(professor.toString());
		
		Tecnico tecnico = new Tecnico();
		tecnico.setNome("Francisco");
		tecnico.praticar();
	}

}
