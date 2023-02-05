import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theek_karo/pages/tesst.dart';

LoginResponseModel loginResponseJson(String str) {
  final jsonData = json.decode(str);
  print('JSON data: $jsonData');
  final data = Data.fromJson(jsonData['data']);
  print('Data object: $data');

  return LoginResponseModel.fromJson(jsonData);
}

class LoginResponseModel {
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['message'] = message;
    _data['data'] = data.toJson();

    return _data;
  }
}

class Data {
  late final String fullName;
  late final String email;
  late final String userId;
  late final String token;
  late final String contact;

  Data({
    required this.fullName,
    required this.email,
    required this.userId,
    required this.token,
    required this.contact,
  });

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json["fullName"];
    email = json["email"];
    userId = json["userId"];
    token = json["token"];
    contact = json["contact"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['userId'] = userId;
    _data['token'] = token;
    _data['contact'] = contact;
    return _data;
  }
}
