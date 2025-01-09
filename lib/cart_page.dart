import 'package:flutter/material.dart';
import 'package:shoe_marketplace/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Cart', style: Theme.of(context).appBarTheme.titleTextStyle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                radius: 32,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
              title: Text(
                cartItem['title'] as String,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Size: ${cartItem['size']}'),
            ),
          );
        },
      ),
    );
  }
}
