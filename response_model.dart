import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:test1/product_response_model.dart';

class Flutterapi extends StatefulWidget {
  const Flutterapi({super.key});

  @override
  State<Flutterapi> createState() => _FlutterapiState();
}

class _FlutterapiState extends State<Flutterapi> {
  ProductsResponseModel? productresponsemodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('API'),
            ElevatedButton(
              onPressed: () {
                loadproducts();
              },
              child: Text('click'),
            ),
            if (productresponsemodel?.products != null)
              Expanded(
                child: ListView.builder(
                  itemCount: (productresponsemodel!.products!.length <= 10)
                      ? productresponsemodel!.products!.length
                      : 10, // Display up to 9 items or fewer if there are less than 9
                  itemBuilder: (context, index) {
                    final product = productresponsemodel!.products![index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(product.thumbnail ?? 'thumbnail'),
                        title: Column(
                          children: [
                            Text(product.title ?? 'title'),
                            Text(product.description ?? 'Description'),
                            Text('\$${product.rating}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void loadproducts() async {
    print('here');
    final dio = Dio();
    final response = await dio.get('https://dummyjson.com/products');
    productresponsemodel = ProductsResponseModel.fromJson(response.data);
    setState(() {});
    print(productresponsemodel);
  }
}






