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
        future: Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
        initialData: [],
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return _listView(snapshot.data);
            default:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
          }
        },
      ),
    );
  }

  ListView _listView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _ContactItem(data[index]);
        });
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
