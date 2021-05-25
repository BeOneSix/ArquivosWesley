import 'package:flutter/material.dart';

void main() {
  runApp(
    Row(
      textDirection: TextDirection.ltr,
      children: <Expanded>[
        Expanded(child: Image.network('https://picsum.photos/250?image=9'),
        ),
        Expanded(child: Image.network('https://picsum.photos/250?image=9'),
        ),
        Expanded(child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ],
    ),
  );
}