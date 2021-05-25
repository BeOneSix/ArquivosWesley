import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController num01Controller = TextEditingController();
  TextEditingController num02Controller = TextEditingController();
  String resp = "";
  somar() {
    int num01 = int.parse(this.num01Controller.text);
    int num02 = int.parse(this.num02Controller.text);
    int soma = num01 + num02;
    this.resp = '$num01 + $num02 = $soma';
    return this.resp;
  }

  subtrair() {
    int num01 = int.parse(this.num01Controller.text);
    int num02 = int.parse(this.num02Controller.text);
    int sub = num01 - num02;
    this.resp = '$num01 - $num02 = $sub';
    return this.resp;
  }

  multiplicar() {
    int num01 = int.parse(this.num01Controller.text);
    int num02 = int.parse(this.num02Controller.text);
    int mult = num01 * num02;
    this.resp = '$num01 * $num02 = $mult';
    return this.resp;
  }

  dividir() {
    int num01 = int.parse(this.num01Controller.text);
    int num02 = int.parse(this.num02Controller.text);
    double div = num01 / num02;
    this.resp = '$num01 / $num02 = $div';
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
              controller: this.num01Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o primeiro número',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num02Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o segundo número',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    print(somar());
                    setState(somar);
                  },
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    print(subtrair());
                    setState(subtrair);
                  },
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    print(multiplicar());
                    setState(multiplicar);
                  },
                  child: Text(
                    'X',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    print(dividir());
                    setState(dividir);
                  },
                  child: Text(
                    '/',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            this.resp,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
