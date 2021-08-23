import PySimpleGUI as sg
from PySimpleGUI.PySimpleGUI import Print

sg.theme('DarkAmber')

class TelasPython:
    def __init__(self):
        # Layout
        layout = [
            [sg.Text('Nome', size=(5, 0)), sg.Input(
                size=(15, 0), key='nome', text_color='black')],
            [sg.Text('CPF', size=(5, 0)), sg.Input(
                size=(15, 0), key='cpf', text_color='black')],
            [sg.Button("Enviar Dados")],
            [sg.Output(size=(20, 10), text_color='black')],
        ]
        # janelas
        self.janela = sg.Window("Dados do Usuário").layout(layout)

    def iniciar(self):
        while True:
            # Extrair os dados da telas
            self.button, self.values = self.janela.Read()
            nome = self.values['nome']
            cpf = self.values['cpf']
            print(f'nome: {nome}')
            print(f'cpf: {cpf}')


tela = TelasPython()
tela.iniciar()
