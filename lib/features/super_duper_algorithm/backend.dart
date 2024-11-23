import 'package:breed_plus/features/super_duper_algorithm/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/index.dart';
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
    final batch = Backend.database!.batch();
    for (final passport in passports) {
      batch.insert(
        'passports',
        passport.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
    print("Паспорта загружены");
  }

  static Future<void> bulkInsertGenotypes(List<Genotype> genotypes) async {
    if (Backend.database == null) {
      return Future.error(Exception("База не задана"));
    }
    final batch = Backend.database!.batch();
    for (final genotype in genotypes) {
      batch.insert(
        'genotypes',
        genotype.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
    print("Генотипы загружены");
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
    final rawCow = await Backend.database!.query('passports', limit: 2000);
    return rawCow.map<Passport>(Passport.fromJson).toList();
  }

  static Future<List<Genotype>> getCowGenotypes(int cowId) async {
    if (Backend.database == null) {
      return Future.error(Exception("База не задана"));
    }
    final rawCow = await Backend.database!
        .query('genotypes', where: "id = ?", whereArgs: [cowId]);
    return rawCow.map(Genotype.fromJson).toList();
  }

  static Future<void> setCowMilk(
      int cowId, int recordDays, double amountOfMilk) async {
    await getCow(cowId);
    final updatedMilk = amountOfMilk / recordDays;
    return Backend.database!.execute(
        "UPDATE passports SET milk = ? WHERE id = ?", [updatedMilk, cowId]);
  }

  static Future<List<CowApiResponse>> matchAnimal(int animalId) async {
    final milk = 0.6;
    final weight = 0.4;
    final health = 0.2;
    final attributeMilkName = 'Удой л/день';
    final attributeWeightName = 'Упитанность';
    final attributeHealthName = 'Здоровье (1-10)';
    final animal = await getCow(animalId);
    final test = await Backend.database!.rawQuery(""
        "SELECT *"
        " FROM"
        " (SELECT *,"
        " CAST(replace(replace(replace(genotypeMark, 'alt/alt', '1'), 'ref/alt', '0.5'), 'ref/ref', '0') as real) as genotypeWeight"
        " FROM"
        " (SELECT *,"
        " replace(replace(g.genotype, g.alt, 'alt'), g.ref, 'ref') as genotypeMark,"
        " CASE WHEN attribute = '$attributeMilkName' THEN $milk WHEN attribute = '$attributeWeightName' THEN $weight WHEN attribute = '$attributeHealthName' THEN $health ELSE 0 END as attributeWeight"
        ' FROM passports p RIGHT JOIN genotypes g on g.id = p.id'
        ' LIMIT 50'
        "))");

    final a = test[2];

    final passports = await Backend.database!.query("passports",
        limit: 50,
        where: "gender != ?",
        whereArgs: [
          animal.gender
        ]).then(
        (res) => res.map((passport) => Passport.fromJson(passport)).toList());
    final List<CowApiResponse> result = [];
    for (final passport in passports) {
      final genotypes = await Backend.getCowGenotypes(passport.id);
      result.add(CowApiResponse(passport: passport, genotypes: genotypes));
    }
    return result;
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
