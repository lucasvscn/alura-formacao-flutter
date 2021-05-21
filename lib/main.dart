import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'models/contact.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(BytebankApp());

  // insere um registro no db
  save(Contact(name: 'alex', accountNumber: 1000)).then((db) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
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
      home: Dashboard(),
    );
  }
}
