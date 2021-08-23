import servicesdb


class UpdateTalas:
    def updateAlunos(self):
        #Abertura de conexão
        conn = servicesdb.ConectarDB()
        conn.conexaodb.execute('PRAGMA foreign_keys=on')

        sql_query3 = ''' update alunos set disciplina_id = :dis_id where cpf = :cpf; '''
        conn.cursordb.execute(sql_query3, {'dis_id': None, 'cpf': None})

        conn.conexaodb.commit()
        conn.cursordb.close()
        conn.conexaodb.close()
        print("Finalizado!")

    def updateDisciplina(self):
        #Abertura de conexão
        conn = servicesdb.ConectarDB()
        conn.conexaodb.execute('PRAGMA foreign_keys=on')

        sql_query3 = ''' update disciplinas set nome = :dis_nome where codigo = :codigo; '''
        conn.cursordb.execute(sql_query3, {'dis_nome': None, 'codigo': None})

        conn.conexaodb.commit()
        conn.cursordb.close()
        conn.conexaodb.close()
        print("Finalizado!")
