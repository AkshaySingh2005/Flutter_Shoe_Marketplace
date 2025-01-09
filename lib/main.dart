import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_marketplace/cart_provider.dart';
import 'package:shoe_marketplace/global_variables.dart';
import 'package:shoe_marketplace/home_page.dart';
import 'package:shoe_marketplace/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shoe_MartketPlace',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: HomePage(),
        // home: ProductPage(product: products[0]),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
