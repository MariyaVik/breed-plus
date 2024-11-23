// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:breed_plus/features/super_duper_algorithm/backend.dart';
import 'package:breed_plus/features/super_duper_algorithm/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:breed_plus/features/super_duper_algorithm/table_handler/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/table_handler/passport.dart';
import "package:excel/excel.dart";

class CowApiResponse {
  final Passport passport;
  final List<Genotype> genotypes;

  CowApiResponse({required this.passport, required this.genotypes});
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
    final passports = [] as List<Passport>;
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

  static Future<void> loadXlsxGenotypes(List<int> bytes) {
    final genotypes = [] as List<Genotype>;
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

  static Future matchFemale() {
    throw Future.error(Exception("Not implemented"));
  }

  static Future matchMale() {
    throw Future.error(Exception("Not implemented"));
  }

  static Future matchAll() {
    throw Future.error(Exception("Not implemented"));
  }
}
