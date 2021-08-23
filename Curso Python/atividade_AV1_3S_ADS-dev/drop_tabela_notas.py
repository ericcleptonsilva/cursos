import servicesdb


class DeleteTabelaNotas:
    def __init__(self):

        try:
            # abertura de conexao e aquisição
            conn = servicesdb.ConectarDB()
            # execução de comandos para a  criação de tabela
            sql_comando = ''' DROP TABLE notas;'''

            conn.cursordb.execute(sql_comando)
            conn.conexaodb.commit()
        except conn.conexaodb.DatabaseError as err:
            print("Erro de banco de dados - notas", err)
        finally:
            #fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.conexaodb.close()

            print("deletado com sucesso tabela notas!")
