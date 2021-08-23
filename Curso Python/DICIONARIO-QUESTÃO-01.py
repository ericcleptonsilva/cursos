"""DICIONÁRIOS"""
"""Questão 01"""
#dicionario
D={'Alano':(7.5,8.0,6.5),'Denise':(9.0,8.5,9.5),'Ana Paula':(3.5,1.0,6.5)}
#variáveis
media = 7.0
soma = 0
#laço da lista separando a chave e o valor do dicionario
for alunos, notas in (D.items()):
    #soma as notas de cada chave
    soma = sum(notas)
    #divide as notas pela quantidade de valore
    soma = soma / len(notas)
    #uma codição pra imprimir os alunos aprovador por media acima de 7.0
    if (soma > media):
        print(alunos+" Aprovada com nota:%.1f" %soma)
    
