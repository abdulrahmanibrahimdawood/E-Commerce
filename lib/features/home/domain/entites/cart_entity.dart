import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CarItemEntity> cartItems;
  CartEntity({required this.cartItems});

  addCartItems(CarItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  bool isExist(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CarItemEntity getCarItem(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return carItem;
      }
    }
    return CarItemEntity(productEntity: product, count: 1);
  }
}
