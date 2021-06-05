import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 230,
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            accountName: Text("Ana"),
            accountEmail: Text("ana@ana.com.br"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text("Rota 01"),
            subtitle: Text("Siga para a rota 01."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, PrimeiraRota.caminhoDaRota);
            },
          ),
        ),
        SizedBox(
          height: 130,
          child: ListTile(
            leading: Icon(Icons.video_collection),
            title: Text("Rota 02"),
            subtitle: Text("Siga para a rota 02."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                RotaGenerica.caminhoDaRota,
                arguments: Argumentos('Segunda Rota', Colors.black),
              );
            },
          ),
        ),
        SizedBox(
          height: 130,
          child: ListTile(
            leading: Icon(Icons.analytics),
            title: Text("Rota 03"),
            subtitle: Text("Siga para rota 03."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                RotaGenerica.caminhoDaRota,
                arguments: Argumentos('Terceira Rota', Colors.purple.shade900),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeiraRota(),
      routes: {
        PrimeiraRota.caminhoDaRota: (context) => PrimeiraRota(),
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  static const caminhoDaRota = 'primeiraRota';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      drawer: Container(
        color: Colors.amber.shade400,
        child: CustomDrawer(),
      ),
      body: Center(
        child: const Text('Corpo'),
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = 'rotaGenerica';

  @override
  Widget build(BuildContext context) {
    Argumentos argumentos =
        ModalRoute.of(context)!.settings.arguments as Argumentos;

    return Scaffold(
      backgroundColor: argumentos.cor,
      appBar: AppBar(
        title: Text('${argumentos.msg}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: Center(
              child: Text(
                '${argumentos.msg}',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PrimeiraRota.caminhoDaRota,
                  );
                },
                child: Text('Voltar para a primeira rota!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Argumentos {
  String msg;
  Color? cor;
  Argumentos(this.msg, this.cor);
}
