import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.cart;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text(
                'No items in cart',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: ((context, index) {
                final cartItem = cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                  ),
                  title: Text(
                    '${cartItem['title']}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    'Size: ${cartItem['sizes']}',
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      final deletedItem = cartItem;

                      cartProvider.deleteProduct(cartItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Item removed from cart'),
                          action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                cartProvider.addProduct(deletedItem);
                              }),
                        ),
                      );
                    },

                    //   );
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
