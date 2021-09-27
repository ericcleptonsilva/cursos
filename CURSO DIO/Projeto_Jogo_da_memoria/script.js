let order = [];
let clickedOrder = [];
let score = 0;

/*
*   0 = blue
*   1 = vermelho
*   2 = amarelo
*   3 = verde
*/

const blue = document.querySelector('.blue');
const red = document.querySelector('.red');
const yellow = document.querySelector('.yellow');
const green = document.querySelector('.green');


// Cria ordem aleatória de cores
let shuffleOrder = () => {
    let colorOrder = Math.floor(Math.random() * 4);
    order[order.length] = colorOrder;
    clickedOrder = [];

    for (let i in order) {
        let elementColor = createColorElement(order[i]);
        lightColor(elementColor, Number(i) + 1);
       
    }
}

//Acende a próxima cor
let lightColor = (element, number) => {
    number = number * 500;
    setTimeout(() => {
            element.classList.add('selected')
    }, number - 500);

    setTimeout(() => {
            element.classList.remove('selected')
    }, number - 250);
}
//checa se os botoes são os mesmo na orde clicado
let checkOrder = () => {
    for (let i in clickedOrder) {
        if (clickedOrder[i] != order[i]) {
            gameOver();
            break;            
        }
    }
    if (clickedOrder.length == order.length) {
        alert(`Pontuação: ${score}\n Você acertou!\n Iniciando próximo nível`);
        nextLevel();        
    }
}

//função para o clique do jogador
let click = (color) => {
    clickedOrder[clickedOrder.length] = color;
    createColorElement(color).classList.add('selected');
    
    setTimeout(() => {
        createColorElement(color).classList.remove('selected');    
        checkOrder();
    }, 250);

}

// função que retorna a cor
let createColorElement = (color) => {
    if(color == 0) {
        return blue;
    } else if(color == 1) {
        return red;
    } else if (color == 2) {
        return yellow;
    } else if (color == 3) {
        return green;
    }
}

// função para avançar para o próximo nível do jogo
let nextLevel = () => {
    score++;
    shuffleOrder();
}

//função caso o jogador tenha perdido o jogo
let gameOver = () => {
    alert(`Pontuação: ${score}\nVocê perdeu o jogo!\nClique em OK para iniciar um novo jogo!`);
    order = [];
    clickedOrder = [];
    playGame();
}

// função para iniciar o jogo
let playGame = () => {
    alert('Bem vindo ao Genisis!\n Iniciando novo jogo!');
    score = 0;

    nextLevel();

}

blue.onclick = () => click(0);
red.onclick = () => click(1);
yellow.onclick = () => click(2);
green.onclick = () => click(3);

playGame();