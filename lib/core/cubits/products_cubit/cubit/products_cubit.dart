import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/repos/products_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo productRepo;
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
