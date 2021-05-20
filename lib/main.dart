import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bytebank',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        body: Column(
          children: [
            Image.asset('images/bytebank_logo.png'),
            Container(
              height: 100,
              width: 120,
              color: Colors.green,
              child: Column(
                children: [
                  Icon(Icons.people),
                  Text('Contacts'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
