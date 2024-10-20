import 'package:json_annotation/json_annotation.dart';

part 'mange_product_body_model.g.dart';

@JsonSerializable()
class ManageProductModel {
  ManageProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ManageProductModel.fromJson(Map<String, dynamic> json) =>
      _$ManageProductModelFromJson(json);

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      };

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
