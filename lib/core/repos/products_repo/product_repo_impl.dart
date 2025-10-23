import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/models/product_model.dart';
import 'package:e_commerce/core/repos/products_repo/product_repo.dart';
import 'package:e_commerce/core/services/data_service.dart';
import 'package:e_commerce/core/utils/backend_endpoints.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseServices databaseServices;

  ProductsRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseServices.getData(
                path: BackendEndpoints.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseServices.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      // List<ProductModel> products = data
      //     .map((e) => ProductModel.fromJson(e))
      //     .toList();
      // List<ProductEntity> productsEntities = products
      //     .map((e) => e.toEntity())
      //     .toList();
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
