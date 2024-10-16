import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  CartResponseModel({
    required this.id,
    required this.date,
    required this.products,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  final String id;
  final String date;
  final List<SummarizedCartItemModel> products;
}

@JsonSerializable()
class SummarizedCartItemModel {
  SummarizedCartItemModel({
    required this.productId,
    required this.quantity,
  });

  factory SummarizedCartItemModel.fromJson(Map<String, dynamic> json) =>
      _$SummarizedCartItemModelFromJson(json);
  final String productId;
  final int quantity;
}

@JsonSerializable()
class CartProductResponseModel {
  CartProductResponseModel({
    required this.id,
    required this.title,
    required this.price,
  });

  factory CartProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductResponseModelFromJson(json);

  final String id;
  final String title;
  final double price;
}
