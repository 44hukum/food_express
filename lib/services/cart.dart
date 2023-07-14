import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }

  int length() {
    return _items.length;
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}

class Orders {
  late final int id;
  late final String item;
  late final String image;
  late final String public_id;
  late final int quantity;
  late final double price;

  Orders(this.item, this.quantity, this.price, this.image, this.public_id);
  Orders.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        image = data['image'],
        public_id = data['public_id'],
        item = data['item'],
        quantity = data['quantity'],
        price = data['price'];

  Map<String, Object> toMap() {
    return {
      'item': item,
      'image': image,
      'public_id': public_id,
      'quantity': quantity,
      'price': price
    };
  }
}

class SqliteService {
  //Initialized database
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath(); // Initialized the Database

    return openDatabase(
      join(path, 'foodCommerce.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Orders(id INTEGER PRIMARY KEY AUTOINCREMENT, item TEXT NOT NULL, public_id TEXT NOT NULL, image TEXT NOT NULL, quantity INTEGER NOT NULL, price REAL NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> createItem(Orders order) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert('Orders', order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Orders>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Orders');
    return queryResult.map((e) => Orders.fromMap(e)).toList();
  }

  // Delete an Order by id
  Future<void> deleteItem(String id) async {
    final db = await initializeDB();
    try {
      await db.delete("Orders", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  Future<void> deleteALl() async {
    final db = await initializeDB();
    try {
      await db.delete("Orders");
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // Delete an Order by id
  Future<Object?> totalBill() async {
    final db = await initializeDB();
    try {
      var total = await db.rawQuery('SELECT sum(price) from Orders');
      return total[0]['sum(price)'];
    } catch (err) {
      debugPrint("Got Some issues $err");
    }
  }
}
