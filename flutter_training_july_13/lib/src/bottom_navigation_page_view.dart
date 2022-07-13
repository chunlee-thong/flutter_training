import 'package:flutter/material.dart';

class BottomNavigationPageView extends StatefulWidget {
  const BottomNavigationPageView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPageView> createState() => _BottomNavigationPageViewState();
}

class _BottomNavigationPageViewState extends State<BottomNavigationPageView> {
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );

  int currentIndex = 0;

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation"),
      ),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        pageSnapping: true,
        itemBuilder: (context, index) {
          return MyWidget(
            color: colors[index],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          pageController.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final Color color;
  const MyWidget({Key? key, required this.color}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    print("init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: widget.color,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
