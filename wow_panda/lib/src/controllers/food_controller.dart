import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wow_panda/src/model/food_model.dart';

class FoodController {
  Future<List<FoodModel>> fetchAllFoods() async {
    var snapshot = await FirebaseFirestore.instance.collection("foods").get();
    return snapshot.docs
        .map(
          (e) => FoodModel.fromJson(e.data()),
        )
        .toList();
  }
}
