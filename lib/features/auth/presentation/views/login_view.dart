import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar(context, text: 'تسجيل الدخول'));
  }
}
