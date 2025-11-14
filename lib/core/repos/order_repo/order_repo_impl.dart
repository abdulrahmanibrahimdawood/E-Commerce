import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce/core/services/data_service.dart';
import 'package:e_commerce/core/utils/backend_endpoints.dart';
import 'package:e_commerce/features/checkout/data/order/models/order_model.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_input_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseServices firestoreServices;
  OrderRepoImpl({required this.firestoreServices});
  @override
  Future<Either<Failure, void>> createOrder({
    required OrderInputEntity order,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await firestoreServices.addData(
        path: BackendEndpoints.addOrder,
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
