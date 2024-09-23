import 'package:json_annotation/json_annotation.dart';

part 'app_error_model.g.dart';

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
