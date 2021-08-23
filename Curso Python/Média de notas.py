nota1b = float(input("Digite a nota do 1º bismestre: "))
nota2b = float(input("Digite a nota do 2º bismestre: "))
media =(nota1b + nota2b) / 2
print("A nota do 1º bimestro é:",nota1b)
print("A nota do 1º bimestro é:",nota2b)
print("O resultado da Média final é",media)
if(media == 10):
 print("Aprovado com distinção!")
elif(media >=7.0):
 print("Aprovado!")
else:
 print("Reprovado!")
 print("Fim da Aplicação!")
