import servicesdb
from moldes_db import Notasdb

lista = []
notas = Notasdb()
for i in range(len(notas.aluno_id)):
 lista.append((
     notas.aluno_id[i],
     notas.disciplina_id[i],
     notas.nota_01[i],
     notas.nota_02[i],
     notas.nota_03[i],
 ))


class InsertTabelaNotas:
    def __init__(self):

        try:
            ''' abertura de conexao e aquisição'''
            conn = servicesdb.ConectarDB()

            conn.cursordb.execute('PRAGMA foreign_keys=on')
            sql_comando = ''' INSERT INTO notas(
                                                aluno_id,
                                                disciplina_id, 
                                                nota1, 
                                                nota2, 
                                                nota3
                                                ) 
                                        VALUES( ?,?,?,?,?)
            '''
            conn.cursordb.executemany(sql_comando, lista)
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:

            print("Erro de banco de dados - disciplinas", err)

        finally:

            # fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.conexaodb.close()

        print("dados inseridos  com sucesso da tabela disciplinas!")
