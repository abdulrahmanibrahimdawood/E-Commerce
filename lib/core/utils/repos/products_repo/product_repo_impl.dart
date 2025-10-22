import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/utils/repos/products_repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    throw UnimplementedError();
  }
}
