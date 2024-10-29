import 'package:diva/features/categeries_secreen/data/models/category_product_response_model.dart'
    as cat;
import 'package:json_annotation/json_annotation.dart';

part 'home_product_response_model.g.dart';

@JsonSerializable()
class HomeProductResponseModel {
  factory HomeProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProductResponseModelFromJson(json);

  HomeProductResponseModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory HomeProductResponseModel.fromCategoryProductResponseModel(
      cat.CategoryProductResponseModel categoryProductResponseModel) {
    return HomeProductResponseModel(
        id: categoryProductResponseModel.id,
        title: categoryProductResponseModel.title,
        price: categoryProductResponseModel.price,
        description: categoryProductResponseModel.description,
        category: categoryProductResponseModel.category,
        image: categoryProductResponseModel.image,
        rating: Rating.fromRating(categoryProductResponseModel.rating));
  }

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

  factory Rating.fromRating(cat.Rating rating) {
    return Rating(rate: rating.rate, count: rating.count);
  }

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  final double rate;
  final int count;
}
