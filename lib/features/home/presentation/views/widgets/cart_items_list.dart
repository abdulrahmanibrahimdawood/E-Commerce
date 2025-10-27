import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.carItems});
  final List<CarItemEntity> carItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemCount: carItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(carItemEntity: carItems[index]),
        );
      },
    );
  }
}
