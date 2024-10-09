import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  SignupRequestBody({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
