import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../repository/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repo = ProductRepository();
  bool isLoading = false;
  ProductModel? product;
  String? errorMessage;

  Future<void> loadProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      product = await _repo.fetchProducts();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  // detail selected product
  Product? selectedProduct;

  void selectProduct(Product product) {
    selectedProduct = product;
    notifyListeners();
  }
}
