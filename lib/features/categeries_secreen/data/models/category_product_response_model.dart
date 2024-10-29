import 'package:diva/features/home_Screen/data/models/home_product_response_model.dart'
    as home;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'category_product_response_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CategoryProductResponseModel {
  factory CategoryProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductResponseModelFromJson(json);

  CategoryProductResponseModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory CategoryProductResponseModel.fromHomeProductResponseModel(
      home.HomeProductResponseModel homeProductResponseModel) {
    return CategoryProductResponseModel(
        id: homeProductResponseModel.id,
        title: homeProductResponseModel.title,
        price: homeProductResponseModel.price,
        description: homeProductResponseModel.description,
        category: homeProductResponseModel.category,
        image: homeProductResponseModel.image,
        rating: Rating.fromRating(homeProductResponseModel.rating));
  }

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final Rating rating;
}

@JsonSerializable()
@HiveType(typeId: 1)
class Rating {
  Rating({required this.rate, required this.count});

  factory Rating.fromRating(home.Rating rating) {
    return Rating(rate: rating.rate, count: rating.count);
  }

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  @HiveField(7)
  final double rate;
  @HiveField(8)
  final int count;
}
