import servicesdb
from moldes_db import Disciplinasdb

'''Intanciando a Classe do Script models_db'''
disciplinas = Disciplinasdb()
lista = []
for i in range(len(disciplinas.codigo)):
    """ colcoar os valores em lista"""
    lista.append(
        (disciplinas.id[i], disciplinas.nome[i], disciplinas.codigo[i]))


class InsertTabelaDisciplina:
    def __init__(self):

        try:
            ''' abertura de conexao e aquisição'''
            conn = servicesdb.ConectarDB()
            conn.conexaodb.execute('PRAGMA foreign_keys=on')

            sql_comando = ''' INSERT INTO disciplinas(id, nome, codigo) 
                                        VALUES(?,?,?); '''

            ''' executando o comeando para inserir varias vezes os dados'''
            conn.cursordb.executemany(sql_comando, lista)
            disciplinas.id = conn.cursordb.lastrowid
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:

            print("Erro de banco de dados - disciplinas", err)

        finally:

            # fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.conexaodb.close()

        print("dados inseridos  com sucesso da tabela disciplinas!")
