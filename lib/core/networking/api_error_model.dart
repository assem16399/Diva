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

class FirebaseAuthErrorModel extends ApiErrorModel {
  FirebaseAuthErrorModel({
    super.message,
    super.code,
    super.errors,
  });

  factory FirebaseAuthErrorModel.fromJson(Map<String, dynamic> json) {
    return FirebaseAuthErrorModel(
      message: json['message'] as String? ?? 'Unknown error occurred',
      code: json['code'] as int?,
      errors: json['data'],
    );
  }
}
