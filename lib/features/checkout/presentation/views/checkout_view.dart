import 'package:e_commerce/core/widgets/custom_app_bar_inside.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});
  static const routeName = 'checkout';
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        context,
        title: 'الشحن',
        showNotification: false,
      ),
      body: const CheckoutViewBody(),
    );
  }
}
