import 'package:cubit/cubit.dart';
import 'package:flutter_demo/src/product_repository.dart';
import 'package:flutter_demo/src/product_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({this.repository}) : super(InitialState()) {
    _getTrendingClothes();
  }

  final ProductRepository repository;

  void _getTrendingClothes() async {
    try {
      emit(LoadingState());
      final products = await repository.getProducts();
      emit(LoadedState(products));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
