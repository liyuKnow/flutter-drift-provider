import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:master_drift_provider/src/data/local/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'db_helper.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, "report.db"));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [User, UpdatedLocation])
class ReportDatabase extends _$ReportDatabase {
  ReportDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<UserData>> getAllUsers() async {
    return await select(user).get();
  }

  Future<UserData> getUsersByID(int id) async {
    return await (select(user)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  // TODO : UPDATE USERS TABLE SOME COLUMNS  with - completed set true - update location inserted
  Future<bool> updateUser(UserCompanion entity) async {
    return await update(user).replace(entity);
  }

  Future<int> insertUser(UserCompanion entity) async {
    return await into(user).insert(entity);
  }

  Future<int> deleteUser(int id) async {
    return await (delete(user)..where((tbl) => tbl.id.equals(id))).go();
  }

  /* ----------------------------- Update Location ---------------------------- */
  /* -------------------------------------------------------------------------- */

  Future<int> insertUpdateLocation(UpdatedLocationCompanion entity) async {
    return await into(updatedLocation).insert(entity);
  }

  Future<UpdatedLocationData> getUpdateLocationByUserID(int id) async {
    return await (select(updatedLocation)
          ..where((tbl) => tbl.userId.equals(id)))
        .getSingle();
  }

  // TODO : INSERT MULTIPLE USER RECORDS
  // TODO : SEARCH USER TABLE
  // TODO : GET USER DETAIL BY ID JOINED WITH LOCATION DATA
}
