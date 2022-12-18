import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/config.dart';

import 'category.dart';
part 'tech.freezed.dart';
part 'tech.g.dart';

List<Tech> techsFromJson(dynamic str) =>
    List<Tech>.from((str).map((x) => Tech.fromJson(x)));

@freezed
abstract class Tech with _$Tech {
  factory Tech({
    required String techName,
    required Category category,
    required String techShortDescription,
    required double techPrice,
    required double techSalePrice,
    required String techImage,
    required String techType,
    required String techStatus,
    required String techId,
  }) = _Tech;

  factory Tech.fromJson(Map<String, dynamic> json) => _$TechFromJson(json);
}

extension TechExt on Tech {
  String get fullImagePath => Config.imageURL + techImage;

  int get calculateDiscount {
    double disPercent = 0;

    if (!techPrice.isNaN) {
      double regularPrice = techPrice;
      double salePrice = techSalePrice > 0 ? techSalePrice : regularPrice;

      double discount = regularPrice - salePrice;
      disPercent = (discount / regularPrice) * 100;
    }
    return disPercent.round();
  }
}
