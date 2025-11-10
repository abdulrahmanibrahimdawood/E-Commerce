import 'amount.payment.entity.dart';
import 'item_list.payment.entity.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(PaypalPaymentEntity entity) {
    return PaypalPaymentEntity(
      amount: entity.amount,
      description: entity.description,
      itemList: entity.itemList,
    );
  }
}
