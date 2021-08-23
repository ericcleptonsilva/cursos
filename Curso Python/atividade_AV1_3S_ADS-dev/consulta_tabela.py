import servicesdb


class ConsultaTabela:
    def __init__(self):

        try:
            ''' abertura de conexao e aquisição'''
            conn = servicesdb.ConectarDB()
            '''Consulta na tabelas disciplina na coluna codigo'''
            conn.cursordb.execute(
                ''' SELECT a.nome, a.matricula, d.nome, n.nota1, n.nota2, n.nota3 FROM alunos a
                            JOIN notas n on n.aluno_id = a.id
                            JOIN disciplinas d on a.disciplina_id =  d.codigo;
                            ''')
            conn.conexaodb.commit()
            self.registros = conn.cursordb.fetchall()

        except conn.conexaodb.DatabaseError as err:

            print("Erro de banco de dados - disciplinas", err)

        finally:

            # fechamento de conexão
            if conn.conexaodb:
                conn.cursordb.close()
        print("dados inseridos  com sucesso da tabela disciplinas!")

        ''' Tratamento dos dados'''

    def ExibeDados(self):
        print('\n Consulta ao Banco de Dados\n')
        print('Dados da tabela - Resultato dos alunos:')
        print('='*100)
        print('{:<16} {:<13} {:<18} {:<9} {:<9} {:<10} {:>1} '.format(
            'NOME ALUNO',
            'MATRICULA',
            'DISCIPLINAS',
            'NOTA-01',
            'NOTA-02',
            'NOTA-03',
            'SITUAÇÃO'
        ))
        print('-' * 100)

        for lista in self.registros:
            '''Função para calcular as notas e exibir APROVADO ou REPROVADO'''
            notas = (lista[3] + lista[4] + lista[5]) / 3
            if notas > 6:
                listaN = 'APROVADO'
            else:
                listaN = 'REPROVADO'
            print('{:<16} {:<10} {:<23}{:<10}{:<10}{:<10}{}'.format(
                *lista, listaN))
        print()

        print()
        print('='*100)
        if (len(self.registros) == 1):
            text = 'registro'
        text = 'registros'
        print('Encontrado: {} {}'.format(len(self.registros), text))
        print('\n')
