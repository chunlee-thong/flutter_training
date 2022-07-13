import 'package:flutter/material.dart';

class FlutterTabBarView extends StatefulWidget {
  const FlutterTabBarView({Key? key}) : super(key: key);

  @override
  State<FlutterTabBarView> createState() => _FlutterTabBarViewState();
}

class _FlutterTabBarViewState extends State<FlutterTabBarView> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 3,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TabBar")),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.red,
            indicatorColor: Colors.blue,
            onTap: (index) {},
            tabs: [
              ...List.generate(
                3,
                (index) => const Tab(text: "Tab index"),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ...List.generate(
                  3,
                  (index) => Tab(text: "$index"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
