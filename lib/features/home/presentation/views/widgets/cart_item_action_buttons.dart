import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:flutter/material.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: Icons.add,
          iconColor: Colors.white,
          color: AppColors.primaryColor,
          onPressed: () {
            cartItemEntity.increaseCount();
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.count.toString(),
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          icon: Icons.remove,
          iconColor: Colors.grey,
          color: Color(0xffF3F5F7),
          onPressed: () {
            cartItemEntity.decreaseCount();
          },
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.iconColor,
  });
  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(2),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
