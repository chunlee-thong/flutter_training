import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget/inherited_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedColor(
      color: Colors.red,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "",
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Product {
  final String title;
  final double price;

  Product(this.title, this.price);
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();

  List<Product> products = [
    Product("product 1", 32.2),
    Product("product 2", 23.2),
  ];

  void scroll() {
    // scrollController
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Product List"),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                controller: scrollController,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.fastfood,
                      color: InheritedColor.of(context).color,
                    ),
                    title: Text(products[index].title),
                    subtitle: Text("\$${products[index].price}"),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Horizontal List"),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var _ in [1, 2, 3])
                    const Card(
                      color: Colors.red,
                      margin: EdgeInsets.only(right: 16),
                      child: SizedBox(height: 200, width: 200),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
