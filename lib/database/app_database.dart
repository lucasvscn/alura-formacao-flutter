import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((path) {
    return openDatabase(
      join(path, 'bytebank.db'),
      onCreate: (db, version) {
        db.execute('''CREATE TABLE contacts (
          id INTEGER PRIMARY KEY,
          name TEXT,
          account_number INTEGER
        )''');
      },
      version: 1,
    );
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((Database db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          id: map['id'],
          name: map['name'],
          accountNumber: map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
