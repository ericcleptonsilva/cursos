"""DICIONÁRIOS"""
"""Questão 02"""
#random foi importa para gera um numero aleatório
import random
#declaração de variavel
agenda = {}
chave = 0
#um For para adicionar um determinado de dados 
for i in range(4):
    #gera a chave randomicamente
    chave = int(random.random()*100)
    #recebe os dados
    agenda['chave'] = chave
    agenda['nome'] = input("Digite seu nome: ")
    agenda['idade'] = str(input("Digite sua idade: "))
    agenda['telefone'] = str(input("Digite o número do celular: "))
    # imprimi os dados como chave sepera por "-"
    print(agenda['nome']+"-"+agenda['idade']+"-"+agenda['telefone'],)
