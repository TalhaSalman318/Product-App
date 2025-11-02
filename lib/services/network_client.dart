import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  Future<Response> getProducts() async {
    return await _dio.get('/products'); // ✅ sirf call return kar raha
  }
}
