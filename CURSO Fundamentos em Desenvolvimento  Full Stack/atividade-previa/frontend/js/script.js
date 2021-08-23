
function getGrupoMembers(){
    const name = ["Edvaldo Alves de Macedo", 
    "Eric Clepton da SIlva"]
    .sort();
    return name;
}

function getFullName(name2){
 
//return name2.split(' '); //nessa linha retorna o nome comploeto seprado por virgula
//return name2.split(' ', 2); // nessa linha retorna com o 1º e 2º nome
return name2.split(' ', 1); //nessa linha retorna o 1º nome
}

function transform(){

return 0;
}

function onlyNumbersFrom(valeu){
    return valeu.split('').filter(letra => 
        !isNaN(letra) && letra !== ' '
    ).join(' ');


}

console.log("Função => GetGrupoMebers");
console.log(getGrupoMembers());

console.log("Função => getFullName");
console.log(getFullName('Eric Clepton da Silva'));

console.log("Função => transform");
console.log(transform());

console.log("Função => onlyNumbersFrom");
console.log(onlyNumbersFrom('2358946581 4klii6ffs 2358..m,mka!'));
