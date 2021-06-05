import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RotaReal(),
      routes: {
        RotaCotacao.caminhoDaRota: (context) => RotaCotacao(),
        RotaResultado.caminhoDaRota: (context) => RotaResultado(),
      },
    );
  }
}

class RotaReal extends StatelessWidget {
  TextEditingController valorReal = TextEditingController();
  static const caminhoDaRota = '/real';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valor em Real'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: valorReal,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor em real',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, RotaCotacao.caminhoDaRota,
                    arguments: Argumentos(double.parse(valorReal.text)));
              },
              icon: Icon(Icons.navigate_next),
              label: const Text('Próximo'),
            ),
          ),
        ],
      ),
    );
  }
}

class RotaCotacao extends StatelessWidget {
  TextEditingController valorCotacao = TextEditingController();

  static const caminhoDaRota = '/cotacao';
  @override
  Widget build(BuildContext context) {
    Argumentos argumentos =
        ModalRoute.of(context)!.settings.arguments as Argumentos;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cotação'),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: valorCotacao,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Valor da cotação',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, RotaResultado.caminhoDaRota,
                          arguments: Argumentos(argumentos.valorReal,
                              double.parse(valorCotacao.text)));
                    },
                    label: const Text("Próximo"),
                    icon: Icon(Icons.navigate_next),
                  ),
                  margin: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RotaResultado extends StatelessWidget {
  _calcValor(double real, double? cotacao) {
    return real / cotacao!;
  }

  static const caminhoDaRota = '/resultado';
  @override
  Widget build(BuildContext context) {
    Argumentos argumentos =
        ModalRoute.of(context)!.settings.arguments as Argumentos;

    return Scaffold(
        appBar: AppBar(
          title: Text('Cotação'),
        ),
        body: Center(
          child: Text(
            'R\$ ${argumentos.valorReal} = US\$${_calcValor(argumentos.valorReal, argumentos.cotacao).toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
            ),
          ),
        ));
  }
}

class Argumentos {
  double valorReal;
  double? cotacao;

  Argumentos(this.valorReal, [this.cotacao]);
}
