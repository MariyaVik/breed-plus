import 'dart:async';
import "package:excel/excel.dart";

class API {
  static Future loadXls(List<int> bytes) {
    var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table].maxColumns);
        print(excel.tables[table].maxRows);
        for (var row in excel.tables[table].rows) {
            for (var cell in row) {
                print('cell ${cell.rowIndex}/${cell.columnIndex}');
                final value = cell.value;
                final numFormat = cell.cellStyle?.numberFormat ?? NumFormat.standard_0;
                switch(value){
                }
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
