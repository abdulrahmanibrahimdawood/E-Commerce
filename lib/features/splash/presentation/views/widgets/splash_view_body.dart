import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/on_boardig_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNavigation();
  }

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

  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        if (!mounted) return;

        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
