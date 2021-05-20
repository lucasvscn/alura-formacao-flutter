import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormulatioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  /// requer [BuildContext] para manter uso de [SnackBar] ao final da criação.
  void _criaTransferencia(BuildContext context) {
    // int.tryParse() usado originalmente.
    //
    // no Dart 2.12 este método retorna tipo int? que é incompatível
    // com API da aplicação.
    //
    // bloco try-catch foi  necessário, uma vez que int.parse()
    // dispara uma excessão caso valor do parâmetro seja Null.
    try {
      final int numeroConta = int.parse(_controladorCampoNumeroConta.text);
      final double valor = double.parse(_controladorCampoValor.text);

      final transferenciaCriada = Transferencia(valor, numeroConta);

      // Scaffold.of(context).showSnackBar() foi depreciado em
      // favor de ScaffoldMessenger.of(context).showSnackBar()
      // (estou usando Flutter 2.2.0)
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('$transferenciaCriada'),
      //   ),
      // );

      Navigator.pop(context, transferenciaCriada);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icon(Icons.monetization_on),
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }
}
