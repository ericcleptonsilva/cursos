
import random
from consulta_tabelas_alunosId import *


aluno = ConsultaTabelasAlunosId()
listaId = aluno.colsutAluId()


class RepoNotas:
    def gen_notas(self):
        lista_n = [3, 0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
        lista_NN = []
        for i in range(len(listaId)):
            nota = random.choice(lista_n)
            lista_NN.append(nota)
        return lista_NN
