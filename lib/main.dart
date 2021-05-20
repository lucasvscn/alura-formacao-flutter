import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    children: [
      Text('Deliver features faster', textDirection: TextDirection.ltr,),
      Text('Craft beautiful UIs', textDirection: TextDirection.ltr,),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain,
          child: FlutterLogo(),
        ),
      ),
    ],
  ));
}
