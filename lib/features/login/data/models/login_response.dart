import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.id,
    this.email,
    this.token,
    this.refreshToken,
    this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(name: 'localId')
  final String? id;
  final String? email;
  @JsonKey(name: 'idToken')
  final String? token;
  final String? refreshToken;
  final String? expiresIn;
}
