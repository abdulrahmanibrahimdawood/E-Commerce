import 'package:e_commerce/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_address_widget.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        OrderSummaryWidget(),
        SizedBox(height: 16),
        ShippingAddressWidget(),
      ],
    );
  }
}
