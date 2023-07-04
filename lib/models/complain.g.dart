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
      refBill: json['refBill'] as String,
      billAmount: json['billAmount'] as String,
      techComment: json['techComment'] as String,
      paymentStatus: json['paymentStatus'] as bool,
      completeUpdate: json['completeUpdate'] as bool,
      startComplain: json['startComplain'] as bool,
      complainImage: json['complainImage'] as String,
      createdAt: json['createdAt'] as String,
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
      'refBill': instance.refBill,
      'billAmount': instance.billAmount,
      'techComment': instance.techComment,
      'paymentStatus': instance.paymentStatus,
      'completeUpdate': instance.completeUpdate,
      'startComplain': instance.startComplain,
      'complainImage': instance.complainImage,
      'createdAt': instance.createdAt,
      'complainCheckList': instance.complainCheckList,
    };
