import 'package:e_commerce/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  final ShippingAddressEntity? shippingAddressEntity;

  OrderEntity(this.cartEntity, {this.shippingAddressEntity, this.payWithCash});
}
