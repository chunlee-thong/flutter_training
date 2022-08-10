import 'package:flutter/material.dart';
import 'package:wow_panda/src/model/food_model.dart';

class CartController extends ChangeNotifier {
  Map<String, List<FoodModel>> cartItems = {};

  int get totalItems {
    int sum = 0;
    for (var key in cartItems.keys) {
      sum += cartItems[key]!.length;
    }
    return sum;
  }

  void addItemToCart(FoodModel foodModel) {
    cartItems[foodModel.id] ??= [];
    cartItems[foodModel.id]!.add(foodModel);
    notifyListeners();
  }
}
