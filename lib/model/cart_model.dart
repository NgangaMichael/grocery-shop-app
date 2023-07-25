import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ['Avacado', '4.00', 'lib/images/avocado.png', Colors.green],
    ['Banana', '9.50', 'lib/images/banana.png', Colors.yellow],
    ['Chicken', '13.00', 'lib/images/chicken.png', Colors.brown],
    ['Water', '2.00', 'lib/images/water.png', Colors.blue],

  ];

  // list of cart items 
  List _cartItems = [];
  
  get cartItems => _cartItems;

  get shopItems => _shopItems;

  void addItemstoCart (int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeitemsFromCart (int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price 
  String calculateTotal() {
    double totalPrice = 0;
    for(int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}