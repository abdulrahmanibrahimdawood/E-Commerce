import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(cartItemEntity: cartItems[index]),
        );
      },
    );
  }
}
