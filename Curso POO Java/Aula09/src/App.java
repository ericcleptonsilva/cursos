public class App {
    public static void main(String[] args) {
        Pessoa[] pessoa = new Pessoa[2];
        Livro[] livro = new Livro[3];

        pessoa[0] = new Pessoa("Eric", 37, "M");
        pessoa[1] = new Pessoa("Fernanda", 30, "F");

        livro[0] = new Livro("Clean Code", "BOb", 300, pessoa[0]);
        livro[1] = new Livro("SOLID", "BOb", 600, pessoa[0]);
        livro[2] = new Livro("Autismo", "Morena", 300, pessoa[1]);

        livro[0].abrir();
        livro[0].folhear(78);

        System.out.println(livro[0].detalhes());

    }
}
