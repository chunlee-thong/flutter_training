import 'package:flutter/material.dart';

import 'src/pages/sign_in/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wow Panda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // locale: const Locale("km", "KH"),
      // supportedLocales: const [
      //   Locale("km", "KH"),
      //   Locale("en", "US"),
      // ],
      home: const SignInPage(),
    );
  }
}
