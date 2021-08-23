import servicesdb
import moldes_db as models
import random

alunos = models.Alunosdb()

lista = []


class InsertTabelaAlunos:
    def __init__(self):
        try:
            # abertura de conexao e aquisição
            conn = servicesdb.ConectarDB()
            """ colcoar os valores da views do usuario"""

            for i in range(len(alunos.nome)):
                lista.append((
                    alunos.cpf[i],
                    alunos.nome[i],
                    alunos.email[i],
                    alunos.matricula[i],
                    alunos.disciplina_id[i],
                ))

            # execução de comandos para a  criação de tabela
            sql_comando = ''' INSERT INTO alunos(cpf, nome, email, matricula, disciplina_id) 
                                        VALUES(?,?,?,?,?); '''
            conn.cursordb.executemany(sql_comando, lista)
            alunos.id = conn.cursordb.lastrowid
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:

            print("Erro de banco de dados - insert tabela alunos", err)

        finally:

            # fechamento de conexão
            if conn.conexaodb:
                conn.conexaodb.close()
                conn.conexaodb.close()

            print("dados inseridos  com sucesso da tabela alunos!")
