
import 'package:flutter/material.dart';
import 'package:shoppingcart2/ItemModel.dart';

// class CartProvider extends ChangeNotifier {
//   final List<item> _cartItems = [];
// int _cartcount=0;
//   List<item> get cartItems => _cartItems;
// int get cartcount=>_cartcount;
//   double get totalPrice =>
//       _cartItems.fold(0, (sum, item) => sum + item.price);

//   void addToCart(item Catalog) {
//     if(_cartItems.contains(Catalog)){
//       _cartItems[_cartItems.indexOf(Catalog)];
//     };
//     notifyListeners();
//     print('check');
//   }

//   void removeFromCart(item Catalog) {
//     _cartItems.remove(Catalog);
//     notifyListeners();
//   }
// }
class CartProvider extends ChangeNotifier {
  final List<item> _cartItems = [];

  List<item> get cartItems => _cartItems;

  int get cartcount => _cartItems.length;

  double get totalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item.price);

  void addToCart(item product) {
    _cartItems.add(product);   // 🔥 THIS was missing
    notifyListeners();
    // print("Added: ${product.name}");
  }

  void removeFromCart(item product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}