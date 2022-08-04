import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wow_panda/src/controllers/food_controller.dart';
import 'package:wow_panda/src/model/food_model.dart';
import 'package:wow_panda/src/pages/sign_in/sign_in_page.dart';
import 'package:wow_panda/src/utitilies/navigator.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  FoodController foodController = FoodController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              pushAndRemoveAll(context, const SignInPage());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<List<FoodModel>>(
        stream: foodController.fetchAllFoodStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final food = snapshot.data![index];
                return ListTile(
                  title: Text(food.name),
                  subtitle: Text("${food.price}"),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
