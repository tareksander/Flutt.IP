import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'account.dart';
import 'dart:convert';

part 'db.g.dart';

@DriftDatabase(tables: [Account])
class DB extends _$DB {
  DB() : super(DatabaseConnection.delayed(Future(() async =>
            NativeDatabase.createBackgroundConnection(File(path.join(
                (await getApplicationDocumentsDirectory()).path,
                "Stud.IP.db"))))));
  
  @override
  int get schemaVersion => 0;
}

class StringListDBConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return json.decode(fromDb) as List<String>;
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}
