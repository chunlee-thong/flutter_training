import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../model/food_model.dart';

Future generateFood() async {
  List<int> data = List.generate(20, (index) => index);

  for (var i in data) {
    debugPrint(i.toString());
    final faker = Faker();
    final name = faker.food.dish();
    await FirebaseFirestore.instance.collection("foods").add(
          FoodModel(
            id: "",
            name: name,
            description: faker.lorem.sentence(),
            price: 10 + i,
            images: [
              faker.image.image(
                keywords: ["food"],
                width: 640,
                height: 480 + i,
              ),
            ],
            rating: 5 * faker.randomGenerator.decimal(),
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ).toJson(),
        );
  }
}
