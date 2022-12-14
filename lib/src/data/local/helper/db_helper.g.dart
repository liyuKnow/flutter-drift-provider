// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_helper.dart';

// ignore_for_file: type=lint
class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String country;
  final bool completed;
  final int age;
  const UserData(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.country,
      required this.completed,
      required this.age});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['gender'] = Variable<String>(gender);
    map['country'] = Variable<String>(country);
    map['completed'] = Variable<bool>(completed);
    map['age'] = Variable<int>(age);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      gender: Value(gender),
      country: Value(country),
      completed: Value(completed),
      age: Value(age),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      gender: serializer.fromJson<String>(json['gender']),
      country: serializer.fromJson<String>(json['country']),
      completed: serializer.fromJson<bool>(json['completed']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'gender': serializer.toJson<String>(gender),
      'country': serializer.toJson<String>(country),
      'completed': serializer.toJson<bool>(completed),
      'age': serializer.toJson<int>(age),
    };
  }

  UserData copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          String? gender,
          String? country,
          bool? completed,
          int? age}) =>
      UserData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        country: country ?? this.country,
        completed: completed ?? this.completed,
        age: age ?? this.age,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('country: $country, ')
          ..write('completed: $completed, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, firstName, lastName, gender, country, completed, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.gender == this.gender &&
          other.country == this.country &&
          other.completed == this.completed &&
          other.age == this.age);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> gender;
  final Value<String> country;
  final Value<bool> completed;
  final Value<int> age;
  const UserCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.gender = const Value.absent(),
    this.country = const Value.absent(),
    this.completed = const Value.absent(),
    this.age = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required String gender,
    required String country,
    this.completed = const Value.absent(),
    required int age,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        gender = Value(gender),
        country = Value(country),
        age = Value(age);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? gender,
    Expression<String>? country,
    Expression<bool>? completed,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (gender != null) 'gender': gender,
      if (country != null) 'country': country,
      if (completed != null) 'completed': completed,
      if (age != null) 'age': age,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? gender,
      Value<String>? country,
      Value<bool>? completed,
      Value<int>? age}) {
    return UserCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      completed: completed ?? this.completed,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('country: $country, ')
          ..write('completed: $completed, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed =
      GeneratedColumn<bool>('completed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("completed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, gender, country, completed, age];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UpdatedLocationData extends DataClass
    implements Insertable<UpdatedLocationData> {
  final int id;
  final String lat;
  final String long;
  final int userId;
  const UpdatedLocationData(
      {required this.id,
      required this.lat,
      required this.long,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(lat);
    map['last_name'] = Variable<String>(long);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  UpdatedLocationCompanion toCompanion(bool nullToAbsent) {
    return UpdatedLocationCompanion(
      id: Value(id),
      lat: Value(lat),
      long: Value(long),
      userId: Value(userId),
    );
  }

  factory UpdatedLocationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UpdatedLocationData(
      id: serializer.fromJson<int>(json['id']),
      lat: serializer.fromJson<String>(json['lat']),
      long: serializer.fromJson<String>(json['long']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lat': serializer.toJson<String>(lat),
      'long': serializer.toJson<String>(long),
      'userId': serializer.toJson<int>(userId),
    };
  }

  UpdatedLocationData copyWith(
          {int? id, String? lat, String? long, int? userId}) =>
      UpdatedLocationData(
        id: id ?? this.id,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('UpdatedLocationData(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lat, long, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpdatedLocationData &&
          other.id == this.id &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.userId == this.userId);
}

class UpdatedLocationCompanion extends UpdateCompanion<UpdatedLocationData> {
  final Value<int> id;
  final Value<String> lat;
  final Value<String> long;
  final Value<int> userId;
  const UpdatedLocationCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.userId = const Value.absent(),
  });
  UpdatedLocationCompanion.insert({
    this.id = const Value.absent(),
    required String lat,
    required String long,
    required int userId,
  })  : lat = Value(lat),
        long = Value(long),
        userId = Value(userId);
  static Insertable<UpdatedLocationData> custom({
    Expression<int>? id,
    Expression<String>? lat,
    Expression<String>? long,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'first_name': lat,
      if (long != null) 'last_name': long,
      if (userId != null) 'user_id': userId,
    });
  }

  UpdatedLocationCompanion copyWith(
      {Value<int>? id,
      Value<String>? lat,
      Value<String>? long,
      Value<int>? userId}) {
    return UpdatedLocationCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['first_name'] = Variable<String>(lat.value);
    }
    if (long.present) {
      map['last_name'] = Variable<String>(long.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UpdatedLocationCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $UpdatedLocationTable extends UpdatedLocation
    with TableInfo<$UpdatedLocationTable, UpdatedLocationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UpdatedLocationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<String> lat = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<String> long = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, lat, long, userId];
  @override
  String get aliasedName => _alias ?? 'updated_location';
  @override
  String get actualTableName => 'updated_location';
  @override
  VerificationContext validateIntegrity(
      Insertable<UpdatedLocationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['first_name']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['last_name']!, _longMeta));
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UpdatedLocationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UpdatedLocationData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      long: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $UpdatedLocationTable createAlias(String alias) {
    return $UpdatedLocationTable(attachedDatabase, alias);
  }
}

abstract class _$ReportDatabase extends GeneratedDatabase {
  _$ReportDatabase(QueryExecutor e) : super(e);
  late final $UserTable user = $UserTable(this);
  late final $UpdatedLocationTable updatedLocation =
      $UpdatedLocationTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, updatedLocation];
}
