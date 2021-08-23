
text01 = []
lista01 = []
with open("arquivo_01.txt", 'r') as arquivo_2:
    nome = arquivo_2.read()
    listanome = nome.split()
    # vai da adicionar cada nome na lista text01
for copiaN in listanome:
    text01.append(copiaN)
    #vai remover o nome que contar esse caracter especial //
    if '//' in copiaN:
        text01.remove(copiaN)
# vai adiciona novamente nomes na lista lista01 os nomer como a string formatada
for i in text01:
    lista01.append(f'{i}\n')

arquivo_3 = open("arquivo_02.txt", 'w')
arquivo_3.writelines(lista01)
