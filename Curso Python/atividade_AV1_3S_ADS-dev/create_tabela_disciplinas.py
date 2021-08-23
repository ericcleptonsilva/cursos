import servicesdb


class CreateTabelaDisciplinas:
    def __init__(self):

        try:
            # abertura de conexao e aquisição
            conn = servicesdb.ConectarDB()
            # execução de comandos para a  criação de tabela
            sql_comando = ''' CREATE TABLE disciplinas(
                            id INTEGER NOT NULL,
                            nome TEXT NOT NULL,
                            codigo INTEGER NOT NULL,                                                    
                            PRIMARY KEY(codigo)
                            );
                            '''

            conn.cursordb.execute(sql_comando)
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:
            print("Erro de banco de dados - disciplinas", err)
        finally:
            #fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.conexaodb.close()
            print("Criado com sucesso tabela disciplinas!")
