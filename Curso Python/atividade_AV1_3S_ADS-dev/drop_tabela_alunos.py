from servicesdb import *


class DeleteTabelaAlunos:
    def __init__(self):

        try:
            # abertura de conexao e aquisição
            conn = ConectarDB()
            # execução de comandos para a  criação de tabela
            sql_comando = ''' DROP TABLE alunos;'''

            conn.cursordb.execute(sql_comando)
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:
            print("Erro de banco de dados - alunos", err)
        finally:
            #fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.cursordb.close()

            print("Deletado com sucesso tabela alunos!")
