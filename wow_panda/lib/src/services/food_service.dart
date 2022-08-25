import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wow_panda/src/model/food_model.dart';

final foodService = FoodService();

class FoodService {
  final foodCollection = FirebaseFirestore.instance.collection("foods");

  ///Singleton
  // FoodService._privateConstructor();
  // static final FoodService _instance = FoodService._privateConstructor();
  // factory FoodService() {
  //   return _instance;
  // }
  ///Singleton

  Future<List<FoodModel>> fetchAllFoods() async {
    var snapshot = await foodCollection.get();
    return snapshot.docs
        .map(
          (e) => FoodModel.fromJson(e.data(), e.id),
        )
        .toList();
  }
}
