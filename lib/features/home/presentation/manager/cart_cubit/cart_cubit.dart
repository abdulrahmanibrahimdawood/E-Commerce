import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var carItem = cartEntity.getCarItem(productEntity);
    if (isProductExist) {
      carItem.increaseQuantity();
    } else {
      cartEntity.addCartItems(carItem);
    }
    emit(CartItemAdded());
  }

  void deleteCartItem(CartItemEntity carItem) {
    cartEntity.removeCartItems(carItem);
    emit(CartItemRemoved());
  }
}
