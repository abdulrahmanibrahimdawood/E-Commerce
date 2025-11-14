import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  void updateCartItem(CartItemEntity cartItem) {
    emit(CartItemUpdateds(cartItemEntity: cartItem));
  }
}
