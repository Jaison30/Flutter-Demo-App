import 'package:dio/dio.dart';
// import 'dart:convert';
import 'package:flutter_demo/src/product_model.dart';

class ProductRepository {
  ProductRepository(this.client);

  final Dio client;

  Future<List<ProductModel>> getProducts() async {
    try {
      final url =
          'https://fir-app-3a0f7-default-rtdb.firebaseio.com/products.json';

      final response = await client.get(url);

      final List<ProductModel> products = [];
      response.data.forEach((profileId, profileData) {
        products.add(
          ProductModel(
            id: profileData['id'].toString(),
            title: profileData['title'].toString(),
            description: profileData['description'].toString(),
            price: profileData['price'].toString(),
            imageUrl: profileData['imageUrl'].toString(),
          ),
        );
      });
      return products;
    } catch (e) {
      print('Error');
      print(e);
      throw e;
    }
  }
}
