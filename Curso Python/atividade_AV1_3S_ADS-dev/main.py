from consulta_tabela import *
from insert_tados_notas import *
from insert_dados_alunos import *
from insert_dados_disciplina import *
from servicesdb import *

''' Importando os Scripts para criar tabelas'''
from create_tabela_alunos import *
from create_tabela_disciplinas import *
from create_tabela_notas import *
''' Importando os Scripts para deletar tabelas'''
#from drop_tabela_alunos import *
#from drop_tabela_disciplina import *
#from drop_tabela_notas import *
''' Importando os Scripts para criar tabelas'''


def main():
    """ 
    Intanciando a class para conexão 
    e criação do banco de dados
    """
    #ConectarDB()
    ''' 
    Iniciando as class da criação de tabela
    '''
    #CreateTabelaAlunos()
    #CreateTabelaDisciplinas()
    #CreateTabelaNotas()
    ''' 
    Iniciando as class para deletar tabela
    '''
    #DeleteTabelaAlunos()
    #DeleteTabelaDisciplinas()
    #DeleteTabelaNotas()
    '''
    Intanciando a class para inserindo dos 
    dados nas tabelas Aluno, Disciplinas e Notas
    '''
    #InsertTabelaAlunos()
    #InsertTabelaDisciplina()
    #InsertTabelaNotas()
    '''
    Intanciando a class para Consulta os dados
    '''
    ConsultaTabela().ExibeDados()


if __name__ == '__main__':
    main()
