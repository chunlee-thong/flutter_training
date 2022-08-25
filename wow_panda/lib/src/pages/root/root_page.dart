import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_panda/src/pages/home/home_page.dart';
import 'package:wow_panda/src/widgets/bottom_navigation_widget.dart';

import '../order/order_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static final List<Widget> _pages = [
    const HomePage(),
    IntervalAnimation(),
    Container(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavigationController = Provider.of<BottomNavigationController>(
      context,
      listen: false,
    );

    return Provider(
      create: (context) => 10,
      child: Scaffold(
        body: PageView(
          controller: bottomNavigationController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
