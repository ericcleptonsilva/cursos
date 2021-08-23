
import random


class RepoAlunos:
    def __init__(self):

        with open("nome.txt", 'r') as Nome:
            self.lista_nome = Nome.readlines()
        with open("sobrenome.txt", 'r') as Sobrenome:
            self.lista_sobrenome = Sobrenome.readlines()

        if Nome.closed and Sobrenome.closed:
            print(f"Arquivo {Nome.name} e {Sobrenome.name} já foi fechado!")

    def gen_nomesAlunos(self):
        lista_N = []
        for i in range(len(self.lista_sobrenome)):
            nome = self.lista_nome[i]
            sobrenome = self.lista_sobrenome[i]
            lista_N.append(f'{nome.strip()} {sobrenome.strip()}')
        return lista_N

    def gen_Cpf(self):
        lista_C = []
        for i in range(len(self.lista_sobrenome)):
            cpf1 = random.randint(1, 999)
            cpf3 = random.randint(1, 999)
            cpf2 = random.randint(1, 999)
            digito = random.randint(1, 99)
            lista_C.append(int(f'{cpf1}{cpf2}{cpf3}{digito}'))
        return lista_C

    def gen_Email(self):
        lista_E = []
        for i in range(len(self.lista_sobrenome)):
            nome = self.lista_nome[i]
            sobrenome = self.lista_sobrenome[i]
            lista_E.append(
                f'{nome.strip()}{sobrenome.strip()}@gmail.com'.lower())
        return lista_E

    def gen_Matricula(self):
        lista_M = []
        for i in range(len(self.lista_sobrenome)):
            lista_M.append(random.randint(1, 9999))
        return lista_M
