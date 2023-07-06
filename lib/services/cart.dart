import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List<String> _items = [];

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }

  int length(){
    return _items.length;
  }
  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}