import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = await getDatabasesPath();

  return await openDatabase(
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
}

Future<int> save(Contact contact) async {
  Database db = await createDatabase();

  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;

  return await db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  Database db = await createDatabase();
  List<Map<String, dynamic>> maps = await db.query('contacts');

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
}
