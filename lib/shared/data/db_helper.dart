import 'package:posts_app/models/products.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/card_item.dart';

class DBHelper {
  late Database dataBase;

  void createDatabase() {
    openDatabase('product.db', version: 1, onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT, price Text, image TEXT, description TEXT, isFavorite INTEGER,quantity INTEGER,)')
          .then((value) {
        print('Created database');
      }).catchError((error) {
        print('Error creating database: $error');
      });
    }, onOpen: (database) {
      dataBase = database;
      getDataFromDatabase().then((value) {});
      print(' Opened database');
    }).then((value) {
      dataBase = value;
    });
  }

  Future insertToDataBase(CartItem cart) async {
    var Products = cart.product;
    await dataBase.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO items(id, name, price, image, description, isFavorite, quantity ) VALUES(${Products.id}, ${Products.title}, ${Products.price}, ${Products.imageUrl}, ${Products.description}, ${Products.isFavorite}, ${cart.quantity})');
      return null;
    }).then((value) {
      print(value);
    }).catchError((error) {
      print("${error.toString()}");
    });
  }

  Future<List<CartItem>> getDataFromDatabase() async {
    List<Map> products = await dataBase.rawQuery('SELECT * FROM products');
    return products.map((e) => CartItem.fromMap(e)).toList();
  }
  //function to increase the quantity of the product in the cart

  Future increaseQuantity(String? id) async {
    await dataBase
        .rawUpdate('UPDATE items SET quantity = quantity + 1 WHERE id = $id');
  }
  //function to decrease the quantity of the product in the cart

  Future decreaseQuantity(String? id) async {
    await dataBase
        .rawUpdate('UPDATE items SET quantity = quantity - 1 WHERE id = $id');
  }
  //function to delete the product from the cart

  Future deleteProduct(String? id) async {
    await dataBase.rawDelete('DELETE FROM items WHERE id = $id');
  }
}
