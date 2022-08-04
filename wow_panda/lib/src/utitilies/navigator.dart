import 'package:flutter/material.dart';

push(BuildContext context, Widget page) {
  return Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

pushReplacement(BuildContext context, Widget page) {
  return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
}

pushAndRemoveAll(BuildContext context, Widget page) {
  return Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}
