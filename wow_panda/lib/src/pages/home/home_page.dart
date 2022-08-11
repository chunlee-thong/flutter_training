import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:wow_panda/src/controllers/food_controller.dart';
import 'package:wow_panda/src/model/food_model.dart';
import 'package:wow_panda/src/widgets/custom_error_widget.dart';
import 'package:wow_panda/src/widgets/food_card.dart';
import 'package:wow_panda/src/widgets/loading_widget.dart';

import '../../widgets/cart_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  FoodController foodController = FoodController();
  late BehaviorSubject<List<FoodModel>?> foodFt = BehaviorSubject();

  void fetchFoods([bool reloading = false]) async {
    try {
      if (reloading) {
        foodFt.add(null);
      }
      var result = await foodController.fetchAllFoods();
      foodFt.add(result);
    } catch (ex) {
      foodFt.addError(ex);
    }
  }

  @override
  void initState() {
    fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        AppBar(
          elevation: 1.0,
          title: Row(
            children: [
              const Icon(
                Icons.food_bank_outlined,
                size: 28,
              ),
              const SizedBox(width: 4),
              const Text("title").tr(
                args: ["chunlee", "how are you"],
              ),
            ],
          ),
          centerTitle: false,
          actions: [
            const CartIcon(),
            IconButton(
              onPressed: () => fetchFoods(false),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        Expanded(
          child: StreamBuilder<List<FoodModel>?>(
            stream: foodFt,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildFoodGrid(snapshot.data!);
              } else if (snapshot.hasError) {
                return CustomErrorWidget(error: snapshot.error);
              }
              return const LoadingWidget();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFoodGrid(List<FoodModel> foods) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return FoodCard(
          food: foods[index],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
