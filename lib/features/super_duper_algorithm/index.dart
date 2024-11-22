// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:breed_plus/features/super_duper_algorithm/backend.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import "package:excel/excel.dart";

bool isDouble(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s.replaceFirst(",", ".")) != null;
}

bool isUInt(String? s) {
  if (s == null) {
    return false;
  }
  final numeric = RegExp(r'^[0-9]+$');
  return numeric.hasMatch(s);
}

bool isDateTime(String? s) {
  if (s == null) {
    return false;
  }
  return DateTime.tryParse(s) != null;
}

void assertValue(dynamic expected, dynamic actual) {
  if (expected != actual) {
    throw Exception('Ожидал [$expected], получил [$actual]');
  }
}

List<String?> readTableRow(List<Data?> row) {
  final result = [] as List<String?>;
  for (var cell in row) {
    if (cell == null)
      result.add(null);
    else
      result.add(getCellValue(cell));
  }
  return result;
}

String? getCellValue(Data cell) {
  final value = cell.value;
  switch (value) {
    case null:
      return null;
    case TextCellValue():
      return value.value.toString();
    case FormulaCellValue():
      return value.formula;
    case IntCellValue():
      return value.value.toString();
    case BoolCellValue():
      return value.value.toString();
    case DoubleCellValue():
      return value.value.toString();
    case DateCellValue():
      return value.asDateTimeLocal().toString();
    case TimeCellValue():
      return value.asDuration().toString();
    case DateTimeCellValue():
      return value.asDateTimeLocal().toIso8601String();
  }
}

List<String?> assertRow(row, result) {
  final rowData = readTableRow(row);
  // Assert assumptions
  if (row.length != 13) {
    Future.error(Exception("Количество столбцов не равно 13"));
  }
  if (row[0]!.rowIndex == 0) {
    assertValue(rowData[0], "ID_особи");
    assertValue(rowData[1], "Пол");
    assertValue(rowData[2], "Порода");
    assertValue(rowData[3], "Дата_Рождения");
    assertValue(rowData[4], "Родитель_папа");
    assertValue(rowData[5], "Родитель_мама");
    assertValue(rowData[6], "Удой л/день");
    assertValue(rowData[7], "Упитанность");
    assertValue(rowData[8], "Коэффициент инбридинга (F)");
    assertValue(rowData[9], "Прирост веса кг/день");
    assertValue(rowData[10], "Здоровье (1-10)");
    assertValue(rowData[11], "Фертильность (%)");
    assertValue(rowData[12], "Генетическая ценность (баллы)");
  } else {
    assertValue(isUInt(rowData[0]), true);
    assertValue(["Самка", "Самец"].contains(rowData[1]), true);
    assertValue(rowData[2] != null, true);
    assertValue(isDateTime(rowData[3]), true);
    assertValue(isUInt(rowData[4]), true);
    assertValue(isUInt(rowData[5]), true);
    assertValue(rowData[6] == null || isDouble(rowData[6]), true);
    assertValue(rowData[7]?.length == 1 && isUInt(rowData[7]), true);
    assertValue(isDouble(rowData[8]) && double.parse(rowData[8]!) <= 1, true);
    assertValue(rowData[9] == null || isDouble(rowData[9]), true);
    assertValue(
        isUInt(rowData[10]) &&
            int.parse(rowData[10]!) <= 10 &&
            int.parse(rowData[10]!) >= 1,
        true);
    assertValue(rowData[11] == null || isUInt(rowData[11]), true);
    assertValue(isUInt(rowData[12]) && int.parse(rowData[12]!) <= 100, true);

    result.add(Passport(
      id: int.parse(rowData[0]!),
      gender: rowData[1] == "Самка" ? Gender.female : Gender.male,
      breed: rowData[2]!,
      bday: DateTime.parse(rowData[3]!),
      father: int.parse(rowData[4]!),
      mother: int.parse(rowData[5]!),
      milk: rowData[6] != null
          ? double.parse(rowData[6]!.replaceFirst(",", "."))
          : null,
      fatness: int.parse(rowData[7]!),
      inbredding: double.parse(rowData[8]!.replaceFirst(",", ".")),
      weightGain: rowData[9] != null
          ? double.parse(rowData[9]!.replaceFirst(",", "."))
          : null,
      health: int.parse(rowData[10]!),
      fertility: rowData[11] != null ? int.parse(rowData[11]!) : null,
      worth: int.parse(rowData[11]!),
    ));
  }
  return result;
}

void packData() {}

class API {
  static Future loadXlsPassport(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future<void> loadXlsxPassport(List<int> bytes) {
    final passports = [] as List<Passport>;
    var excel = Excel.decodeBytes(bytes);
    for (var tableKey in excel.tables.keys) {
      final table = excel.tables[tableKey];
      if (table == null) continue;
      for (var row in table.rows) {
        assertRow(row, passports);
      }
    }

    return Backend.bulkInsertPassports(passports);
  }

  static Future loadTSVPassport(List<int> bytes) {
    throw Future.error(Exception("Not implemented"));
  }

  static Future loadCFVPassport(List<int> bytes) {
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
