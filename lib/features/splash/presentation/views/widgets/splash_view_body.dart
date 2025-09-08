import 'package:e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(),
        SizedBox(),

        Image.asset(Assets.assetsImagesSplash),

        SvgPicture.asset(Assets.assetsImagesSplashButtom, fit: BoxFit.fill),
      ],
    );
  }
}
