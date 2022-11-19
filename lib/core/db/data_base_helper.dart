import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:welcome_screen/common/data_base_request.dart';
import 'package:welcome_screen/data/model/role.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DataBaseHelper {

  static final _dataBaseName = "clothing_store.db";
  late final Directory _appDocumentDirectory;
  late final Database dataBase;
  late final String _pathDB;
  final int  _version = 1;

  DataBaseHelper._instance();
  static final DataBaseHelper instance = DataBaseHelper._instance();

  Future<void> init() async {

    WidgetsFlutterBinding.ensureInitialized();

    // final _appDocumentDirectory = Directory("/Users/mewcardd/Documents/Clothin/zgStoreDB");
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    dataBase = await openDatabase(
        _pathDB = join(_appDocumentDirectory.path, _dataBaseName),
        version: _version,
        onCreate: (db, version) async => await onCreateDataBase(db),
        onUpgrade: (db, oldVersion, newVersion) async => await onUpdateDataBase(db));

    // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS || kIsWeb) {
    //   sqfliteFfiInit();
    //   dataBase = await databaseFactoryFfi.openDatabase(_pathDB,
    //       options: OpenDatabaseOptions(
    //         version: _version,
    //         onCreate: (db, version) => onCreateTable(db),
    //         onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
    //       ));
    // } else {
    //   dataBase = await openDatabase(_pathDB,
    //       onUpgrade: (db, oldVersion, newVersion) async {
    //     await onUpdateTable(db);
    //   }, onCreate: (db, version) async {
    //     await onCreateTable(db);
    //   });
  }

  Future onCreateDataBase(Database db) async {
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }
    await onInitDataBase(db);
  }

  Future onInitDataBase(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: 'Пользователь').toMap());
    } on DatabaseException catch (e) {
      print(e.result);
    }
  }

  Future onDropDataBase() async {
    await dataBase.close();

    await deleteDatabase(_pathDB);
  }

  Future onUpdateDataBase(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master;');

    for (var tableName in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element["name"] == tableName).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(tableName));
        print("delete $tableName");
      }
    }
    for (var sql in DataBaseRequest.tableCreateList) {
      await db.execute(sql);
    }
    await onInitDataBase(db);
  }



  // Future<void> onDropDataBase() async {
  //   dataBase.close();
  //   if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //     deleteDatabase(_pathDB);
  //   } else {
  //     await databaseFactoryFfi.deleteDatabase(_pathDB);
  //   }
  // }
}
