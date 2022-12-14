import 'dart:io';
import 'package:master_drift_provider/src/controllers/permissions_controller.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

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

        // TODO : LOAD TO DATABASE
        for (var i = 0; i < rowDetail.length; i++) {
          print(rowDetail[i]);
        }
      }
    } catch (e) {
      print(e.toString());
    }

    // print(file.path);

    // List<int> excelBytes = excelData.buffer
    //     .asUint8List(excelData.offsetInBytes, excelData.lengthInBytes);
    // var excelDecoder = SpreadsheetDecoder.decodeBytes(excelBytes);

    // for (var table in excelDecoder.tables.keys) {
    //   for (var row in excelDecoder.tables[table]!.rows) {
    //     rowDetail.add(row.toString());
    //   }
    // }

    // for (var i = 1; i < rowDetail.length; i++) {
    //   print(rowExcelDetail[i]);
    // }
    // ================================================================
    // ByteData data = await rootBundle.load("assets/users.xlsx");
    // List<int> bytes =
    //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // var decoder = SpreadsheetDecoder.decodeBytes(bytes);

    // for (var table in decoder.tables.keys) {
    //   for (var row in decoder.tables[table]!.rows) {
    //     rowDetail.add(row.toString());
    //   }
    // }

    // await _userService.truncateTable();

    // for (var i = 1; i < rowDetail.length; i++) {
    //   var row = rowDetail[i].split(',');
    //   // string replace th starting and ending []
    //   var _user = User();

    //   _user.firstName = row[1];
    //   _user.lastName = row[2];
    //   _user.gender = row[3];
    //   _user.country = row[4];
    //   _user.age = row[5];
    //   _user.date = row[6];

    //   await _userService.SaveUser(_user);

    //   getAllUserDetails();
  }
}
