import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: Container(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            final String image = "https://picsum.photos/${200 + index}";
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondary) {
                      return FadeTransition(
                        opacity: animation,
                        child: AnotherHeroWidget(
                          image: image,
                          tag: "photo-$index",
                        ),
                      );
                    },
                  ),
                );
              },
              child: Hero(
                tag: "photo-$index",
                child: Image.network(
                  image,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AnotherHeroWidget extends StatelessWidget {
  final String image;
  final String tag;
  const AnotherHeroWidget({Key? key, required this.image, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: tag,
        child: Image.network(
          image,
          width: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
