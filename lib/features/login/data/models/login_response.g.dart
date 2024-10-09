// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['displayName'] as String?,
      json['registered'] as String?,
      kind: json['localId'] as String?,
      email: json['idToken'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'localId': instance.kind,
      'idToken': instance.email,
      'displayName': instance.displayName,
      'registered': instance.registered,
    };
