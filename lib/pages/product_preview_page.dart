import 'package:flutter/material.dart';
import 'package:shopping_app/colors.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/pages/product_card.dart';
import 'package:shopping_app/pages/product_details.dart';

class ProductPreviewPage extends StatefulWidget {
  const ProductPreviewPage({super.key});

  @override
  State<ProductPreviewPage> createState() => _ProductPreviewPageState();
}

class _ProductPreviewPageState extends State<ProductPreviewPage> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata',
  ];
  late String selectedFilters;
  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  final border = const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
      borderSide: BorderSide(color: Colors.grey));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Shoes \nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: ((context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 17, right: 5, top: 15, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedFilters = filter;
                          });
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedFilters == filter
                                  ? yellowColor
                                  : lightskyColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Center(
                              child: Text(
                                filters[index],
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    final product = products[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                ProductDetails(product: product)),
                          ),
                        );
                      },
                      child: ProductCard(
                        title: products[index]['title'].toString(),
                        price: products[index]['price'].toString(),
                        productImage: products[index]['imageUrl'].toString(),
                        backgroundColor:
                            index.isEven ? skyColor : lightskyColor,
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
