import 'package:excel/excel.dart';

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
  final List<String?> result = [];
  for (var cell in row) {
    if (cell == null) {
      result.add(null);
    } else {
      result.add(getCellValue(cell));
    }
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
