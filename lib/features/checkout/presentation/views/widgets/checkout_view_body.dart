import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(currentPageIndex: currentPageIndex),
          SizedBox(height: 20),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomButton(
            onPressed: () {
              pageController.animateToPage(
                currentPageIndex + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            text: getNextButtonText(currentPageIndex),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

String getNextButtonText(int currentPageIndex) {
  switch (currentPageIndex) {
    case 0:
      return 'التالي';
    case 1:
      return 'التالي';
    case 2:
      return 'الدفع عبر PayPal';
    default:
      return 'التالي';
  }
}
