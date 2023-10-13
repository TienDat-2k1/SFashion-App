import 'package:s_fashion/src/models/order.dart';
import 'package:s_fashion/src/repositories/product_query/product_query.dart';
import 'package:sqflite/sqflite.dart';

class SqlQuery {
  static SqlQuery? _instance;
  static Database? _database;

  SqlQuery._internal(Database database) {
    _database = database;
  }

  static dispose() {
    if (_database != null) _database!.close();
  }

  Future<bool> addCart(Order order) async {
    int result = 0;
    await _database!.transaction((txn) async {
      result = await txn.rawInsert('INSERT INTO Cart(id, amount, size)'
          ' VALUES("${order.product.id}", ${order.amount}, "${order.size}")');
    });
    return result != 0;
  }

  Future<bool> removeCart(Order order) async {
    int result = await _database!
        .rawDelete("DELETE FROM Cart WHERE id = '${order.product.id}'");
    return result > 0;
  }

  Future<bool> updateOrder(Order order) async {
    int result = await _database!.rawUpdate(
        "UPDATE Cart SET amount = ${order.amount},"
        " size = '${order.size}' WHERE id = '${order.product.id}'");
    return result > 0;
  }

  Future<List<Order>> readCart() async {
    List<Map> list = await _database!.rawQuery('SELECT * FROM Cart');

    final List<Order> orders = [];
    for (var data in list) {
      final product = await ProductQuery.getInfoProduct(data['id']);
      if (product != null) {
        orders.add(
          Order(
            product: product,
            amount: data['amount'],
            size: data['size'],
          ),
        );
      }
    }

    return orders;
  }

  static Future<SqlQuery> getInstance() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}sfashion.db';

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Cart (id TEXT PRIMARY KEY, amount INTEGER, size TEXT)');
    });

    _instance ??= SqlQuery._internal(database);
    return _instance!;
  }
}
