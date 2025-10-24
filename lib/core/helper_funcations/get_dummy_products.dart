import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utils/app_images.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    image: Assets.assetsImagesAppIcon,
    name: 'Apple',
    description: 'Description',
    code: 'Code',
    price: 10,
    isFeatured: true,
    imageUrl: 'Image',
    numberOfCalories: 10,
    unitAmount: 10,
    expirationMonths: 10,
    isOrganic: true,
    reviews: [],
    avgRating: 10,
    ratingCount: 10,
    sellingCount: 10,
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
