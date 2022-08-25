import 'package:rxdart/subjects.dart';

import '../model/food_model.dart';
import '../services/food_service.dart';

class FoodController {
  late BehaviorSubject<List<FoodModel>?> foodStream = BehaviorSubject();

  ///
  Future<void> fetchFoods([bool reloading = true]) async {
    try {
      if (reloading) {
        foodStream.add(null);
      }
      var result = await foodService.fetchAllFoods();
      foodStream.add(result);
    } catch (ex) {
      foodStream.addError(ex);
    }
  }
}
