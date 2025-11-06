import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          Image.asset(Assets.assetsImagesLocation),
          const SizedBox(width: 8),
          Text(
            'شارع النيل، مبنى رقم ١٢٣',
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          SizedBox(
            child: Row(
              children: [
                Image.asset(Assets.assetsImagesEdit),
                const SizedBox(width: 4),
                Text(
                  'تعديل',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
