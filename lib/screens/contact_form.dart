import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../database/app_database.dart';
import '../models/contact.dart';

const _titleAppBar = 'New contact';

const _labelFullName = 'Full name';
const _hintFullName = 'enter your name';

const _labelAccountNumber = 'Account number';
const _hintAccountNumber = '0000';

const _textCreateButton = 'Create';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _controllerFullName = TextEditingController();

  final TextEditingController _controllerAccountNumber =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: Column(
        children: [
          Editor(
            controlador: _controllerFullName,
            rotulo: _labelFullName,
            dica: _hintFullName,
          ),
          Editor(
            controlador: _controllerAccountNumber,
            rotulo: _labelAccountNumber,
            dica: _hintAccountNumber,
            inputType: TextInputType.number,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0),
                  ),
                  onPressed: () => _createContact(context),
                  child: Text(
                    _textCreateButton,
                    style: TextStyle(fontSize: 24.0),
                  )),
            ),
          )
        ],
      ),
    );
  }

  void _createContact(BuildContext context) {
    try {
      final String name = _controllerFullName.text;
      final int accountNumber = int.parse(_controllerAccountNumber.text);

      final newContact = Contact(name: name, accountNumber: accountNumber);

      save(newContact).then((id) {
        Navigator.pop(context);
      });
    } catch (_) {}
  }
}
