import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/contact_dao.dart';

Future<Database> createDatabase() async {
  final String path = await getDatabasesPath();

  return await openDatabase(
    join(path, 'bytebank.db'),
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
  );
}
