import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/widgets/custom_app_bar_inside.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_items_list.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  buildAppBarInside(
                    context,
                    title: 'السلة',
                    showNotification: false,
                  ),
                  SizedBox(height: 12),
                  CartHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(child: CustomDivider()),
            CartItemsList(),
            SliverToBoxAdapter(child: CustomDivider()),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: CustomButton(onPressed: () {}, text: 'الدفع  120جنيه'),
        ),
      ],
    );
  }
}
