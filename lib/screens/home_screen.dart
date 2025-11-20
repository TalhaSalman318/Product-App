import 'package:flutter/material.dart';
import 'package:product_app/widgets/category_chip.dart';
import 'package:product_app/widgets/product_card.dart';
import 'package:product_app/widgets/slider.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    final banners = [
      BannerModel(
        imageUrl: "https://via.placeholder.com/400x180.png?text=Banner+1",
      ),
      BannerModel(
        imageUrl: "https://via.placeholder.com/400x180.png?text=Banner+2",
      ),
      BannerModel(
        imageUrl: "https://via.placeholder.com/400x180.png?text=Banner+3",
      ),
    ];

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
                BannerCarousel(banners: banners),

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
