import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String productImage;
  final Color backgroundColor;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.productImage,
      required this.backgroundColor});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 260,
        width: double.infinity,
        child: Card(
          color: widget.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '\$ ${widget.price}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 130,
                  child: Center(
                    child: Image(
                      image: AssetImage(widget.productImage),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
