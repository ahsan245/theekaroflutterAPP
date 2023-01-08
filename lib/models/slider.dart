import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/config.dart';

part 'slider.freezed.dart';
part 'slider.g.dart';

List<SliderModel> slidersFromJson(dynamic str) => List<SliderModel>.from(
      (str).map(
        (e) => SliderModel.fromJson(e),
      ),
    );

@freezed
abstract class SliderModel with _$SliderModel {
  factory SliderModel({
    required String sliderName,
    required String sliderImage,
    required String sliderId,
  }) = _Slider;

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}

extension SliderModelExt on SliderModel {
  String get fullImagePath => Config.imageURL + sliderImage;
}
