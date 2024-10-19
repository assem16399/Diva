import 'package:freezed_annotation/freezed_annotation.dart';


part 'category_product_response_model.g.dart';

@JsonSerializable()
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

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
}

@JsonSerializable()
class Rating {
  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  final double rate;
  final int count;
}
