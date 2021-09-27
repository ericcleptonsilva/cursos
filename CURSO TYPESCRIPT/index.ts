// Criando variáveis com propriedade readonly e private
interface AnimalDomestico{
    nome: string;
    idade: number;
    parqueFavorito?: string;
}
type CachorroSomenteLeitura = {
    readonly [k in keyof AnimalDomestico]-?: AnimalDomestico[k];
}

class MeuCachorro implements CachorroSomenteLeitura{
    nome: string;
    idade: number;
    parqueFavorito: string;

    constructor(nome, idade) {
        this.nome,
        this.idade
    }

}


// utilizando o caracter "?" para variáveis opcionais
/*
interface IUsuario{
    id: string;
    email: string;
    cargo?: 'Gerente' | 'Coordenador' | 'Supervisor' | 'Funcionario';
}



function redirecione(usuario: IUsuario) { 

    if (usuario.cargo) {
      // redirecionar(usuario.cargo)
    }
    // redirecionar para a área do usuário
}
*/

// Desenvolvendo condicionais a parti de parâmetros
/*
interface IUsuario{
    id: string;
    email: string;
}
interface IAdmin extends IUsuario {
    cargo: 'Gerente' | 'Coordenador' | 'Supervisor';
}


function redirecione(usuario: IUsuario | IAdmin) {
    if ('cargo' in usuario) {
        if (usuario.cargo == 'Gerente') {
            // redirecionar para a área da administração

            
        }
    }
    // redirecionar para a área do usuário
}
*/

//Generic types
/*
function adicionaApendiceLista<T>(array: T[], value: T) {
    return array.map(() =>  value);
    
}

adicionaApendiceLista(["a"], 'a');
*/
// Tratando a tag input
/*
const input = document.getElementById('input') as HTMLInputElement;

input.addEventListener('input', (event) => {
    const input = event.currentTarget as HTMLInputElement;
    console.log(input.value);
});
*/

// types
// interfaces
/*
interface IAnimal {
    nome: string;
    tipo: 'terrestre' | 'aquático';
    fazerSom(alturaEmDecibeis: number): void;
    domestico: boolean;
}

// como funciona o type

type IAnimal = {
    nome: string;
    tipo: 'terrestre' | 'aquático';
    fazerSom(alturaEmDecibeis: number): void;
}


interface IFelinos extends IAnimal{
    visaoNoturna: boolean;
}
const animal1: IAnimal = {
    nome: 'Elefante',
    tipo: 'terrestre',
    fazerSom: (alturaEmDecibeis) => ('${alturaEmDecibeis}dB'),
    domestico: false
}

interface ICanino extends IAnimal{
    porte: 'pequeno' | 'medio' | 'grande';

}

animal1.fazerSom(55);

const felinos: IFelinos = {
    nome: 'Onça',
    tipo: 'terrestre',
    visaoNoturna: true,
    fazerSom: (alturaEmDecibeis) => ('${alturaEmDecibeis}dB'),
    domestico: false
}
felinos.fazerSom(10);
//como funciona types

type IDomestico = IFelinos | ICanino;

const animal: IDomestico = {
    domestico: true,
    nome: 'Cachorro',
    porte: 'pequeno',
    tipo: 'terrestre',
    visaoNoturna: false

}

/*const  soma = (a: number, b: number) => {

    return a + b;
}
console.log(soma(5, 0));
*/