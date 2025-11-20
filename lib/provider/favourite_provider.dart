import 'package:flutter/material.dart';
import '../models/product_model.dart'; // apka Product model

class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favourites = [];

  List<Product> get favourites => _favourites;

  /// Add product to favourites
  void addToFavourites(Product product) {
    if (!_favourites.contains(product)) {
      _favourites.add(product);
      notifyListeners();
    }
  }

  /// Remove product from favourites
  void removeFromFavourites(Product product) {
    _favourites.remove(product);
    notifyListeners();
  }

  /// Check if product is favourite
  bool isFavourite(Product product) {
    return _favourites.contains(product);
  }

  /// Total favourite items
  int get totalItems => _favourites.length;
}
