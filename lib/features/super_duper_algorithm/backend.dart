import 'package:breed_plus/features/super_duper_algorithm/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/index.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:collection/collection.dart';

class OptionsPreparation {
  final double value;
  final String name;
  final String contribution;

  OptionsPreparation(
      {required this.value, required this.name, required this.contribution});
}

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

  static Future<List<ReproductionResponse>> matchAnimal(
      int animalId, Map<String, double> options) async {
    final animal = await getCow(animalId);
    final genotypes = await getCowGenotypes(animalId);

    final preparedOptions = options.entries
        .map((x) => OptionsPreparation(
            value: x.value,
            name: x.key,
            contribution: genotypes
                    .firstWhereOrNull((genotype) => genotype.attribute == x.key)
                    ?.genotype[0] ??
                "null"))
        .toList();

    final animalGender = animal.gender == Gender.female ? "female" : "male";
    final isTargetFemale = animal.gender == Gender.female ? 1 : 0;

    final SNPcalculation = await Backend.database!.rawQuery(""
        "SELECT id, SUM(SNPContribution) as SNP"
        " FROM "
        " (SELECT *,"
        " (CASE WHEN genotypeMark = 'alt/alt' THEN 2 WHEN genotypeMark = 'ref/alt' THEN 1 WHEN genotypeMark = 'ref/ref' THEN 0 ELSE 0 END) * beta as SNPContribution"
        " FROM"
        " (SELECT *,"
        " replace(replace(offspring_genotype, alt, 'alt'), ref, 'ref') as genotypeMark"
        " FROM"
        " (SELECT *,"
        " CASE WHEN $isTargetFemale = 1 THEN thisParentGenotypeContribution || '/' || substr(genotype, 1, 1) ELSE substr(genotype, 1, 1) || '/' || thisParentGenotypeContribution END as offspring_genotype"
        " FROM"
        " (SELECT *,"
        " CASE ${preparedOptions.map((o) => "WHEN attribute = '${o.name}' THEN '${o.contribution}'").join(" ")} ELSE 'null' END as thisParentGenotypeContribution,"
        " CASE ${preparedOptions.map((o) => "WHEN attribute = '${o.name}' THEN ${o.value}").join(" ")} ELSE 0 END as attributeWeight"
        ' FROM  genotypes g LEFT JOIN passports p on g.id = p.id'
        " WHERE p.gender != '$animalGender'"
        " AND g.attribute IN (${preparedOptions.map((o) => "'${o.name}'").join(", ")})"
        ")))) GROUP BY id ORDER BY SUM(SNPContribution) DESC"
        " LIMIT 50");

    final List<ReproductionResponse> pretendents = [];
    for (final pretendent in SNPcalculation) {
      final id = pretendent['id'] as int;
      final snp = pretendent['SNP'] as double;

      final othrePassport = await Backend.getCow(id);
      final otherGenotypes = await Backend.getCowGenotypes(id);
      final score = snp;

      // Подсчёт
      final offspringTraits = <String, double>{};
      for (final trait in preparedOptions) {
        final thisTrait = genotypes
                .firstWhereOrNull(
                    (genotype) => genotype.attribute == trait.name)
                ?.beta ??
            0;
        final otherTrait = otherGenotypes
                .firstWhereOrNull(
                    (genotype) => genotype.attribute == trait.name)
                ?.beta ??
            0;
        offspringTraits[trait.name] = (thisTrait + otherTrait) / 2;
      }

      pretendents.add(ReproductionResponse(
          passport: othrePassport,
          genotypes: otherGenotypes,
          score: score,
          offspringTraits));
    }

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
