import 'package:flutter/material.dart';
import 'package:product_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return ListView.builder(
      itemCount: provider.productModel!.products.length,
      itemBuilder: (context, index) {
        final item = provider.productModel!.products[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.category.toString()),
          leading: Image.network(item.thumbnail, width: 50),
          trailing: Text('\$${item.price}'),
        );
      },
    );
  }
}
