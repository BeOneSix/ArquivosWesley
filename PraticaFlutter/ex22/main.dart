import 'package:flutter/material.dart';

void main() {
  return runApp(Aplicativo());
}

class Produto {
  int id;
  String url, nome, descricao;
  double preco;
  Produto({
    required this.id,
    required this.url,
    required this.nome,
    required this.descricao,
    required this.preco,
  });
  static List<Produto> getProdutos() {
    return [
      Produto(
        id: 1,
        url: 'https://picsum.photos/250?image=9',
        nome: 'Notebook',
        descricao: 'Notebook Dell Inspiron I15 Intel 8GB 1TB 15,6" Preto',
        preco: 30109.98,
      ),
      Produto(
        id: 2,
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3VKlU2vOqECi-3GaGNSz8WAFMt3RORCeFRBplic7toYEljxcjhzORF1QpOmHyr_7ZP9k&usqp=CAU',
        nome: 'Bolo',
        descricao: 'Bolo em camadas com cobertura de frutas e nozes',
        preco: 15.19,
      ),
      Produto(
        id: 3,
        url:
            'https://lh3.googleusercontent.com/proxy/JmHBIlf27AKTqPIRg6bg66fROE8lunHWjy8dDZ3IO0UooDoWgcSta_AI11WCc9Hbs15sPELBEG0V0632VqgbxdAOdhBX3fDXyMALkzCpbOWs0pNZt98SxAsLJSwnk1IVRPgsmwuYMvVuo-Sl8_PUTKQ',
        nome: 'Torre e aerogerador',
        descricao: 'Torre e aerogerador - de energia eólica',
        preco: 50125.47,
      ),
    ];
  }
}

class ListaMenu {
  static List<DropdownMenuItem<Produto>> getListaProdutosMenu(List produtos) {
    List<DropdownMenuItem<Produto>> listaProdutosMenu = []; //Nova lista.
    for (Produto produto in produtos) {
      listaProdutosMenu.add(
        DropdownMenuItem(
          value: produto,
          child: Text(produto.nome),
        ),
      );
    }
    return listaProdutosMenu;
  }
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de DropdownMenu'),
        ),
        body: Center(
          child: MenuSuspenso(),
        ),
      ),
    );
  }
}

class MenuSuspenso extends StatefulWidget {
  MenuSuspensoState createState() {
    return MenuSuspensoState();
  }
}

class MenuSuspensoState extends State<MenuSuspenso> {
  Produto? produtoSelecionado;
  List<DropdownMenuItem<Produto>>? listaProdutosMenu;
  /*O método initState() gera o estado inicial do widget
 quando um objeto da classe é instanciado.*/
  @override
  void initState() {
    listaProdutosMenu = ListaMenu.getListaProdutosMenu(
      Produto.getProdutos(),
    );
    produtoSelecionado = listaProdutosMenu![0].value;
    super.initState();
  }

  aoSelecionarProduto(Produto? produtoSelecionado) {
    setState(
      () {
        this.produtoSelecionado = produtoSelecionado;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Produto:'),
        DropdownButton(
          value: this.produtoSelecionado,
          items: this.listaProdutosMenu,
          onChanged: this.aoSelecionarProduto,
        ),
        Text('Produto selecionado: ${this.produtoSelecionado!.nome}'),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image(
            image: NetworkImage(this.produtoSelecionado!.url),
            height: 250,
            width: 250,
          ),
        ),
        Text('${this.produtoSelecionado!.descricao}'),
        Padding(
            padding: EdgeInsets.all(8),
            child: Text('${this.produtoSelecionado!.preco}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple)))
      ],
    );
  }
}
