import random

n = 5   # int(input("Digite um número:"))
arquivo = open("Lista_Nomes_altura.txt", 'w')
nomesL = list()

with open('Nome.txt', 'r') as Nome:
    lista_nome = Nome.readlines()

with open('Sobrenome.txt', 'r') as Sobrenome:
    lista_sobrenome = Sobrenome.readlines()
for i in range(n):
    nome = lista_nome[i]
    sobrenoem = lista_sobrenome[i]
    idade = random.randint(1, 100)
    altura = random.uniform(1.50, 2.00)
    # receber nomes linha por linha
    nome_completo = 'Nome: {} {}, idade: {} anos, altura: {:.2f}cm\n'.format(
        nome.strip(), sobrenoem.strip(), idade, altura)
    print(nome_completo)
    # adicionas as strings na lista nomesL
    nomesL.append(nome_completo)
arquivo.writelines(nomesL)

if Nome.closed and Sobrenome.closed:
    print()
    print(f"Arquivo {Nome.name} e {Sobrenome.name} já foi fechado!")
