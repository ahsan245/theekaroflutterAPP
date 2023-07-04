import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/models/user.dart';
import 'dart:convert';

import '../config.dart';
part 'complain.freezed.dart';
part 'complain.g.dart';

List<Complain> complainsFromJson(dynamic str) =>
    List<Complain>.from((str).map((x) => Complain.fromJson(x)));

@freezed
abstract class Complain with _$Complain {
  factory Complain({
    required String complainName,
    required String complainDescription,
    required String userAddress,
    required String complainCategory,
    required bool complainStatus,
    required String complainId,
    required String longitude,
    required String latitude,
    required String refBill,
    required String billAmount,
    required String techComment,
    required bool paymentStatus,
    required bool completeUpdate,
    required bool startComplain,
    required String complainImage,
    required String createdAt,
    required List<String> complainCheckList,
  }) = _Complain;

  factory Complain.fromJson(Map<String, dynamic> json) =>
      _$ComplainFromJson(json);
}

extension ComplainExt on Complain {
  String get fullImagePath => Config.imageURL + complainImage;
}
