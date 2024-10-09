import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse(
    this.displayName,
    this.registered, {
    this.kind,
    this.email,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(name: 'localId')
  final String? kind;
  @JsonKey(name: 'idToken')
  final String? email;
  final String? displayName;
  final String? registered;
}
