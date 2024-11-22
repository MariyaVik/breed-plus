import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Backend {
  static Database? database;

  static Future<void> bulkInsertPassports(List<Passport> passports) async {
    if (Backend.database == null) {
      return Future.error(Exception("База не задана"));
    }
    for (final passport in passports) {
      await Backend.database!.insert(
        'passports',
        passport.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    Backend.database = await openDatabase(
      join(await getDatabasesPath(), 'hackathon.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(''
            'CREATE TABLE passports ('
            'id INTEGER PRIMARY KEY,'
            'gender TEXT,'
            'breed TEXT,'
            'bday TEXT,'
            'father TEXT,'
            'mother TEXT,'
            'milk TEXT,'
            'fatness TEXT,'
            'inbredding TEXT,'
            'weightGain TEXT,'
            'health TEXT,'
            'fertility TEXT,'
            'worth TEXT'
            ')'
            '');
      },
    );
  }
}
