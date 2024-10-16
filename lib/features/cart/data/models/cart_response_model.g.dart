// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      id: json['id'] as String,
      date: json['date'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) =>
              SummarizedCartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'products': instance.products,
    };

SummarizedCartItemModel _$SummarizedCartItemModelFromJson(
        Map<String, dynamic> json) =>
    SummarizedCartItemModel(
      productId: json['productId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$SummarizedCartItemModelToJson(
        SummarizedCartItemModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };

ProductCartResponseModel _$ProductCartResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductCartResponseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductCartResponseModelToJson(
        ProductCartResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
    };
