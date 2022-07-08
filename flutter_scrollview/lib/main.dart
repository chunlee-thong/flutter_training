import 'package:flutter/material.dart';
import 'package:flutter_scrollview/grid_view.dart';
import 'package:flutter_scrollview/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ScrollView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ScrollViews")),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ElevatedButton(
            onPressed: () {
              context.push(const ListViewPage());
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return const ListViewPage();
              // }));
            },
            child: const Text("ListView"),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(const GridViewPage());
            },
            child: const Text("GridView"),
          ),
        ],
      ),
    );
  }
}

extension BuildContexExtension on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}

extension IntExtension on int {
  int addTen() {
    return this + 10;
  }

  bool get canVote => this >= 18;
}
