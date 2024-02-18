import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
      create: ((context) => CartProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes Collection',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: yellowColor),
          primaryColor: yellowColor,
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
