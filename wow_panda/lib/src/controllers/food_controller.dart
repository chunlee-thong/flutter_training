import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wow_panda/src/model/food_model.dart';

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

  Stream<List<FoodModel>> fetchAllFoodStream() {
    return FirebaseFirestore.instance.collection("foods").snapshots().map(
      (event) {
        return event.docs
            .map(
              (e) => FoodModel.fromJson(e.data(), e.id),
            )
            .toList();
      },
    );
  }

  void method() {
    var collection = FirebaseFirestore.instance.collection("foods");

    //CREATE
    collection.add({
      "name": "",
      "price": 32.0,
    });
    //GET ALL
    collection.get();

    //GET ONE
    collection.doc("document_id").get();

    //UPDATE
    collection.doc("document_id").update({
      "name": "Noodle",
    });

    //DELETE
    collection.doc("document_id").delete();

    //QUERY
    collection
        .where(
          "address.city",
          isEqualTo: "PP",
        )
        .get();

    collection.where("price", isGreaterThan: 30);
  }
}
