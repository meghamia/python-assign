import 'dart:convert';
import 'package:firstproject/Product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<ProductsResponseModel> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final productsResponseModel = ProductsResponseModel.fromJson(data);
      return productsResponseModel;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
