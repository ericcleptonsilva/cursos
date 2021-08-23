"""LISTA"""
"""Questão 02"""
#declarando as variáveis 
R = []
re = ''
total = 0
#entrada de Dados
print("Responda [S] sim e [N] não!")
R.append(input("Telefonou para a vítima? "))
R.append(input("Esteve no local do crime? "))
R.append(input("Mora perto da vítima? "))
R.append(input("Tinha dívidas com a vítima? "))
R.append(input("Já trabalhou com a vítima? "))
#convertendo as lista R em string
re = ''.join(R)
#modificando as letras minúsculas em maiúsculas
re = re.upper()
#contanto quantas letras S tem na string
total = re.count("S")
# as codições pra as respota na entrada de dados
if (total == 2):
    print("Você é um suspeito de assassinato!")
elif (total == 3 or total == 4):
    print("Você é um cúmplice de assassinato!")
elif (total == 5):
    print("Você é o assassino!")
else:
    print("Você é inocente")
