import 'package:breed_plus/features/super_duper_algorithm/genotype.dart';
import 'package:breed_plus/features/super_duper_algorithm/passport.dart';
import 'package:breed_plus/features/super_duper_algorithm/table_handler/common.dart';

List<String?> readRowGenotype(row, result) {
  final rowData = readTableRow(row);
  // Assert assumptions
  if (row.length != 9) {
    Future.error(Exception("Количество столбцов не равно 9"));
  }
  if (row[0]!.rowIndex == 0) {
    assertValue(rowData[0], "mutation_id");
    assertValue(rowData[1], "chrom");
    assertValue(rowData[2], "pos");
    assertValue(rowData[3], "ref");
    assertValue(rowData[4], "alt");
    assertValue(rowData[5], "Признак");
    assertValue(rowData[6], "beta");
    assertValue(rowData[7], "Генотип коровы");
    assertValue(rowData[8], "ID_особи");
  } else {
    assertValue(rowData[0] != null, true);
    assertValue(isUInt(rowData[1]), true);
    assertValue(isUInt(rowData[2]), true);
    assertValue(rowData[3] != null, true);
    assertValue(rowData[4] != null, true);
    assertValue(rowData[5] != null, true);
    assertValue(isDouble(rowData[6]), true);
    assertValue(rowData[7] != null, true);
    assertValue(isUInt(rowData[8]), true);

    result.add(Genotype(
        mutationId: rowData[0]!,
        chrom: int.parse(rowData[1]!),
        pos: int.parse(rowData[2]!),
        ref: rowData[3]!,
        alt: rowData[4]!,
        attribute: rowData[5]!,
        beta: double.parse(rowData[6]!),
        genotype: rowData[7]!,
        id: int.parse(rowData[8]!)));
  }
  return result;
}
