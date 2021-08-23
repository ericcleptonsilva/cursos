"""LAÇOS DE REPETIÇÃO"""
"""Questão 02"""
#Programa para imprimir números impar e somar os números par.

#na linha a baixo é o código para definir um valor positivo 
d = int(input("Digite uma valor inteiro e positivo: "))
#na a linha baixo temos uma condição para o programa executar se o valor for positivo 
if (d >= 0):
        print("Números impares!")
        #lista inicia como vazia
        soma = []
        """"um For para gerar varios números deteminado pelo 
        usuário(exemplo: o Usuário digitou o número  10 o ranger vai de  0 a 9)"""
        for x in range(0,d,1):
                #uma condicondição para separar os numero impar e par
                if (x % 2  == 0):
                        #imprimi os números impar
                        print(x+1,)
                        #adiciona os números pares na lista
                        soma.append(int(x))
        #impirmi e soma os números par                
        print("A soma dos números par: %.d" % sum(soma))
else:
        print("Desculpe o número que você digitou e negativo!")
