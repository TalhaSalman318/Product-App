import 'package:flutter/material.dart';
import 'package:product_app/widgets/category_chip.dart';
import 'package:product_app/widgets/product_card.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.errorMessage != null
          ? Center(child: Text(provider.errorMessage!))
          : provider.product == null
          ? const Center(child: Text("No Data"))
          : Column(
              children: [
                // 🔹 Simply call the Category list
                const CategoryListView(),

                // 🔹 Products Grid
                const Expanded(child: ProductCard()),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.loadProducts(), // 🔥 load API
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
