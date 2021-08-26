import org.junit.jupiter.api.Test;

public class TelaLoginTeste {

	@Test
	public void testInputLogin() throws Exception {
		String user = "";
		String password = "123";
		TelaLoginMock telalogin = new TelaLoginMock(user, password);

		if (telalogin.getUser().equals(user) && telalogin.getPassword().equals(password)) {
			System.out.println("Usuario logado!");
			System.out.println("User: " + telalogin.getUser() + "\nPassword: " + telalogin.getPassword());

		} else {
			System.out.println("ERRO!");
		}

	}
}
