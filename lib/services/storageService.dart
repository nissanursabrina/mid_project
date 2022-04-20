//Nissa Nursabrina-2031710029-MI2E
import 'package:shared_preferences/shared_preferences.dart'; //reading writing simple key-value pairs

class StorageService {
  //penyimpanan
  setItem(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future getItem(String key) async {
    //get item
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key);
    return value;
  }

  deleteItem(String key) async {
    //remove item
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
