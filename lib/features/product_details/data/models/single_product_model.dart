import 'package:json_annotation/json_annotation.dart';

part 'single_product_model.g.dart';

@JsonSerializable()
class SingleProductModel {
  SingleProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      _$SingleProductModelFromJson(json);

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
}

@JsonSerializable()
class Rating {
  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  final double? rate;
  final int? count;
}
