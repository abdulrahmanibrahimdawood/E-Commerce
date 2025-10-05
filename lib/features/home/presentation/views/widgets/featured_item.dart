import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Image.asset(Assets.assetsImagesTest),
          Container(
            child: Column(
              children: [
                Text(
                  'عروض العيد',
                  style: TextStyles.regular13.copyWith(color: Colors.white),
                ),
                Text(
                  'خصم 25%',
                  style: TextStyles.bold19.copyWith(color: Colors.white),
                ),
                FeaturedItemButton(onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
