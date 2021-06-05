import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  TextEditingController txtCelsius = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ler temperatura'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: txtCelsius,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => txtCelsius.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Digite a temperatura em graus Celsius'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RotaGenerica.caminhoDaRota,
                arguments: ArgumentosDaRota(double.parse(txtCelsius.text)),
              );
            },
            child: Text('Calcular'),
          ),
        ],
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';
  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado da conversão'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(50),
            child: Center(
              child: Text(
                'graus celcius: ${argumentos.tempCelsius.toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(50),
            child: Center(
              child: Text(
                'graus fahrenheit: ${(argumentos.tempCelsius * 1.8 + 32).toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArgumentosDaRota {
  double tempCelsius;
  ArgumentosDaRota(this.tempCelsius);
}
