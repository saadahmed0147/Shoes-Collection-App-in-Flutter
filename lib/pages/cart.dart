import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: ((context, index) {
            return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  backgroundImage:
                      AssetImage(products[3]['imageUrl'] as String),
                ),
                title: Text(
                  '${products[0]['title']}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: Text(
                  '\$${products[0]['price']}',
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )));
          })),
    );
  }
}
