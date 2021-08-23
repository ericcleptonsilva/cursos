#Quantidade de paises escrito no campeonato
paises = 30
#jogadores por Equipe dos paises
jogadores = 12
# multiplicado a quantidade de jogadores por cada time
participantes = paises * jogadores
#duas lista pra receber valores digitados
idade = []
peso = []
# quatro variavel abaixo iniciado com zero
jogador_idade = 0
jogador_peso = 0
time_idade = 0
time_peso = 0
pais = input("Nome do Pais:")
# uma laço em For para adicionar a idade e peso por de cada jogador
for i in range(jogadores):
        # as duas linha a baixo vai adicionar no final da lista os valores digitados
        idade.append(int(input("Digite a idade do jogador de Nº%.2d: " % (i+1))))
        peso.append(float(input("Digite o peso do jogador de Nº%.2d : " % (i+1))))
        #nas duas linhas a baixo, serão somado os valores
        jogador_idade = jogador_idade + idade[i]
        jogador_peso = jogador_peso + peso[i]
        time_idade = time_idade + idade[i]
        time_peso = time_peso + peso[i]
#nas duas linhas a baixo, sera calculado a media        
media_idade = jogador_idade / jogadores
media_peso = jogador_peso / jogadores
media_idade_todos = time_idade / paises *10
media_peso_todos = time_peso / paises *10
#nas ultimas linhas sera mostrado o resultado 
print("A média de idade dos jogadores do %s é %.2f" % (pais, media_idade))
print("A média de peso dos jogadores do %s é %.2f" % (pais, media_peso))
print("A média de idade de todos jogadores é %.2f" % media_idade_todos)
print("A média de peso de todos jogadores é %.2f" % media_peso_todos)



