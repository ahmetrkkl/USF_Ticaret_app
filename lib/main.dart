import 'package:ecoomerce_app/pages/cart_page.dart';
import 'package:ecoomerce_app/pages/into_page.dart';
import 'package:ecoomerce_app/pages/shop_pages.dart';
import 'package:ecoomerce_app/themes/light_model.dart';
import 'package:flutter/material.dart';
import 'pages/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:ecoomerce_app/models/shop.dart';
import 'models/shop.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create:(context) => Shop(),
        child: const MyApp(),


      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page' : (context) => const IntroPage(),
        '/shop_page' : (context) => const ShopPage(),
        '/cart_page' : (context) => const CartPage(),

      },

    );
  }
}