import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('الأكثر مبيعًا', style: TextStyles.bold16),
        const Spacer(),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
        ),
      ],
    );
  }
}
