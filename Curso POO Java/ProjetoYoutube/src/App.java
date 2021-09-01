
public class App {
    public static void main(String[] args) {

        Video video[] = new Video[3];

        video[0] = new Video("Aula 01 de Poo");
        video[1] = new Video("Aula 12 de PHP");
        video[2] = new Video("Aula 10 de HTML");

        Gafanhoto gafanhoto[] = new Gafanhoto[1];
        gafanhoto[0] = new Gafanhoto("Eric", 37, "M", "eric");

        Visualizacao visualizacao[] = new Visualizacao[3];
        visualizacao[0] = new Visualizacao(gafanhoto[0], video[2]);
        visualizacao[0].avaliar(87.0f);
        visualizacao[0].avaliar(5);
        visualizacao[0].avaliar();
        visualizacao[1] = new Visualizacao(gafanhoto[0], video[1]);
        visualizacao[2] = new Visualizacao(gafanhoto[0], video[0]);

        System.out.println(visualizacao[0].toString());
        System.out.println(visualizacao[1].toString());
        System.out.println(visualizacao[2].toString());
    }
}
