import servicesdb


class ConsultaTabelasAlunosId:
    def colsutAluId(self):
        lista = []
        try:
            ''' abertura de conexao e aquisição'''
            conn = servicesdb.ConectarDB()

            '''Consulta na tabelas disciplina na coluna codigo'''
            conn.cursordb.execute(''' SELECT id FROM alunos; ''')
            conn.conexaodb.commit()

            registros = conn.cursordb.fetchall()
            for registro in registros:
                lista.append(registro[0])
            return lista

        except conn.conexaodb.DatabaseError as err:

            print("Erro de banco de dados - disciplinas", err)

        finally:

            # fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
        print("Consulta de id alunos, realizado com sucesso!")

    def colsutDisId(self):
        lista = []
        try:
            ''' abertura de conexao e aquisição'''
            conn = servicesdb.ConectarDB()
            '''Consulta na tabelas disciplina na coluna codigo'''
            conn.cursordb.execute(''' SELECT disciplina_id FROM alunos; ''')
            conn.conexaodb.commit()
            registros = conn.cursordb.fetchall()
            for registro in registros:
                lista.append(registro[0])
            return lista

        except conn.conexaodb.DatabaseError as err:

            print("Erro de banco de dados - disciplinas", err)

        finally:

            # fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
        print("Consulta de disciplinas_id de alunos, realizado com sucesso!")
