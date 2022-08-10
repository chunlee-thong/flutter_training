import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_panda/src/controllers/cart_controller.dart';
import 'package:wow_panda/src/model/food_model.dart';

import '../constant/app_style.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 4,
          )
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildFoodImage(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(food.name, style: kSubtitleStyle),
              const SizedBox(height: 4),
              Text(
                food.description,
                style: kCaptionStyle.copyWith(color: Colors.grey),
                maxLines: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${food.price}"),
              InkWell(
                onTap: () {
                  context.read<CartController>().addItemToCart(food);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.add_shopping_cart_outlined),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFoodImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        food.images.first,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
