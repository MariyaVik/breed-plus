import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

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
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    Backend.database = await openDatabase(
      join(await getDatabasesPath(), 'hackathon.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(''
            'CREATE TABLE passports ('
            'id INTEGER PRIMARY KEY,'
            'gender TEXT NOT NULL,'
            'breed TEXT NOT NULL,'
            'bday TEXT NOT NULL,'
            'father INTEGER NOT NULL,'
            'mother INTEGER NOT NULL,'
            'milk REAL,'
            'fatness INTEGER NOT NULL,'
            'inbredding INTEGER NOT NULL,'
            'weightGain REAL,'
            'health INTEGER NOT NULL,'
            'fertility INTEGER,'
            'worth INTEGER NOT NULL'
            ')'
            '');
      },
    );
  }
}
