from servicesdb import *


class DeleteTabelaDisciplinas:
    def __init__(self):

        try:
            # abertura de conexao e aquisição
            conn = ConectarDB()
            # execução de comandos para a  criação de tabela
            sql_comando = ''' DROP TABLE disciplinas;'''

            conn.cursordb.execute(sql_comando)
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:
            print("Erro de banco de dados - disciplinas", err)
        finally:
            # fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.conexaodb.close()

            print("Deletado com sucesso tabela disciplinas!")
