// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:breed_plus/features/super_duper_algorithm/backend.dart';
import 'package:breed_plus/features/super_duper_algorithm/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:breed_plus/features/super_duper_algorithm/table_handler/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/table_handler/passport.dart';
import "package:excel/excel.dart";

import '../profile/data/mok.dart';

class CowApiResponse {
  final Passport passport;
  final List<Genotype> genotypes;

  CowApiResponse({required this.passport, required this.genotypes});
}

class ReproductionResponse {
  final Passport passport;
  final List<Genotype> genotypes;
  final double score;
  final Map<String, double> offspringTraits;

  ReproductionResponse(this.offspringTraits,
      {required this.passport, required this.genotypes, required this.score});
}

class API {
  static Future loadXlsPassport(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future loadXlsGenotypes(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future<List<Passport>> getMyAnimales() async {
    return await Backend.getCows();
  }

  static Future<CowApiResponse> getCow(int id) async {
    final passport = await Backend.getCow(id);
    final genotypes = await Backend.getCowGenotypes(id);
    return CowApiResponse(passport: passport, genotypes: genotypes);
  }

  static Future<void> setCowMilk(
      int cowId, int recordDays, double amountOfMilk) async {
    return Backend.setCowMilk(cowId, recordDays, amountOfMilk);
  }

  static Future<void> loadXlsxPassport(List<int> bytes) {
    final List<Passport> passports = [];
    var excel = Excel.decodeBytes(bytes);
    for (var tableKey in excel.tables.keys) {
      final table = excel.tables[tableKey];
      if (table == null) continue;
      for (var row in table.rows) {
        readRowPassport(row, passports);
      }
    }

    return Backend.bulkInsertPassports(passports);
  }

  static Future<void> addPassport(Passport passport) async {
    return Backend.bulkInsertPassports([passport]);
  }

  static Future<void> addGenotype(Genotype genotype) async {
    return Backend.bulkInsertGenotypes([genotype]);
  }

  static Future<void> loadXlsxGenotypes(List<int> bytes) {
    final List<Genotype> genotypes = [];
    var excel = Excel.decodeBytes(bytes);
    for (var tableKey in excel.tables.keys) {
      final table = excel.tables[tableKey];
      if (table == null) continue;
      for (var row in table.rows) {
        readRowGenotype(row, genotypes);
      }
    }

    return Backend.bulkInsertGenotypes(genotypes);
  }

  static Future loadTSVPassport(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future loadTSVGenotypes(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future loadCFVPassport(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future loadCFVGenotypes(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future<List<ReproductionResponse>> matchAnimal(int animalId) {
    return Backend.matchAnimal(animalId, {
      'Удой л/день': 0.6,
      'Упитанность': 0.4,
      'Здоровье (1-10)': 0.2,
    });
  }

  static Future matchAll() {
    throw Future.error(Exception("Not implemented"));
  }
}
