import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});

  addCartItems(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItems(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  bool isExist(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var carItem in cartItems) {
      totalPrice += carItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  CartItemEntity getCarItem(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return carItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }
}
