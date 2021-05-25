import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({this.id, this.title, this.price, this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> items = {};
  Map<String, CartItem> get item {
    return {...items};
  }

  int get itemCount {
    return items.length == null ? 0 : items.length;
  }

  void addItem(String productId, double price, String title) {
    if (items.containsKey(productId)) {
      items.update(
          productId,
          (existing) => CartItem(
              id: existing.id,
              price: existing.price,
              quantity: existing.quantity + 1,
              title: existing.title));
      //chage quantity
    } else {
      items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }
}
