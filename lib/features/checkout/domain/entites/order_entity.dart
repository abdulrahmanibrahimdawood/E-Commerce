import 'package:e_commerce/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddressEntity;

  OrderEntity(
    this.shippingAddressEntity, {
    required this.cartItems,
    required this.payWithCash,
  });
}
