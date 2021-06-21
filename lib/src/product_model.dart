import 'package:flutter/foundation.dart';

class ProductModel {
  ProductModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });

  final String id;
  final String title;
  final String description;
  final String price;
  final String imageUrl;
}
