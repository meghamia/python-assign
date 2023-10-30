import 'package:get/get.dart';
import 'package:firstproject/Product_model.dart';
import 'package:firstproject/api_service.dart';

class ProductController extends GetxController {
  Rx<ProductsResponseModel?> productsResponseModel = Rx<ProductsResponseModel?>(
      null);
  bool isLoading = false;
  int currentPage = 1;
  final int itemsPerPage = 10;

  @override
  void onInit() {
    super.onInit();
    loadProductsAndNavigate();
  }

  Future<void> loadProductsAndNavigate() async {
    try {
      isLoading = true;
      final response = await ApiService
          .fetchProducts(); // Call your API service method to fetch data
      final newProducts = response;

      if (productsResponseModel.value == null) {
        productsResponseModel.value = newProducts;
      } else {
        productsResponseModel.value!.products?.addAll(
            newProducts.products ?? []);
      }

      isLoading = false;
    }
    catch (e) {
      print('Error loading products: $e');
      isLoading = false;
    }
  }


}
