import 'package:e_commerce/features/checkout/data/order/models/order_product_model.dart';
import 'package:e_commerce/features/checkout/data/order/models/shipping_address_model.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressEntity;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
  });
  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
    uId: orderEntity.uId,
    shippingAddressEntity: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddressEntity,
    ),
    orderProducts: orderEntity.cartEntity.cartItems
        .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
        .toList(),
    paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
  );
  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'states': 'pending',
      'shippingAddressEntity': shippingAddressEntity.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
