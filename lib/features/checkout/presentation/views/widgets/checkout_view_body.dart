import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/helper_funcations/build_error_bar.dart';
import 'package:e_commerce/core/utils/app_keys.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_entity.dart';
import 'package:e_commerce/features/checkout/domain/entites/paypal_payment_entity/paypal.payment.entity.dart';
import 'package:e_commerce/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  final ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
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
    valueNotifier.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          SizedBox(height: 20),
          Expanded(
            child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: formKey,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                handleAddressValidation();
              } else {
                var orderEntity = context.read<OrderEntity>();
                context.read<AddOrderCubit>().addOrder(order: orderEntity);
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      showErrorBar(context, 'يرجي تحديد طريقه للدفع');
    }
  }

  void handleAddressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
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

void processPayment(BuildContext context) {
  var orderEntity = context.read<OrderEntity>();
  PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
    orderEntity,
  );
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: kPaypalClientId,
        secretKey: kPaypalSecretKey,
        transactions: [paypalPaymentEntity.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ),
  );
}
