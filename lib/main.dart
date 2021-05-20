import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bytebank',
      home: Scaffold(
        body: FormulatioTransferencia(),
      ),
    );
  }
}

class FormulatioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('clicou no Confirmar');

              // int.tryParse() usado originalmente.
              //
              // no Dart 2.12 este método retorna tipo int? que é incompatível
              // com API da aplicação.
              //
              // bloco try-catch foi  necessário, uma vez que int.parse()
              // dispara uma excessão caso valor do parâmetro seja Null.
              try {
                final int numeroConta =
                    int.parse(_controladorCampoNumeroConta.text);
                final double valor = double.parse(_controladorCampoValor.text);

                final transferenciaCriada = Transferencia(valor, numeroConta);

                debugPrint('transferenciaCriada: $transferenciaCriada');

                // Scaffold.of(context).showSnackBar() foi depreciado em
                // favor de ScaffoldMessenger.of(context).showSnackBar()
                // (estou usando Flutter 2.2.0)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferenciaCriada'),
                  ),
                );
              } catch (_) {}
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 1001)),
          ItemTransferencia(Transferencia(300.0, 2000)),
        ],
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
