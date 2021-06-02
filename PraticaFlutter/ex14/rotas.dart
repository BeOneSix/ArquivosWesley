import 'package:flutter/material.dart';
import 'tela.dart';

class Rotas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => PrimeiraTela(),
      '/segunda': (context) => SegundaTela(),
      '/terceira': (context) => TerceiraTela(),
    });
  }
}
