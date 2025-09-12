import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndCondations extends StatelessWidget {
  const TermsAndCondations({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: Offset(14, 0),
          child: Checkbox(value: false, onChanged: (value) {}),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width - kHorizontalPadding * 2 - 48,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق علي ',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
