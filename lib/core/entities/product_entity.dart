import 'package:e_commerce/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final num sellingCount;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
    required this.reviews,
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeatured,
    this.isOrganic = false,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.sellingCount,
  });
}
