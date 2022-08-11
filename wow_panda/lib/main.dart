import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow_panda/src/controllers/cart_controller.dart';
import 'package:wow_panda/src/pages/root/root_page.dart';
import 'package:wow_panda/src/pages/sign_in/sign_in_page.dart';
import 'package:wow_panda/src/widgets/bottom_navigation_widget.dart';

void main() async {
  ///
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('km', 'KH'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('km', 'KH'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationController()),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Wow Panda',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.green,
            centerTitle: false,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        home: FirebaseAuth.instance.currentUser != null ? const RootPage() : const SignInPage(),
      ),
    );
  }
}
