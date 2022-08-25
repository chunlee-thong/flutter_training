import 'package:dio/dio.dart';

import '../model/food_model.dart';

class FoodRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.food.com",
    ),
  );

  Future<List<FoodModel>> fetchAllFoods() async {
    var response = await dio.get(
      "/food/all",
      options: Options(
        headers: {
          "Authorization": "Bearer token",
        },
      ),
    );
    List data = response.data as List;
    return data.map((e) => FoodModel.fromJson(e, "docId")).toList();
  }

  Future<List<FoodModel>> fetchOne(String id) async {
    var response = await dio.get("/food/all");
    List data = response.data as List;
    return data.map((e) => FoodModel.fromJson(e, "docId")).toList();
  }
}
