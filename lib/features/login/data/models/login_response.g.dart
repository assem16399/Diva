// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['localId'] as String?,
      email: json['email'] as String?,
      token: json['idToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiresIn: json['expiresIn'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'localId': instance.id,
      'email': instance.email,
      'idToken': instance.token,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };
