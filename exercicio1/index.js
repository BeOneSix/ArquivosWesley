class Pessoa{

    #nome;

    constructor(nome){
        this.#nome = nome;
    }

    set setNome(nome){
        this.#nome = nome;
    }

    get getNome(){
        return this.#nome;
    }
}

class PessoaFisica extends Pessoa{
    #cpf;

    constructor(cpf){
        super();
        this.#cpf = cpf;
    }

    set setCpf(cpf){
        this.#cpf = cpf;
    }

    get getCpf(){
        return this.#cpf;
    }
}

class PessoaJuridica extends Pessoa{
    #cnpj;

    constructor(cnpj){
        super();
        this.#cnpj = cnpj;
    }

    set setCnpj(cnpj){
        this.#cnpj = cnpj;
    }

    get getCnpj(){
        return this.#cnpj;
    }
}

function cadastrar(){
    let nome = prompt("Nome");
    let doc = prompt("Cpf: ");
    
    let pessoaF = new PessoaFisica(doc);
    pessoaF.setNome = nome;
    
    nome = prompt("Nome");
    doc = prompt("Cnpj: ");
    
    let pessoaJ = new PessoaJuridica(doc);
    pessoaJ.setNome = nome;

    document.getElementById("demo").innerHTML= `Nome: ${pessoaF.getNome} <br>Cpf:  ${pessoaF.getCpf} <br><br<br>
    Nome:  ${pessoaJ.getNome} <br>CNPJ: ${pessoaJ.getCnpj}`;
}


