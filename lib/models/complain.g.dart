// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Complain _$$_ComplainFromJson(Map<String, dynamic> json) => _$_Complain(
      complainName: json['complainName'] as String,
      complainDescription: json['complainDescription'] as String,
      userAddress: json['userAddress'] as String,
      complainCategory: json['complainCategory'] as String,
      complainStatus: json['complainStatus'] as bool,
      complainId: json['complainId'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      complainCheckList: (json['complainCheckList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ComplainToJson(_$_Complain instance) =>
    <String, dynamic>{
      'complainName': instance.complainName,
      'complainDescription': instance.complainDescription,
      'userAddress': instance.userAddress,
      'complainCategory': instance.complainCategory,
      'complainStatus': instance.complainStatus,
      'complainId': instance.complainId,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'complainCheckList': instance.complainCheckList,
    };
