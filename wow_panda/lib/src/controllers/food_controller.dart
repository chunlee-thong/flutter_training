import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/food_model.dart';

class FoodController {
  ///
  Future<List<FoodModel>> fetchAllFoods() async {
    var snapshot = await FirebaseFirestore.instance.collection("foods").get();
    return snapshot.docs
        .map(
          (e) => FoodModel.fromJson(e.data(), e.id),
        )
        .toList();
  }
}
