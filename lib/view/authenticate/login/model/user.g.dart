// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      firmano: json['firmano'] as int?,
      password: json['password'] as String?,
      aktif: json['aktif'] as bool?,
      ad: json['ad'] as String?,
      mail: json['mail'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firmano': instance.firmano,
      'password': instance.password,
      'aktif': instance.aktif,
      'ad': instance.ad,
      'token': instance.token,
      'mail': instance.mail,
    };
