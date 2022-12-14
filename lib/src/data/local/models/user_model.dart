import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get gender => text()();
  TextColumn get country => text()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  IntColumn get age => integer()();
  // DateTimeColumn get dateOfBirth => dateTime().named('date_of_birth')();
}

class UpdatedLocation extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lat => text().named('first_name')();
  TextColumn get long => text().named('last_name')();
  IntColumn get userId => integer().references(User, #id)();
}
