import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_input_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> createOrder({required OrderInputEntity order});
}
