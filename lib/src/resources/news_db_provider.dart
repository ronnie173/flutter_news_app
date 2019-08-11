import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NewsDbProvider {
  Database db;

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
            CREATE TABLE Items
            (
             id INTEGER PRIMARY KEY,
             type TEXT,
             by TEXT,
             time TEXT,
             text TEXT,
             parent INTEGER,
             kids BLOB,
             dead INTEGER, 
             deleted INTEGER,
             url TEXT,
             descendants INTEGER
            )
            """);
    });
  }

  fetchItem(int id) async{
    db.query(
        "Items",



    )
  }
}
