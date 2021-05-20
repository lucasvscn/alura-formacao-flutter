import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bytebank',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Text('Deliver features faster'),
            Text('Craft beautiful UIs'),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
