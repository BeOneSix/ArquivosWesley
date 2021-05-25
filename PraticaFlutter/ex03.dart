import 'package:flutter/material.dart';

void main() {
  String nome = 'Ana';
  String dia = "Segunda-Feira";
  runApp(
    Center(
      child: RichText(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Olá, ",
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.amber,
          ),
            children: <TextSpan>[
              TextSpan(
                text: "$nome",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            decoration: TextDecoration.underline,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dotted,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.lightGreen,
          ),
              ),
              TextSpan(text: '!'),
              TextSpan(
                text: '\nHoje é $dia',
                style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            decoration: TextDecoration.underline,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dotted,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.lightBlueAccent,
                ),
                ),
                
                TextSpan(
                  text: '\nBom dia!',
                   style: TextStyle(
            color: Colors.green,
            fontSize: 30,
            decoration: TextDecoration.underline,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dotted,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.yellowAccent,
                ),
                ),
            ],
          ),

        ),
      ),
    );
}
