import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// ------------------- BANNER MODEL -------------------
/// Simple model for demo. Replace with your API model if needed.
class BannerModel {
  final String imageUrl;
  BannerModel({required this.imageUrl});
}

/// ------------------- BANNER CAROUSEL WIDGET -------------------
class BannerCarousel extends StatelessWidget {
  final List<BannerModel> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text("No Banners")),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true, // 🔹 auto scrolling
        enlargeCenterPage: true, // 🔹 current banner thoda bada
        viewportFraction: 0.9,
      ),
      items: banners.map((banner) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            banner.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}
