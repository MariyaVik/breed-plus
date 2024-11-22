import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Backend {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE passports (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
    );
  }
}
