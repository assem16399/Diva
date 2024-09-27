import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  SignupResponse({
    this.id,
    this.email,
    this.token,
    this.refreshToken,
    this.expiresIn,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  @JsonKey(name: 'localId')
  final String? id;
  final String? email;
  @JsonKey(name: 'idToken')
  final String? token;
  final String? refreshToken;
  final String? expiresIn;
}
