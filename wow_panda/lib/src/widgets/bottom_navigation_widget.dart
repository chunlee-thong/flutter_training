import 'package:easy_localization/easy_localization.dart';
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
        // // if (context.locale == const Locale("en", "US")) {
        // //   context.setLocale(const Locale("km", "KH"));
        // // } else {
        // //   context.setLocale(const Locale("en", "US"));
        // // }

        // showDatePicker(
        //   context: context,
        //   initialDate: DateTime.now(),
        //   firstDate: DateTime(2000),
        //   lastDate: DateTime(3000),
        // );
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: tr("home"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.assessment),
          label: "order".tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: "profile".tr(),
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
