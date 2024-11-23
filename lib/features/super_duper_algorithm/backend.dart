import 'package:breed_plus/features/super_duper_algorithm/genotype.dart';
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

  static Future<void> bulkInsertGenotypes(List<Genotype> genotypes) async {
    if (Backend.database == null) {
      return Future.error(Exception("База не задана"));
    }
    for (final genotype in genotypes) {
      await Backend.database!.insert(
        'genotypes',
        genotype.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<Passport> getCow(int id) async {
    if (Backend.database == null) {
      return Future.error(Exception("База не задана"));
    }
    final rawCow = await Backend.database!
        .query('passports', where: "id = ?", whereArgs: [id]);

    if (rawCow.isEmpty) return Future.error(Exception("Коровка не найдена"));
    return Passport.fromJson(rawCow.first);
  }

  static Future<List<Passport>> getCows() async {
    if (Backend.database == null) {
      return Future.error(Exception("База не задана"));
    }
    final rawCow = await Backend.database!.query('passports');
    return rawCow.map<Passport>(Passport.fromJson).toList();
  }

  static Future<List<Genotype>> getCowGenotypes(int cowId) async {
    if (Backend.database == null) {
      return Future.error(Exception("База не задана"));
    }
    final rawCow = await Backend.database!
        .query('genetics', where: "id = ?", whereArgs: [cowId]);
    return rawCow.map(Genotype.fromJson).toList();
  }

  static Future<void> setCowMilk(
      int cowId, int recordDays, double amountOfMilk) async {
    await getCow(cowId);
    final updatedMilk = amountOfMilk / recordDays;
    return Backend.database!.execute(
        "UPDATE passports SET milk = ? WHERE id = ?", [updatedMilk, cowId]);
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
            ');'
            ' '
            'CREATE TABLE genotypes ('
            'mutationId TEXT PRIMARY KEY,'
            'chrom INTEGER NOT NULL,'
            'pos TEXT NOT NULL,'
            'ref TEXT NOT NULL,'
            'alt TEXT NOT NULL,'
            'attribute TEXT NOT NULL,'
            'beta REAL NOT NULL,'
            'genotype TEXT NOT NULL,'
            'id INTEGER NOT NULL'
            ');'
            '');
      },
    );
  }
}
