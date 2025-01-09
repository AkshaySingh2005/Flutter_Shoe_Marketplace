import 'package:flutter/material.dart';
import 'package:shoe_marketplace/cart_page.dart';
import 'package:shoe_marketplace/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            currentPage = val;
          });
        },
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: const Color.fromARGB(224, 39, 38, 38),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
