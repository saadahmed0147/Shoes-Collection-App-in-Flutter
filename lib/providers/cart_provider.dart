import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void deleteProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
