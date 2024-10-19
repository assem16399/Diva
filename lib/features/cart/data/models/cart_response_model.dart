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

  final int id;
  final String date;
  final List<SummarizedCartItemModel> products;

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);

  CartResponseModel copyWith({
    int? id,
    String? date,
    List<SummarizedCartItemModel>? products,
  }) {
    return CartResponseModel(
      id: id ?? this.id,
      date: date ?? this.date,
      products: products ?? this.products,
    );
  }
}

@JsonSerializable()
class SummarizedCartItemModel {
  SummarizedCartItemModel({
    required this.productId,
    required this.quantity,
  });

  factory SummarizedCartItemModel.fromJson(Map<String, dynamic> json) =>
      _$SummarizedCartItemModelFromJson(json);
  final int productId;
  final int quantity;

  // create toJson method
  Map<String, dynamic> toJson() => _$SummarizedCartItemModelToJson(this);

  SummarizedCartItemModel copyWith({
    int? productId,
    int? quantity,
  }) {
    return SummarizedCartItemModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartProductResponseModel {
  CartProductResponseModel({
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
    required this.image,
  });

  factory CartProductResponseModel.fromJson(
    Map<String, dynamic> json, {
    required int quantity,
  }) =>
      CartProductResponseModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: json['price'] as double?,
        image: json['image'] as String?,
        qty: quantity,
      );

  final int? id;
  final String? title;
  final String? image;
  final double? price;
  final int qty;

  // create toJson method
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'image': image,
      };

  double get totalPrice => price! * qty;

  CartProductResponseModel copyWith({
    int? id,
    String? title,
    double? price,
    String? image,
    int? qty,
  }) {
    return CartProductResponseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      qty: qty ?? this.qty,
    );
  }
}
