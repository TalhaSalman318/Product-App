import 'package:product_app/services/network_client.dart';

import '../models/product_model.dart';

class ProductRepository {
  final ApiService _apiService = ApiService();

  Future<ProductModel> fetchProducts() async {
    final response = await _apiService.getProducts();
    return ProductModel.fromJson(response.data); // ✅ model conversion
  }
}
