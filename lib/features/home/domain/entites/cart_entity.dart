import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CarItemEntity> cartItems;
  CartEntity({required this.cartItems});

  addCartItems(CarItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
}
