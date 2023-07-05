import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theek_karo/pages/tesst.dart';

TechLoginResponseModel techloginResponseJson(String str) {
  final jsonData = json.decode(str);
  print('JSON data: $jsonData');
  final data = TechData.fromJson(jsonData['data']);
  print('TechData object: $data');

  return TechLoginResponseModel.fromJson(jsonData);
}

class TechLoginResponseModel {
  late final String message;
  late final TechData data;

  TechLoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = TechData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['message'] = message;
    _data['data'] = data.toJson();

    return _data;
  }
}

class TechData {
  late final String techName;
  late final String email;
  late final String techID;
  late final String token;

  TechData({
    required this.techName,
    required this.email,
    required this.techID,
    required this.token,
  });

  TechData.fromJson(Map<String, dynamic> json) {
    techName = json["techName"];
    email = json["email"];
    techID = json["techID"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['techName'] = techName;
    _data['email'] = email;
    _data['techID'] = techID;
    _data['token'] = token;
    return _data;
  }
}
