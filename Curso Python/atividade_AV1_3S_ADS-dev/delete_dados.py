import servicesdb
from moldes_db import *


class DeletaDados:
    def deletAlunos(self):
        #Abertura de conexão
        conn = servicesdb.ConectarDB()
        conn.conexaodb.execute('PRAGMA foreign_keys=on')

        sql_query = ''' delete from aluno where cpf = 123456; '''
        conn.cursordb.execute(sql_query)
        conn.conexaodb.commit()

        conn.cursordb.close()
        conn.conexaodb.close()
        print("Dados deletado com sucesso!")

    def deletDisciplinas(self):
        #Abertura de conexão
        conn = servicesdb.ConectarDB()
        conn.conexaodb.execute('PRAGMA foreign_keys=on')

        sql_query = ''' delete from disciplinas where codigo = 123456; '''
        conn.cursordb.execute(sql_query)
        conn.conexaodb.commit()

        conn.cursordb.close()
        conn.conexaodb.close()
        print("Dados deletado com sucesso!")

    def deletNotas(self):
        #Abertura de conexão
        conn = servicesdb.ConectarDB()
        conn.conexaodb.execute('PRAGMA foreign_keys=on')

        sql_query = ''' delete from notas where aluno_id = 123456; '''
        conn.cursordb.execute(sql_query)
        conn.conexaodb.commit()

        conn.cursordb.close()
        conn.conexaodb.close()
        print("Dados deletado com sucesso!")

#DeletaDados().deletAlunos()
#DeletaDados().deletDisciplinas()
#DeletaDados().deletNotas()
