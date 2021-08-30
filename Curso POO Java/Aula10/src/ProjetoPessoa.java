
public class ProjetoPessoa {
	public static void main(String[] args) {
		// programa principal
		
		Pessoa pessoa1 = new Pessoa();
		Aluno pessoa2 = new Aluno();
		Professor pessoa3 = new Professor();
		Funcionario pessoa4 = new Funcionario();
		
		
		pessoa1.setIdade(25);
		pessoa2.setIdade(37);
		pessoa3.setIdade(40);
		pessoa4.setIdade(50);
		
		pessoa1.setSexo("F");
		pessoa2.setSexo("M");
		pessoa3.setSexo("F");
		pessoa4.setSexo("F");
			
		pessoa1.setNome("Maria");
		pessoa2.setNome("Eric");
		pessoa3.setNome("Otilha");
		pessoa4.setNome("Lucia");
		
		pessoa2.setCurso("ADS");
		pessoa3.setSalario(2500.75f);
		pessoa4.setSetor("Estoque");
		
		
		System.out.println(pessoa1.toString());
		System.out.println(pessoa2.toString());
		System.out.println(pessoa3.toString());
		System.out.println(pessoa4.toString());
		
		
		
		
			
	}

}
