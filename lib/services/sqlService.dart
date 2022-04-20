//Nissa Nursabrina-2031710029-MI2E
import 'package:kasirfoodorderingcopasokene/models/ItemModel.dart';
import 'package:sqflite/sqflite.dart'; //SQL Database
import 'package:path/path.dart'; //manipulasi path library agar lebih ringkas

class SQLService {
  Database db;

  Future openDB() async {
    try {
      // Get a location dengan getDatabasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'shopping.db');

      // open the database
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print(db);
          this.db = db;
          createTables();
        },
      );
      return true;
    } catch (e) {
      print("ERROR IN OPEN DATABASE $e");
      return Future.error(e);
    }
  }

  createTables() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS shopping ( "
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "image Text,"
          "price REAL ,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";
      await db?.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
          "id INTEGER PRIMARY KEY,"
          "shop_id INTEGER,"
          "name TEXT,"
          "image Text,"
          "price REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";

      await db?.execute(qry);
    } catch (e) {
      print("ERROR IN CREATE TABLE");
      print(e);
    }
  }

  Future saveRecord(ShopItemModel data) async {
    //simpan record
    await this.db?.transaction((txn) async {
      var qry =
          'INSERT INTO shopping(name, price, image,rating,fav) VALUES("${data.name}",${data.price}, "${data.image}",${data.rating},${data.fav ? 1 : 0})';
      int id1 = await txn.rawInsert(qry);
      return id1;
    });
  }

  Future setItemAsFavourite(int id, bool flag) async {
    //set item jadi favourite
    var query = "UPDATE shopping set fav = ? WHERE id = ?";
    return await this.db?.rawUpdate(query, [flag ? 1 : 0, id]);
  }

  Future getItemsRecord() async {
    //get items record
    try {
      var list = await db?.rawQuery('SELECT * FROM shopping', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getCartList() async {
    //get cart list
    try {
      var list = await db?.rawQuery('SELECT * FROM cart_list', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future addToCart(ShopItemModel data) async {
    //tambahkan item ke cart
    await this.db?.transaction((txn) async {
      var qry =
          'INSERT INTO cart_list(shop_id, name, price, image,rating,fav) VALUES(${data.id}, "${data.name}",${data.price}, "${data.image}",${data.rating},${data.fav ? 1 : 0})';
      int id1 = await txn.rawInsert(qry);
      return id1;
    });
  }

  Future removeFromCart(int shopId) async {
    //remove item dari cart
    var qry = "DELETE FROM cart_list where shop_id = ${shopId}";
    return await this.db?.rawDelete(qry);
  }
}
