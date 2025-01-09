import 'package:flutter/material.dart';
import 'package:shoe_marketplace/global_variables.dart';
import 'package:shoe_marketplace/product_card.dart';
import 'package:shoe_marketplace/product_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filterOptions = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Reebok',
    'Converse',
    'New Balance',
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filterOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoe\nMarketplace',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 196,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 65,
            child: ListView.builder(
              itemCount: filterOptions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filterOptions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filterOptions[index]),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      side: BorderSide(
                        color: Colors.black,
                        width: 1.2,
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Colors.amber
                          : Color.fromARGB(224, 239, 236, 236),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductPage(product: product);
                    }));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'].toString(),
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? Color.fromRGBO(216, 240, 253, 1)
                        : Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
