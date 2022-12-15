import 'package:flutter/material.dart';
import 'package:master_drift_provider/src/data/local/helper/db_helper.dart';

class UserChangeNotifier extends ChangeNotifier {
  ReportDatabase? _db;

  void initReportDatabase(ReportDatabase db) {
    _db = db;
  }

  List<UserData> _usersList = [];
  List<UserData> get usersList => _usersList;

  List<UserData> _usersStream = [];
  List<UserData> get usersStream => _usersStream;

  UserData? _user;
  UserData? get user => _user;

  bool _newUser = false;
  bool get newUser => _newUser;

  bool _userUpdated = false;
  bool get userUpdated => _userUpdated;

  bool _userDeleted = false;
  bool get userDeleted => _userDeleted;

  String _error = "";
  String get error => _error;

  void getUserList() {
    _db?.getAllUsers().then((value) {
      _usersList = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    notifyListeners();
  }

  void streamUserList() {
    _db?.streamAllUsers().listen((event) {
      _usersStream = event;
    });

    notifyListeners();
  }

  void getUser(int id) {
    _db?.getUsersByID(id).then((value) {
      _user = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    notifyListeners();
  }

  void createUser(UserCompanion entity) {
    _db?.insertUser(entity).then((value) {
      _newUser = value >= 1 ? true : false;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    notifyListeners();
  }

  void updateUser(UserCompanion entity) {
    _db?.updateUser(entity).then((value) {
      _userUpdated = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    notifyListeners();
  }

  void deleteUser(int id) {
    _db?.deleteUser(id).then((value) {
      _userDeleted = value == 1 ? true : false;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    notifyListeners();
  }
}
