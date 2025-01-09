import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_marketplace/cart_provider.dart';

class ProductPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoe Details',
            style: Theme.of(context).appBarTheme.titleTextStyle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'] as String,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(231, 238, 244, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${widget.product['price']}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        (widget.product['sizes'] as List<int>).map((size) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Chip(
                          label: Text(
                            size.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor:
                              selectedSize == size ? Colors.amber : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addProduct(widget.product);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(214, 254, 234, 53),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
