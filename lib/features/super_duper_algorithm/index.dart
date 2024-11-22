// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import "package:excel/excel.dart";

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
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

List<String?> assertRow(row) {
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
    //
    assertValue(isNumeric(rowData[4]), true);
    assertValue(isNumeric(rowData[5]), true);
    assertValue(isNumeric(rowData[6]), true);
    assertValue(isNumeric(rowData[7]), true);
    assertValue(isNumeric(rowData[8]), true);
    assertValue(isNumeric(rowData[9]), true);
    assertValue(isNumeric(rowData[10]), true);
    assertValue(isNumeric(rowData[11]), true);
    assertValue(isNumeric(rowData[12]), true);
    assertValue(isNumeric(rowData[13]), true);
  }
  return rowData;
}

void packData() {}

class API {
  static Future loadXls(List<int> bytes) {
    var excel = Excel.decodeBytes(bytes);
    for (var tableKey in excel.tables.keys) {
      final table = excel.tables[tableKey];
      if (table == null) continue;
      for (var row in table.rows) {
        final rowData = assertRow(row);
      }
    }

    throw Future.error(Error());
  }

  static Future loadXlsx() {
    throw Future.error(Error());
  }

  static Future loadTSV() {
    throw Future.error(Error());
  }

  static Future loadCFV() {
    throw Future.error(Error());
  }

  static Future matchFemale() {
    throw Future.error(Error());
  }

  static Future matchMale() {
    throw Future.error(Error());
  }

  static Future matchAll() {
    throw Future.error(Error());
  }
}
