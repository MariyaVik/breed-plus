import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:breed_plus/features/super_duper_algorithm/table_handler/common.dart';

void readRowPassport(row, result) {
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
      worth: int.parse(rowData[12]!),
    ));
  }
}
