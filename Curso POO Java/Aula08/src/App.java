
public class App {
    public static void main(String[] args) {
        Lutador l[] = new Lutador[6];
        l[0] = new Lutador("Eric", "Brasileiro", 37, 170.0f, 100.0f, 3, 3, 2);
        l[1] = new Lutador("Carlos", "Brasileiro", 38, 170.0f, 100.0f, 5, 5, 2);

        Luta UFC = new Luta();
        UFC.marcarLuta(l[0], l[1]);
        UFC.lutar();
        l[0].status();

    }
}
