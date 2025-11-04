import 'package:e_commerce/core/helper_funcations/build_error_bar.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });
  final int currentPageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                showErrorBar(context, 'يرجي تحديد طريقه للدفع');
              }
            },
            child: StepItem(
              text: getSteps()[index],
              index: (index + 1).toString(),
              isActive: index <= currentPageIndex,
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
