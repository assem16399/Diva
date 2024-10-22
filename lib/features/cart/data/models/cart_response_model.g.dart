// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      id: (json['id'] as num).toInt(),
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
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$SummarizedCartItemModelToJson(
        SummarizedCartItemModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
