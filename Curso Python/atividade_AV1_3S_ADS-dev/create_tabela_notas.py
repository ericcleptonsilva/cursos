import servicesdb


class CreateTabelaNotas:
    def __init__(self):

        try:
            # abertura de conexao e aquisição
            conn = servicesdb.ConectarDB()
            # execução de comandos para a  criação de tabela
            sql_comando = ''' CREATE TABLE notas(
                            aluno_id INTEGER NOT NULL,
                            disciplina_id INTEGER NOT NULL,
                            nota1 REAL NOT NULL,                            
                            nota2 REAL NOT NULL,                            
                            nota3 REAL NOT NULL,
                            FOREIGN KEY(aluno_id) REFERENCES alunos(id),
                            FOREIGN KEY(disciplina_id) REFERENCES disciplinas(codigo)
                    
                
                );
            
            '''
            conn.cursordb.execute(sql_comando)
            conn.conexaodb.commit()

        except conn.conexaodb.DatabaseError as err:
            print("Erro de banco de dados - notas", err)
        finally:
            # fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
                conn.conexaodb.close()
            print("Criado com sucesso tabela Notas!")
