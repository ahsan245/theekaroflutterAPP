// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tech.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tech _$$_TechFromJson(Map<String, dynamic> json) => _$_Tech(
      techName: json['techName'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      techShortDescription: json['techShortDescription'] as String,
      techPrice: (json['techPrice'] as num).toDouble(),
      techSalePrice: (json['techSalePrice'] as num).toDouble(),
      techImage: json['techImage'] as String,
      techType: json['techType'] as String,
      techStatus: json['techStatus'] as String,
      techId: json['techId'] as String,
    );

Map<String, dynamic> _$$_TechToJson(_$_Tech instance) => <String, dynamic>{
      'techName': instance.techName,
      'category': instance.category,
      'techShortDescription': instance.techShortDescription,
      'techPrice': instance.techPrice,
      'techSalePrice': instance.techSalePrice,
      'techImage': instance.techImage,
      'techType': instance.techType,
      'techStatus': instance.techStatus,
      'techId': instance.techId,
    };
