import 'package:e_commerce/features/checkout/presentation/views/widgets/inactive_step_item.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [InActiveStepItem()]);
  }
}
