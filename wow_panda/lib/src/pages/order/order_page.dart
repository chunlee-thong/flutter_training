import 'dart:math';

import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  Tween<double> tween = Tween(begin: 0.0, end: 1.0);

  late Animation<double> animation;

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  GlobalKey key = GlobalKey();

  @override
  void initState() {
    animation = Tween<double>(
      begin: 0.0,
      end: pi * 2,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double size = 200;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///
          // TweenAnimationBuilder<double>(
          //   tween: tween,
          //   curve: Curves.bounceIn,
          //   duration: const Duration(milliseconds: 2000),
          //   builder: (context, value, child) {
          //     return Opacity(
          //       opacity: value,
          //       child: Container(
          //         width: size * value,
          //         height: size * value,
          //         color: Colors.red,
          //       ),
          //     );
          //   },
          // ),

          ///Custom
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Container(
                key: key,
                margin: const EdgeInsets.only(top: 0),
                width: size,
                height: size,
                color: Colors.green,
              );
            },
          ),

          // SlideTransition(
          //   position: animation,
          //   child: Container(
          //     margin: const EdgeInsets.only(top: 32),
          //     width: size,
          //     height: size,
          //     color: Colors.blue,
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
          // Offset offset = box.localToGlobal(Offset.zero);
          // print(offset);

          // //controller.repeat();
          controller.repeat();
          // return;
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: const Text("GO"),
      ),
    );
  }
}
