import servicesdb


class CreateTabelaAlunos:
    def __init__(self):

        try:
            # abertura de conexao e aquisição
            conn = servicesdb.ConectarDB()
            # execução de comandos para a  criação de tabela
            sql_comando = ''' CREATE TABLE IF EXISTS alunos(
                            id INTEGER NOT NULL,
                            cpf INTEGER NOT NULL,
                            nome TEXT NOT NULL,
                            email TEXT NOT NULL,
                            matricula INTEGER NOT NULL,                      
                            disciplina_id INTEGER NOT NULL,                                                
                            PRIMARY KEY(id),
                            FOREIGN KEY(disciplina_id) REFERENCES disciplinas(codigo) 
                        ); '''

            conn.cursordb.execute(sql_comando)
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:

            print("Erro de banco de dados - alunos", err)

        finally:

            #fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.conexaodb.close()

            print("Criado com sucesso tabela aluno!")
