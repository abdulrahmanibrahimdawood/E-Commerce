import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/repos/products_repo/product_repo.dart';
import 'package:e_commerce/core/services/data_service.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    throw UnimplementedError();
  }
}
