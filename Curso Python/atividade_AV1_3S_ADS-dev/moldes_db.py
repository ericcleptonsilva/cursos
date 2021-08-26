
from repositorio_alunos import*
from repositorio_disciplinas import *
from repositorio_notas import *
from consulta_tabelas_alunosId import *
from consulta_tabela_disciplina_id import *

import random


class Alunosdb:
    def __init__(self):
        self.lista_d = []
        self.id = None
        self.cpf = RepoAlunos().gen_Cpf()
        self.nome = RepoAlunos().gen_nomesAlunos()
        self.email = RepoAlunos().gen_Email()
        self.matricula = RepoAlunos().gen_Matricula()
        self.disciplina_id = self.lista_d
        for i in range(len(self.cpf)):
            d = random.choice(ConsultaTabelaDisciplinaId().colsutDisId())
            self.lista_d.append(d)


class Disciplinasdb(Alunosdb):
    def __init__(self, id, nome, codig):
        super().__init__()
        self.id = id
        self.nome = nome  # RepoDisciplinas().gen_nome()
        self.codigo = RepoDisciplinas().gen_codigo()


class Notasdb:
    def __init__(self):
        self.aluno_id = ConsultaTabelasAlunosId().colsutAluId()
        self.disciplina_id = ConsultaTabelasAlunosId().colsutDisId()
        self.nota_01 = RepoNotas().gen_notas()
        self.nota_02 = RepoNotas().gen_notas()
        self.nota_03 = RepoNotas().gen_notas()
