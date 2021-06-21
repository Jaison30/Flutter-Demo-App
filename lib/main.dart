import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_demo/src/product_cubit.dart';
import 'package:flutter_demo/src/product_page.dart';
import 'package:flutter_demo/src/product_page_details.dart';
import 'package:flutter_demo/src/product_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: CubitProvider<ProductsCubit>(
        create: (context) => ProductsCubit(
          repository: ProductRepository(
            Dio(),
          ),
        ),
        child: ProductsPage(),
      ),
      routes: {'/checkout': (BuildContext context) => ProductDetails()},
    );
  }
}
