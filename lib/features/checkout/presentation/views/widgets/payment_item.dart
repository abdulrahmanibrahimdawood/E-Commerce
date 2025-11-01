import 'package:e_commerce/core/utils/app_decoration.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$title:', style: TextStyles.bold13),
        SizedBox(height: 8),
        Container(decoration: AppDecoration.greyBoxDecoration, child: child),
      ],
    );
  }
}
