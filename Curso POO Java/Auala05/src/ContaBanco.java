public class ContaBanco {
    // Atributos
    public int numConta;
    protected String tipo;
    private String dono;
    private float saldo;
    private boolean status;

    public ContaBanco() {
        this.saldo = 0;
        this.status = false;
    }

    // Métodos

    public void estadoAtual() {
        System.out.println("Conta: " + this.getNumConta());
        System.out.println("Tipo: " + this.getTipo());
        System.out.println("Dono: " + this.getDono());
        System.out.println("Saldo: " + this.getSaldo());
        System.out.println("Status: " + this.isStatus());

    }

    public void abrirConta(String tipo) {
        this.setTipo(tipo);
        this.setStatus(true);
        if (getTipo() == "cc") {
            this.setSaldo(50); // cp = conta poupança
        } else if (getTipo() == "cp") {
            this.setSaldo(150);
        }
        System.out.println("Conta Aberta com sucesso!");
    }

    public void fecharConta() {
        if (this.getSaldo() > 0) {
            System.out.println("Conta não pode ser fechada, a conta ainda tem saldo!");

        } else if (this.getSaldo() < 0) {
            System.out.println("Conta não pode ser fechada, a conta tem débito!");

        } else {
            this.setStatus(false);
            System.out.println("Conta fechada com sucesso!");

        }
    }

    public void depositar(float valor) {
        if (this.isStatus()) {
            this.setSaldo(this.getSaldo() + valor);
            System.out.println("Depósito realizado na conta de " + this.getDono());
        } else {
            System.out.println("Erro! Deposito falhou Conta fechada!");

        }
    }

    public void sacar(float valor) {
        if (this.isStatus()) {
            if (this.getSaldo() >= valor) {
                this.setSaldo(getSaldo() - valor);
                System.out.println("Saque realizado na conta de " + this.getDono());

            } else {
                System.out.println("Saldo insuficiente para saque!");

            }
        } else {
            System.out.println("Erro! Deposito falhou Conta fechada!");

        }
    }

    public void pagarMensal(int valor) {
        valor = 0;
        if (this.getTipo() == "cc".toLowerCase()) {
            valor = 12;
        } else if (this.getTipo() == "cp".toLowerCase()) {// cp = conta poupança
            valor = 20;
        }
        if (this.isStatus()) {
            this.setSaldo(this.getSaldo() - valor);
            System.out.println("Mensalidade paga com sucesso por " + this.getDono());

        } else {
            System.out.println("Erro! Conta fechada!");

        }
    }

    // Métodos Getter e Setter
    public int getNumConta() {
        return numConta;
    }

    public void setNumConta(int numConta) {
        this.numConta = numConta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDono() {
        return dono;
    }

    public void setDono(String dono) {
        this.dono = dono;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

}
