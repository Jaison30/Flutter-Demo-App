import 'package:flutter/material.dart';
import 'package:flutter_demo/src/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel products;
  ProductDetails({Key key, @required this.products}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(products.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                'assets/images/' + products.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${products.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                products.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
