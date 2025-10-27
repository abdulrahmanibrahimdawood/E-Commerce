import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CarItemEntity> cartItems;
  CartEntity({required this.cartItems});

  addCartItems(CarItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  bool isExist(ProductEntity productEntity) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }
}
