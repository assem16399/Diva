import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final dynamic errors;

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}