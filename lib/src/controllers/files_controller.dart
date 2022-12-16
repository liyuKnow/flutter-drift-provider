import 'dart:io';
import 'package:master_drift_provider/src/controllers/permissions_controller.dart';
import 'package:master_drift_provider/src/data/local/helper/db_helper.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:drift/drift.dart' as drift;

class FilesController {
  static loadData() async {
    try {
      // ^ CHECK PERMISSION
      PermissionController.requestManageStorage();

      // ^ GET FILE FROM DOWNLOADS
      final directory = Directory('/storage/emulated/0/Download/');
      const fileName = "usersDownload.xlsx";

      var file = File(directory.path + fileName);

      var isFile = await file.exists();

      if (isFile) {
        // ^ SAVE IT TO A LOCAL VARIABLE
        List<String> rowDetail = [];

        var excelBytes = File(file.path).readAsBytesSync();
        var excelDecoder =
            SpreadsheetDecoder.decodeBytes(excelBytes, update: true);

        for (var table in excelDecoder.tables.keys) {
          for (var row in excelDecoder.tables[table]!.rows) {
            rowDetail.add('$row'.replaceAll('[', '').replaceAll(']', ''));
          }
        }

        insertIntoDb(rowDetail);

        // TODO : SECOND MORE SAFE WAY ?
        // for (var i = 1; i < rowDetail.length; i++) {
        //   var data = rowDetail[i].split(',');

        //   final entity = UserCompanion(
        //       firstName: drift.Value(data[1]),
        //       lastName: drift.Value(data[2]),
        //       gender: drift.Value(data[3]),
        //       country: drift.Value(data[4]),
        //       age: drift.Value(int.parse(data[5])));

        //   _db.insertUser(entity);
        // }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static void insertIntoDb(rowDetail) {
    late ReportDatabase db = ReportDatabase();
    // INSERT ALL METHOD
    final List<UserCompanion> entities = [];
    for (var i = 1; i < rowDetail.length; i++) {
      var data = rowDetail[i].split(',');

      final entity = UserCompanion(
          firstName: drift.Value(data[1]),
          lastName: drift.Value(data[2]),
          gender: drift.Value(data[3]),
          country: drift.Value(data[4]),
          age: drift.Value(int.parse(data[5])));

      entities.add(entity);
    }
    print('deleting');
    db.clearDatabase();
    db.insertMany(entities);

    db.close();
  }

  static pickFile() {
    print("File Picker Logic");
  }
}
