import 'package:e_commerce/core/helper_funcations/get_currency.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_entity.dart';

import 'details.payment.entity.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
  factory Amount.fromEntity(OrderEntity order) => Amount(
    total: order.calculateTotalPriceAfterDiscountAndShipping().toString(),
    currency: getCurrency(),
    details: DetailsEntity.fromJson(order),
  );
}
