import 'package:flutter/material.dart';

class InheritedColor extends InheritedWidget {
  const InheritedColor({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;

  static InheritedColor of(BuildContext context) {
    final InheritedColor? result = context.dependOnInheritedWidgetOfExactType<InheritedColor>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedColor old) => color != old.color;
}
