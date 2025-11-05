import 'package:flutter/material.dart';
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
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : provider.errorMessage != null
            ? Text(provider.errorMessage!)
            : provider.product == null
            ? const Text("No Data")
            : ProductCard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.loadProducts(), // 🔥 load API
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
