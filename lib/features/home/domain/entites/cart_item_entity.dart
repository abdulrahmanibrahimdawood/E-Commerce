import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CarItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CarItemEntity({required this.productEntity, this.count = 0});
  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    count--;
  }

  @override
  List<Object?> get props => [productEntity];
}
