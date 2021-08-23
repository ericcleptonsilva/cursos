from tkinter import *

root = Tk()
root.title("Calculadora simples")

e = Entry(root, width = 35, borderwidth = 5)
e.grid(row = 0, column = 0, columnspan = 3, padx = 10, pady = 10)

def botao_click(numero):
    atual = e.get()
    e.delete(0, END)
    e.insert(0, str(atual) + str(numero))

def botao_limpar():
    e.delete(0, END)

def botao_adicionar():
    primeiro_numero = e.get()
    global g_num
    global operacao
    operacao = "adicionar"
    g_num =int(primeiro_numero)
    e.delete(0, END)

def botao_igual():
    segundo_numero = e.get()
    e.delete(0, END)
    if operacao == "adicionar":
        e.insert(0, g_num + int(segundo_numero))

    if operacao == "subtracao":
        e.insert(0, g_num - int(segundo_numero))

    if operacao == "multiplicacao":
        e.insert(0, g_num * int(segundo_numero))

    if operacao == "divisao":
        e.insert(0, g_num / int(segundo_numero))

def botao_subtracao():
    primeiro_numero = e.get()
    global g_num
    global operacao
    operacao = "subtracao"
    g_num = int(primeiro_numero)
    e.delete(0, END)

def botao_multiplicacao():
    primeiro_numero = e.get()
    global g_num
    global operacao
    operacao = "multiplicacao"
    g_num = int(primeiro_numero)
    e.delete(0, END)

def botao_divisao():
    primeiro_numero = e.get()
    global g_num
    global operacao
    operacao = "divisao"
    g_num = int(primeiro_numero)
    e.delete(0, END)
# define os botões
# lamdba
botao_1 = Button(root, text = "1", padx = 40, pady = 20, command = lambda: botao_click(1))
botao_2 = Button(root, text = "2", padx = 40, pady = 20, command = lambda: botao_click(2))
botao_3 = Button(root, text = "3", padx = 40, pady = 20, command = lambda: botao_click(3))
botao_4 = Button(root, text = "4", padx = 40, pady = 20, command = lambda: botao_click(4))
botao_5 = Button(root, text = "5", padx = 40, pady = 20, command = lambda: botao_click(5))
botao_6 = Button(root, text = "6", padx = 40, pady = 20, command = lambda: botao_click(6))
botao_7 = Button(root, text = "7", padx = 40, pady = 20, command = lambda: botao_click(7))
botao_8 = Button(root, text = "8", padx = 40, pady = 20, command = lambda: botao_click(8))
botao_9 = Button(root, text = "9", padx = 40, pady = 20, command = lambda: botao_click(9))
botao_0 = Button(root, text = "0", padx = 40, pady = 20, command = lambda: botao_click(0))
botao_limpar = Button(root, text = "Limpar", padx = 79, pady = 20, command = botao_limpar)
botao_adicionar = Button(root, text = "+", padx = 40, pady = 20, command = botao_adicionar)
botao_igual = Button(root, text = "=", padx = "91", pady = 20, command = botao_igual)
botao_subtracao = Button(root, text = "-", padx = "40", pady = 20, command = botao_subtracao)
botao_multiplicacao = Button(root, text = "*", padx = "40", pady = 20, command = botao_multiplicacao)
botao_divisao = Button(root, text = "/", padx = "40", pady = 20, command = botao_divisao)
# enviar o botão para a tela

botao_1.grid(row = 3, column = 0)
botao_2.grid(row = 3, column = 1)
botao_3.grid(row = 3, column = 2)

botao_4.grid(row = 2, column = 0)
botao_5.grid(row = 2, column = 1)
botao_6.grid(row = 2, column = 2)

botao_7.grid(row = 1, column = 0)
botao_8.grid(row = 1, column = 1)
botao_9.grid(row = 1, column = 2)

botao_0.grid(row = 4, column = 0)
botao_limpar.grid(row = 4, column = 1, columnspan = 2)

botao_adicionar.grid(row = 5, column = 0)
botao_igual.grid(row = 5, column = 1, columnspan = 2)

botao_subtracao.grid(row = 6, column = 0)
botao_multiplicacao.grid(row = 6, column = 1)
botao_divisao.grid(row = 6, column = 2)

root.mainloop()