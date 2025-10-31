import 'package:e_commerce/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(child: ActiveStepItem(text: getSteps()[index]));
      }),
    );
  }

  List<String> getSteps() => ['الشحن', 'العنوان', 'الدفع', 'المراجعة'];
}
