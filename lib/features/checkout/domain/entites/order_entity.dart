import 'package:e_commerce/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity(
    this.cartEntity, {
    required this.shippingAddressEntity,
    this.payWithCash,
    required this.uId,
  });
  calculateShippingCost() {
    if (payWithCash!) {
      return 40;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
