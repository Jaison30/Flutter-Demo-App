import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_demo/src/product_cubit.dart';
import 'package:flutter_demo/src/product_state.dart';
import 'package:flutter_demo/src/product_page_details.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Clothes'),
      ),
      body: CubitBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final products = state.products;

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => Card(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/checkout');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetails(products: products[index]),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(products[index].title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'assets/images/' + products[index].imageUrl),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
