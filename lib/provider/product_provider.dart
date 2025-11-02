import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../repository/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repo = ProductRepository();
  bool isLoading = false;
  ProductModel? productModel;
  String? errorMessage;

  Future<void> loadProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      productModel = await _repo.fetchProducts();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
