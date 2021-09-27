// types
// interfaces

interface IAnimal {
    nome: string;
    tipo: 'terrestre' | 'aquático';
    fazerSom(alturaEmDecibeis: number): void;
    domestico: boolean;
}

// como funciona o type
/*
type IAnimal = {
    nome: string;
    tipo: 'terrestre' | 'aquático';
    fazerSom(alturaEmDecibeis: number): void;
}
*/

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
/*
type IDomestico = IFelinos | ICanino;

const animal: IDomestico = {
    domestico: true,
    nome: 'Cachorro',
    porte: 'pequeno',
    tipo: 'terrestre',
    visaoNoturna: false

}
*/
/*const  soma = (a: number, b: number) => {
    return a + b;
}
console.log(soma(5, 0));*/