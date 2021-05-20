import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  // receber Icon? em vez de IconData elimina necessidade de tratamento
  // adicional em função do null safety (Dart 2.12).
  final Icon? icone;
  final TextInputType? inputType;

  const Editor({
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
    this.inputType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
          icon: icone,
        ),
        keyboardType: inputType,
      ),
    );
  }
}
