import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Column(
        textDirection: TextDirection.ltr,
        children: <Expanded>[
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // Permite aumentar o tamanho do logo.
              child: const FlutterLogo(),
            ),
          ),
          Expanded(
            child: Image.network('https://picsum.photos/250?image=25'),
          ),
          Expanded(
            child: Text(
              'Google Flutter',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
