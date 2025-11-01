import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Spacer(),
              Text('150 جنيه', style: TextStyles.semiBold16),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Spacer(),
              Text(
                '30 جنيه',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
            ],
          ),
          SizedBox(height: 9),
          Divider(thickness: 0.6, color: Color(0xffCACACE)),
          SizedBox(height: 9),
          Row(
            children: [
              Text('الكلي', style: TextStyles.bold16),
              Spacer(),
              Text('180 جنيه', style: TextStyles.bold16),
            ],
          ),
        ],
      ),
    );
  }
}
