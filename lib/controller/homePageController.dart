//Nissa Nursabrina-2031710029-MI2E
//menjembatani model dan view
import 'package:kasirfoodorderingcopasokene/models/ItemModel.dart';
import 'package:kasirfoodorderingcopasokene/services/itemService.dart';
import 'package:get/get.dart'; //agar memasukkan dependensi dengan mudah

class HomePageController extends GetxController {
  ItemServices itemServices = ItemServices();
  List<ShopItemModel> items = [];
  List<ShopItemModel> cartItems = [];
  bool isLoading = true;

  @override
  void onInit() {
    //implementasi onInit - definisi dari metode mana yang harus digunakan pada suatu kelas yang menerapkannya
    super.onInit();
    loadDB();
  }

  //set dan return db
  loadDB() async {
    await itemServices.openDB();
    loadItems();
    getCardList();
  }

  getItem(int id) {
    //mendapatkan item
    return items.singleWhere((element) => element.id == id);
  }

  bool isAlreadyInCart(id) {
    //tampil tidaknya item
    return cartItems.indexWhere((element) => element.shopId == id) > -1;
  }

  getCardList() async {
    //card list
    try {
      List list = await itemServices.getCartList();
      cartItems.clear();
      list.forEach((element) {
        cartItems.add(ShopItemModel.fromJson(element));
      });
      update();
    } catch (e) {
      print(e);
    }
  }

  loadItems() async {
    try {
      isLoading = true;
      update();

      List list = await itemServices.loadItems();
      list.forEach((element) {
        items.add(ShopItemModel.fromJson(element));
      });

      isLoading = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  setToFav(int id, bool flag) async {
    int index = items.indexWhere((element) => element.id == id);

    items[index].fav = flag;
    update();
    try {
      await itemServices.setItemAsFavourite(id, flag);
    } catch (e) {
      print(e);
    }
  }

  Future addToCart(ShopItemModel item) async {
    isLoading = true;
    update();
    var result = await itemServices.addToCart(item);
    isLoading = false;
    update();
    return result;
  }

  removeFromCart(int shopId) async {
    itemServices.removeFromCart(shopId);
    int index = cartItems.indexWhere((element) => element.shopId == shopId);
    cartItems.removeAt(index);
    update();
  }
}
