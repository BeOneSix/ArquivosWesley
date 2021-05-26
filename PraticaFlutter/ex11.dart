import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álbum"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Descricao(
                        'Nova York',
                        'Nova York, EUA',
                        'Nova Iorque ou Nova York (em inglês: New York) é a cidade mais populosa dos Estados Unidos[3] e o centro da Região Metropolitana de Nova Iorque, uma das áreas metropolitanas mais populosas do mundo localizada na Região Nordeste dos Estados Unidos.'),
                  ),
                ),
                child: Image.network(
                    "https://images.pexels.com/photos/2224861/pexels-photo-2224861.png?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Descricao(
                        'Rio de Janeiro',
                        'Rio de Janeiro, BR',
                        'Rio de Janeiro (frequentemente referida simplesmente como Rio[7]) é um município brasileiro, capital do estado homônimo, situado no Sudeste do país. Maior destino turístico internacional no Brasil,[8] da América Latina e de todo o Hemisfério Sul,[9] a capital fluminense é a cidade brasileira mais conhecida no exterior.'),
                  ),
                ),
                child: Image.network(
                    "https://images.pexels.com/photos/351283/pexels-photo-351283.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Descricao(
                        'Belo Horizonte',
                        'Belo Horizonte, BR',
                        'Belo Horizonte é um município brasileiro e a capital do estado de Minas Gerais. Sua população estimada pelo IBGE para 1.º de julho de 2020 era de 2 521 564 habitantes, sendo o sexto município mais populoso do país, o terceiro da Região Sudeste e primeiro de seu estado.'),
                  ),
                ),
                child: Image.network(
                    "https://images.pexels.com/photos/3386540/pexels-photo-3386540.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Descricao(
                        'São Paulo',
                        'São Paulo, BR',
                        'São Paulo (pronuncia-se AFI: [sɐ̃w̃ ˈpawlu] Loudspeaker.svg ouça) é um município brasileiro, capital do estado homônimo e principal centro financeiro, corporativo e mercantil da América do Sul.[10] É a cidade mais populosa do Brasil, do continente americano, da lusofonia e de todo o hemisfério sul.'),
                  ),
                ),
                child: Image.network(
                    "https://images.pexels.com/photos/2147288/pexels-photo-2147288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Descricao('Salvador', 'Salvador, BR',
                        'Salvador é um município brasileiro e capital do estado da Bahia. Situada na Zona da Mata da Região Nordeste do Brasil, Salvador é notável em todo o país pela sua gastronomia, música e arquitetura,[9] reconhecidas também internacionalmente.'),
                  ),
                ),
                child: Image.network(
                    "https://images.pexels.com/photos/4172523/pexels-photo-4172523.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Descricao extends StatelessWidget {
  String tituloAppBar;
  String tituloTexto;
  String texto;

  Descricao(this.tituloAppBar, this.tituloTexto, this.texto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.tituloAppBar),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                this.tituloTexto,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  this.texto,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(30, 100, 5, 80),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Voltar',
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
