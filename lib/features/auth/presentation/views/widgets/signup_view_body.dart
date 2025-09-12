import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_feild.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/terms_and_condations.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormFeild(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormFeild(
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TermsAndCondations(),
            SizedBox(height: 30),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            SizedBox(height: 33),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
