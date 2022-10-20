import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:welcome_screen/common/data_base_request.dart';
import 'package:welcome_screen/data/model/role.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'clothingstore.db');

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    } else {
      dataBase = await openDatabase(_pathDB,
          onUpgrade: (db, oldVersion, newVersion) async {
        await onUpdateTable(db);
      }, onCreate: (db, version) async {
        await onCreateTable(db);
      });
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master;');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole,
          Role(id: 1, name: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(id: 2, name: 'Курьер').toMap());
    } on DatabaseException catch (e) {
      print(e.result);
    }
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
