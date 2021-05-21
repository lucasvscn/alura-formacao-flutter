import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts list'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          // final List<Contact> contacts = snapshot.data;
          // declaracao na linha anterior não é compatível com
          // Dart 2.12 (Null safety).
          return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return _ContactItem(contacts[index]);
              });
        },
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Lucas',
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          '1000',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
