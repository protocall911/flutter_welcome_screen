abstract class DataBaseRequest {
  static const String tableRole = 'Role';
  static const String tableEmployee = 'Employee';
  static const String tableDelivery = 'Delivery';
  static const String tableDeliveryStatus = 'DeliveryStatus';
  static const String tableSize = 'Size';
  static const String tableProductCategory = 'ProductCategory';
  static const String tableProduct = 'Product';
  static const String tableOrderDetails = 'OrderDetails';
  static const String tableOrder = 'Order';
  static const String tableClient = 'Client';

  static const List<String> tableList = [
    tableRole,
    tableEmployee,
    tableDelivery,
    tableDeliveryStatus,
    tableSize,
    tableProductCategory,
    tableProduct,
    tableOrderDetails,
    tableOrder,
    tableClient
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableEmployee,
    _createTableDelivery,
    _createTableDeliveryStatus,
    _createTableSize,
    _createTableProductCategory,
    _createTableProduct,
    _createTableOrderDetails,
    _createTableOrder,
    _createTableClient
  ];

  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("ID_client"	INTEGER NOT NULL,"surname"	TEXT NOT NULL,"name"	TEXT NOT NULL,"middlename"	TEXT,"email"	TEXT NOT NULL,"phone"	TEXT NOT NULL,PRIMARY KEY("ID_client" AUTOINCREMENT))';

  static const String _createTableEmployee =
      'CREATE TABLE "$tableEmployee" ("ID_employee"	INTEGER NOT NULL,"role_ID"	INTEGER NOT NULL,"surname"	TEXT NOT NULL,"name"	TEXT NOT NULL,"middlename"	TEXT,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,PRIMARY KEY("ID_employee" AUTOINCREMENT),FOREIGN KEY("role_ID") REFERENCES "role"("ID_role"))';

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("ID_role"	INTEGER NOT NULL,"name"	TEXT NOT NULL UNIQUE,PRIMARY KEY("ID_role" AUTOINCREMENT))';

  static const String _createTableOrder =
      'CREATE TABLE "$tableOrder" ("ID_order"	INTEGER NOT NULL,"client_ID"	INTEGER NOT NULL,"placement_date"	TEXT NOT NULL,"postcode"	TEXT NOT NULL,"city"	TEXT NOT NULL,"address"	TEXT NOT NULL,"track_code"	TEXT NOT NULL,PRIMARY KEY("ID_order" AUTOINCREMENT),FOREIGN KEY("client_ID") REFERENCES "client"("ID_client"))';

  static const String _createTableProductCategory =
      'CREATE TABLE "$tableProductCategory" ("ID_product_category"	INTEGER NOT NULL,"name"	TEXT NOT NULL UNIQUE,PRIMARY KEY("ID_product_category" AUTOINCREMENT))';

  static const String _createTableProduct =
      'CREATE TABLE "$tableProduct" ("ID_product"	INTEGER NOT NULL,"name"	TEXT NOT NULL,"product_category_ID"	INTEGER NOT NULL,"color"	TEXT NOT NULL,"material"	TEXT NOT NULL,"price"	INTEGER NOT NULL,PRIMARY KEY("ID_product" AUTOINCREMENT),FOREIGN KEY("product_category_ID") REFERENCES "product_category"("ID_product_category"))';

  static const String _createTableSize =
      'CREATE TABLE "$tableSize" ("ID_size"	INTEGER NOT NULL,"ID_product"	INTEGER NOT NULL,"name"	TEXT NOT NULL,PRIMARY KEY("ID_size","ID_product"),FOREIGN KEY("ID_product") REFERENCES "product"("ID_product"))';

  static const String _createTableOrderDetails =
      'CREATE TABLE "$tableOrderDetails" ("ID_order_details"	INTEGER NOT NULL,"product_ID"	INTEGER NOT NULL,"order_ID"	INTEGER NOT NULL,"quantity"	INTEGER NOT NULL,PRIMARY KEY("ID_order_details" AUTOINCREMENT),FOREIGN KEY("order_ID") REFERENCES "order"("ID_order"),FOREIGN KEY("product_ID") REFERENCES "product"("ID_product"))';

  static const String _createTableDeliveryStatus =
      'CREATE TABLE "$tableDeliveryStatus" ("ID_delivery_status"	INTEGER NOT NULL,"name"	TEXT NOT NULL UNIQUE,PRIMARY KEY("ID_delivery_status" AUTOINCREMENT))';

  static const String _createTableDelivery =
      'CREATE TABLE "$tableDelivery" ("ID_delivery"	INTEGER NOT NULL,"order_ID"	INTEGER NOT NULL,"employee_ID"	INTEGER NOT NULL,"delivery_status_ID"	INTEGER NOT NULL,"departure_date"	TEXT NOT NULL,PRIMARY KEY("ID_delivery" AUTOINCREMENT),FOREIGN KEY("employee_ID") REFERENCES "employee"("ID_employee"),FOREIGN KEY("delivery_status_ID") REFERENCES "delivery_status"("ID_delivery_status"),FOREIGN KEY("order_ID") REFERENCES "order"("ID_order"))';

  static String deleteTable(String table) => 'DROP TABLE $table';
}
