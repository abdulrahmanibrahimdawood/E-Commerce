import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          backgroundImage: Assets.assetsImagesBackGround,
          image: Assets.assetsImagesPageViewImage1,
          subTitle:
              'اكتشف تجربة تسوّق مميزة مع Shopify! استعرض مجموعتنا الواسعة من المنتجات المتنوعة، وتمتع بأفضل العروض والجودة العالية في مكان واحد.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('مرحبًا بك في'), Text('Shopify')],
          ),
        ),
        PageViewItem(
          backgroundImage: Assets.assetsImagesBackGround,
          image: Assets.assetsImagesPageViewImage2,
          subTitle:
              'نقدّم لك أفضل المنتجات المختارة بعناية. استعرض التفاصيل والصور والتقييمات لتتأكد من اختيار المنتج المثالي.',
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
