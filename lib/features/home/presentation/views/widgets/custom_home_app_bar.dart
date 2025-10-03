import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: EdgeInsets.all(12),
        decoration: ShapeDecoration(
          shape: OvalBorder(),
          color: Color.fromARGB(255, 230, 239, 245),
        ),
        child: SvgPicture.asset(Assets.assetsImagesNotification),
      ),
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        'عبدالرحمن إبراهيم',
        style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
      ),
    );
  }
}
