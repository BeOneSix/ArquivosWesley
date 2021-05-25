import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController larguraController = TextEditingController();
  TextEditingController comprimentoController = TextEditingController();
  String resp = "";


  imc() {
    int altura = int.parse(this.alturaController.text);
    int largura = int.parse(this.larguraController.text);
    int comprimento = int.parse(this.comprimentoController.text);
    int volume = comprimento * altura * largura;
    this.resp = '$comprimento * $altura * $largura = $volume';
    return this.resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: alturaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => alturaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe a altura',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: larguraController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => larguraController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe a largura',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: comprimentoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => comprimentoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o comprimento',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(imc());
              setState(imc);
            },
            child: Text(
              'Volume',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            this.resp,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
