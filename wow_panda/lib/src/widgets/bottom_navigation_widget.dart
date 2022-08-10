import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavigationController = Provider.of<BottomNavigationController>(context);

    return BottomNavigationBar(
      currentIndex: bottomNavigationController.currentIndex,
      onTap: (index) {
        bottomNavigationController.setIndex(index);
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment),
          label: "Order",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}

class BottomNavigationController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void setIndex(int index) {
    pageController.jumpToPage(index);
    currentIndex = index;
    notifyListeners();
  }
}
