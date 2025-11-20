import 'package:flutter/material.dart';
import 'package:product_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          category,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    final categories =
        provider.product?.products
            .map((e) => e.category.toString())
            .toSet()
            .toList() ??
        [];

    return SizedBox(
      height: 70, // proper height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CategoryChip(category: categories[index]),
          );
        },
      ),
    );
  }
}
