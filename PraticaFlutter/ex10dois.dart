import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resp = "";
  String result = "";
  
  imc() {
    int peso = int.parse(this.pesoController.text);
    double altura = double.parse(this.alturaController.text);
    double imc = peso / (altura * altura);

    if(imc < 16) resp = 'magreza grave';
    else if (imc < 17) resp = 'magreza moderada';
    else if (imc < 18.5) resp = 'magreza leve';
    else if (imc < 25) resp = 'saudável';
    else if (imc < 30) resp = 'sobrepeso';
    else if (imc < 35) resp = 'obesidade grau I';
    else if (imc < 40) resp = 'Obesidade grau II (severa)';
    else if (imc >= 40) resp = 'obesidade grau III (mórbida)';

    this.result = "IMC: " + imc.toStringAsFixed(2) + " \nClassificação: " + '$resp';

    return this.result;
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
              controller: pesoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => alturaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o peso',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: alturaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => pesoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe a altura',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(imc());
              setState(imc);
            },
            child: Text(
              'Calcular',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            this.result,
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
