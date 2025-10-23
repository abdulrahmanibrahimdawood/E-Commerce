import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final String image;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final num sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    this.imageUrl,
    required this.numberOfCalories,
    required this.isOrganic,
    required this.unitAmount,
    required this.reviews,
    required this.expirationMonths,
    required this.name,
    required this.sellingCount,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeatured,
    required this.image,
    this.avgRating = 0,
    this.ratingCount = 0,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      code: json['code'] ?? '',
      price: json['price'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
      imageUrl: json['imageUrl'],
      numberOfCalories: json['numberOfCalories'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      expirationMonths: json['expirationMonths'] ?? 0,
      isOrganic: json['isOrganic'] ?? false,
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)),
            )
          : [],
      image: json['image'] ?? '',
      sellingCount: json['sellingCount'] ?? 0,
      avgRating: json['avgRating'] ?? 0,
      ratingCount: json['ratingCount'] ?? 0,
    );
  }
  toJson() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      image: image,
      name: name,
      description: description,
      code: code,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      avgRating: avgRating,
      ratingCount: ratingCount,
      sellingCount: sellingCount,
    );
  }
}
