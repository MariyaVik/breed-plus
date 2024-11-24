import 'package:breed_plus/features/super_duper_algorithm/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/index.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:collection/collection.dart';

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

  static Future<List<ReproductionResponse>> matchAnimal(int animalId) async {
    final attribute1Value = 0.6;
    final attribute2Value = 0.4;
    final attribute3Value = 0.2;
    final attribute1Name = 'Удой л/день';
    final attribute2Name = 'Упитанность';
    final attribute3Name = 'Здоровье (1-10)';

    final animal = await getCow(animalId);
    final genotypes = await getCowGenotypes(animalId);

    final targetAnimalAttribute1Contribution = genotypes
            .firstWhereOrNull(
                (genotype) => genotype.attribute == attribute1Name)
            ?.genotype[0] ??
        "null";
    final targetAnimalAttribute2Contribution = genotypes
            .firstWhereOrNull(
                (genotype) => genotype.attribute == attribute2Name)
            ?.genotype[0] ??
        "null";
    final targetAnimalAttribute3Contribution = genotypes
            .firstWhereOrNull(
                (genotype) => genotype.attribute == attribute3Name)
            ?.genotype[0] ??
        "null";

    final animalGender = animal.gender;
    final isTargetFemale = animalGender == "Gender.female" ? 1 : 0;

    final SNPcalculation = await Backend.database!.rawQuery(""
        // "SELECT id, SUM(SNP) as SNP"
        // " FROM "
        " SELECT * "
        " FROM"
        " (SELECT *,"
        " CASE WHEN $isTargetFemale = 1 THEN thisParentGenotypeContribution || '/' || substr(genotype, 1, 1) ELSE substr(genotype, 1, 1) || '/' || thisParentGenotypeContribution END as offspring_genotype,"
        " (CASE WHEN genotypeMark = 'alt/alt' THEN 2 WHEN genotypeMark = 'ref/alt' THEN 1 WHEN genotypeMark = 'ref/ref' THEN 0 ELSE 0 END) * beta as SNPContribution"
        " FROM"
        " (SELECT *,"
        " "
        " replace(replace(g.genotype, g.alt, 'alt'), g.ref, 'ref') as genotypeMark,"
        " CASE WHEN attribute = '$attribute1Name' THEN '$targetAnimalAttribute1Contribution' WHEN attribute = '$attribute2Name' THEN '$targetAnimalAttribute2Contribution' WHEN attribute = '$attribute3Name' THEN '$targetAnimalAttribute3Contribution' ELSE 'null' END as thisParentGenotypeContribution,"
        " CASE WHEN attribute = '$attribute1Name' THEN $attribute1Value WHEN attribute = '$attribute2Name' THEN $attribute2Value WHEN attribute = '$attribute3Name' THEN $attribute3Value ELSE 0 END as attributeWeight"
        ' FROM passports p RIGHT JOIN genotypes g on g.id = p.id'
        " WHERE p.gender != '$animalGender'"
        "))" // GROUP BY id ORDER BY SUM(SNP) DESC"
        " LIMIT 50");

    final List<ReproductionResponse> pretendents = [];
    for (final pretendent in SNPcalculation) {
      final id = pretendent['id'] as int;
      // final snp = pretendent['SNP'] as double;

      print(id);
      final passport = await Backend.getCow(id);
      final genotypes = await Backend.getCowGenotypes(id);
      final score = 0.0;

      pretendents.add(ReproductionResponse(
          passport: passport, genotypes: genotypes, score: score));
    }

    print(pretendents);

    return pretendents;
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
            'pos INTEGER NOT NULL,'
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
