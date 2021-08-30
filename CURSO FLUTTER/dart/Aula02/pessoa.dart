class Pessoa {
  String nome;
  String sobrenome;

  Pessoa({required this.nome, required this.sobrenome});

  get nomeCompleto => 'Meu nome é ' + this.nome + ' ' + this.sobrenome;
}
