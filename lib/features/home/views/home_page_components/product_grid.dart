import 'package:flutter/material.dart';
import 'package:pakapaka/features/details/views/details_page.dart';
import 'item_card.dart';

class ProductGrid extends StatelessWidget {
  final List<dynamic> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) => ItemCard(
          product: products[index],
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(product: products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
