import 'package:flutter/material.dart';
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
  late Future<List<FoodModel>> foodFt;
  @override
  void initState() {
    foodFt = foodController.fetchAllFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Row(
            children: const [
              Icon(Icons.food_bank_outlined, size: 28),
              SizedBox(width: 4),
              Text("Wow Panda"),
            ],
          ),
          foregroundColor: Theme.of(context).primaryColor,
          centerTitle: false,
          actions: const [
            CartIcon(),
            // IconButton(onPressed: generateFood, icon: Icon(Icons.add)),
          ],
        ),
        Expanded(
          child: FutureBuilder<List<FoodModel>>(
            future: foodFt,
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
