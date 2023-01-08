// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      fullName: json['fullName'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      userId: json['userId'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'password': instance.password,
      'email': instance.email,
      'userId': instance.userId,
      'token': instance.token,
    };
