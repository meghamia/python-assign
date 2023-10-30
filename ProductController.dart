import 'package:firstproject/Controller1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductButton extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        backgroundColor: Colors.brown,
      ),
      
      body: GetBuilder<ProductController>(
        builder: (controller)
        {
          final productsResponse = controller.productsResponseModel.value;

          if (productsResponse != null && productsResponse.products != null) {
            return ListView.builder(
              itemCount: productsResponse.products!.length,
              itemBuilder: (context, index) {
                final product = productsResponse.products![index];
                return ListTile(
                  title: Text('Product ID: ${product.id}'),
                  subtitle: Text('Product Title: ${product.title}'),
                );
              },
            );
          } else {
            return Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}
