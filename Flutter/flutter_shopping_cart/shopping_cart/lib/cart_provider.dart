import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'items.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("cart_items", _counter);
    prefs.setDouble("total_price", _totalPrice);
    prefs.setStringList("cartProductName", cartProductName);
    prefs.setStringList("cartProductName", cartProductPrice);
    prefs.setStringList("cartProductImage", cartProductImage);
    prefs.setStringList("cartQuantity", cartQuantity);
    prefs.setStringList("cartProductIndex", cartProductIndex);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt("cart_items") ?? 0;
    _totalPrice = prefs.getDouble("total_price") ?? 0.0;
    var cartProductName1 = prefs.getStringList("cartProductName") ?? [];
    cartProductPrice = prefs.getStringList("cartProductPrice") ?? [];
    cartProductImage = prefs.getStringList("cartProductImage") ?? [];
    cartQuantity = prefs.getStringList("cartQuantity") ?? [];
    notifyListeners();
  }

  void addCartProductName(String name) {
    cartProductName.add(name);
    _setPrefItems();
    notifyListeners();
  }

  void removeCartProductName(int index) {
    cartProductName.removeAt(index);
    _setPrefItems();
    notifyListeners();
  }

  void addCartProductPrice(String price) {
    cartProductPrice.add(price.toString());
    _setPrefItems();
    notifyListeners();
  }

  void removeCartProductPrice(int index) {
    cartProductPrice.removeAt(index);
    _setPrefItems();
    notifyListeners();
  }

  void addCartProductImage(String img) {
    cartProductImage.add(img);
    _setPrefItems();
    notifyListeners();
  }

  void removeCartProductImage(int index) {
    cartProductImage.removeAt(index);
    _setPrefItems();
    notifyListeners();
  }

  void addCartQuantity(String q) {
    cartQuantity.add(q);
    _setPrefItems();
    notifyListeners();
  }

  void removeCartQuantity(int index) {
    cartQuantity.removeAt(index);
    _setPrefItems();
    notifyListeners();
  }
    void addProductIndex(int index) {
    cartProductIndex.add(index.toString());
    _setPrefItems();
    notifyListeners();
  }
    void removeProductIndex(int index) {
    cartProductIndex.removeAt(index);
    _setPrefItems();
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }

  getName() {
    _getPrefItems();
    return cartProductName;
  }

  void addTotalPrice(double productPrice) {
    _totalPrice += productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice -= productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  getdata() async {
    var data = await {
      "name": cartProductName,
      "price": cartProductPrice,
      "image": cartProductImage
    };
    return data;
  }
}
