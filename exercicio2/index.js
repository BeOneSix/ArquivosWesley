class Veiculo{
    #chassi;
    #placa;

    constructor(chassi, placa){
        this.#chassi = chassi;
        this.#placa = placa;
    }

    set setChassi(chassi){
        this.#chassi = chassi;
    }
    get getChassi(){
        return this.#chassi;
    }

    set setPlaca(placa){
        this.#placa = placa;
    }

    get getPlaca(){
        return this.#placa;
    }
}


window.onload = function(){
    let veiculos = new Array ();

    let cont = 0;
    
    while(true){
        let chassi = prompt("Chassi");
        let placa = prompt("Placa");
    
        let veicul = new Veiculo(chassi, placa);
    
        if(chassi==null || placa ==null){
            break;
        }
    
        veiculos[cont] = veicul;
        cont++;
    }
    
    let text = "";
    
    for(let x = 0; x<cont;x++){
        text = text + `Chassi = ${veiculos[x].getChassi}  Placa = ${veiculos[x].getPlaca}<br>`;
    }
    
    document.getElementById("texto").innerHTML = text;
}
