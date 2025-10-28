part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdateds extends CartItemState {
  final CartItemEntity cartItemEntity;

  const CartItemUpdateds({required this.cartItemEntity});
}
