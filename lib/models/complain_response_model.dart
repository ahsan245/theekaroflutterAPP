import 'dart:convert';

import 'package:theek_karo/models/user.dart';

ComplainResponseModel complainResponseJson(String str) {
  final jsonData = json.decode(str);
  final data = Dataa.fromJson(jsonData['data']);

  return ComplainResponseModel.fromJson(jsonData);
}

class ComplainResponseModel {
  late final String message;
  late final Dataa data;

  ComplainResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = Dataa.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['message'] = message;
    _data['data'] = data.toJson();

    return _data;
  }
}

class Dataa {
  late String user;
  late String complainName;
  late String complainDescription;
  late String userAddress;
  late String userContact;
  late String complainId;
  late bool complainStatus;
  late String complainCategory;
  late String assignedTech;
  late String longitude;
  late String latitude;

  Dataa({
    required this.user,
    required this.complainName,
    required this.complainDescription,
    required this.userAddress,
    required this.userContact,
    required this.complainId,
    required this.complainStatus,
    required this.complainCategory,
    required this.assignedTech,
    required this.longitude,
    required this.latitude,
  });

  Dataa.fromJson(Map<String, dynamic> json) {
    user = json["user"];
    complainName = json["complainName"];
    complainDescription = json["complainDescription"];
    userAddress = json["userAddress"];
    userContact = json["userContact"];
    complainId = json["complainId"];
    complainStatus = json["complainStatus"];
    complainCategory = json["complainCategory"];
    assignedTech = json["assignedTech"];
    longitude = json["longitude"];
    latitude = json["latitude"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['userId'] = user;
    _data['complainName'] = complainName;
    _data['usercomplainDescriptionId'] = complainDescription;
    _data['userAddress'] = userAddress;
    _data['userContact'] = userContact;
    _data['complainId'] = complainId;
    _data['complainStatus'] = complainStatus;
    _data['complainCategory'] = complainCategory;
    _data['assignedTech'] = assignedTech;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    return _data;
  }
}
