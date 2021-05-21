import 'package:sqflite/sqflite.dart';

import '../../models/contact.dart';
import '../app_database.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String tableSql = '''CREATE TABLE $_tableName (
          id INTEGER PRIMARY KEY,
          name TEXT,
          account_number INTEGER
        )''';

  Future<int> save(Contact contact) async {
    Database db = await createDatabase();

    Map<String, dynamic> contactMap = _toMap(contact);

    return await db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    Database db = await createDatabase();
    List<Map<String, dynamic>> maps = await db.query(_tableName);

    List<Contact> contacts = _toList(maps);

    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> maps) {
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
}
