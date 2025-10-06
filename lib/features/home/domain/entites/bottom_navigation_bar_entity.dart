import 'package:e_commerce/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String name;
  final String inActiveImage;
  final String activeImage;
  BottomNavigationBarEntity({
    required this.name,
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    name: 'الرئيسية',
    activeImage: Assets.assetsImagesHomeIcon,
    inActiveImage: Assets.assetsImagesHomeIconActive,
  ),
  BottomNavigationBarEntity(
    name: 'المنتجات',
    activeImage: Assets.assetsImagesProductIcon,
    inActiveImage: Assets.assetsImagesProductIconActive,
  ),
  BottomNavigationBarEntity(
    name: 'سلة التسوق',
    activeImage: Assets.assetsImagesCartIcon,
    inActiveImage: Assets.assetsImagesCartIconActive,
  ),
  BottomNavigationBarEntity(
    name: 'حسابي',
    activeImage: Assets.assetsImagesProfileIcon,
    inActiveImage: Assets.assetsImagesHomeIconActive,
  ),
];
