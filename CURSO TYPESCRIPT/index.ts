// types
// interfaces

interface IAnimal {
    nome: string;
    tipo: 'terrestre' | 'aquático';
    fazerSom(alturaEmDecibeis: number): void;
}

interface Ifelinos extends IAnimal{
    visaoNoturna: boolean;
}
const animal: IAnimal = {
    nome: 'Elefante',
    tipo: 'terrestre',
    fazerSom: (alturaEmDecibeis) => ('${alturaEmDecibeis}dB')
}
animal.fazerSom(55);

const felinos: Ifelinos = {
    nome: 'Onça',
    tipo: 'terrestre',
    visaoNoturna: true,
    fazerSom: (alturaEmDecibeis) => ('${alturaEmDecibeis}dB')
}
felinos.fazerSom(10);

/*const  soma = (a: number, b: number) => {
    return a + b;
}
console.log(soma(5, 0));*/