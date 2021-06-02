import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: PrimeiraRota(),
    ));

class Mensagem {
  String etanol;
  String gasolina;
  Mensagem(this.etanol, this.gasolina);
  razao() => double.parse(etanol) / double.parse(gasolina);
  conclusao() {
    if (razao() < 0.7) {
      return 'Abasteça com Etanol';
    }
    return 'Abasteça com Gasolina';
  }
}

class PrimeiraRota extends StatefulWidget {
  PrimeiraRotaState createState() {
    return PrimeiraRotaState();
  }
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  String nota = '';
  final TextEditingController etanolController = TextEditingController();
  final TextEditingController gasolinaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: etanolController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => etanolController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'informe o preço do etanol'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: gasolinaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => gasolinaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço da gasolina',
              ),
            ),
          ),
          Text(
            '$nota',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Mensagem mensagem =
                  Mensagem(etanolController.text, gasolinaController.text);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SegundaRota(mensagem)),
              ).then((resposta) {
                setState(() {
                  nota = resposta;
                });
              });
            },
            child: Text('Ir para a Segunda Rota'),
          )
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Mensagem mensagem;
  SegundaRota(this.mensagem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Segunda Rota'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                '${mensagem.etanol} / ${mensagem.gasolina} = ${mensagem.razao()}',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${mensagem.conclusao()}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                child: Text('Ir para a Primeira Rota'),
                onPressed: () {
                  String resposta = '${mensagem.conclusao()}';
                  Navigator.pop(context, '$resposta');
                },
              )
            ],
          ),
        ));
  }
}
