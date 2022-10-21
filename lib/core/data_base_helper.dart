import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:welcome_screen/common/data_base_request.dart';
import 'package:welcome_screen/data/model/client.dart';
import 'package:welcome_screen/data/model/delivery.dart';
import 'package:welcome_screen/data/model/delivery_status.dart';
import 'package:welcome_screen/data/model/employee.dart';
import 'package:welcome_screen/data/model/order.dart';
import 'package:welcome_screen/data/model/order_details.dart';
import 'package:welcome_screen/data/model/product.dart';
import 'package:welcome_screen/data/model/product_category.dart';
import 'package:welcome_screen/data/model/role.dart';
import 'package:welcome_screen/data/model/size.dart';

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
      sqfliteFfiInit();
      dataBase = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onCreate: (db, version) => onCreateTable(db),
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
          ));
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
      db.insert(
          DataBaseRequest.tableEmployee,
          Employee(
                  id: 1,
                  role: 2,
                  surname: 'Иванов',
                  name: 'Иван',
                  middlename: 'Иванович',
                  login: 'i.i.ivanov',
                  password: 'Qwerty123!')
              .toMap());
      db.insert(
          DataBaseRequest.tableClient,
          Client(
                  id: 1,
                  surname: 'Романова',
                  name: 'Александра',
                  middlename: 'Ивановна',
                  email: 'a.i.romanova@gmail.com',
                  phone: '+7(993)619-62-43')
              .toMap());
      db.insert(
          DataBaseRequest.tableOrder,
          Order(
                  id: 1,
                  client: 1,
                  placementDate: '2022-10-17',
                  postcode: '115840',
                  city: 'Москва',
                  address: 'Луговая ул., д. 18 кв.159',
                  trackCode: '0123456789123')
              .toMap());
      db.insert(DataBaseRequest.tableProductCategory,
          ProductCategory(id: 1, name: 'Футболки').toMap());
      db.insert(
          DataBaseRequest.tableProduct,
          Product(
                  id: 1,
                  name: 'Футболка с принтом',
                  category: 1,
                  color: 'Белый',
                  material: 'Хлопок',
                  price: 530)
              .toMap());
      db.insert(DataBaseRequest.tableSize,
          Size(id: 1, product: 1, name: 'M').toMap());
      db.insert(DataBaseRequest.tableOrderDetails,
          OrderDetails(id: 1, product: 1, order: 1, quantity: 1).toMap());
      db.insert(DataBaseRequest.tableDeliveryStatus,
          DeliveryStatus(id: 1, name: 'Доставлено').toMap());
      db.insert(
          DataBaseRequest.tableDelivery,
          Delivery(
                  id: 1,
                  order: 1,
                  employee: 1,
                  status: 1,
                  departureDate: '2022-10-18')
              .toMap());
    } on DatabaseException catch (e) {
      print(e.result);
    }
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      deleteDatabase(_pathDB);
    } else {
      await databaseFactoryFfi.deleteDatabase(_pathDB);
    }
  }
}
