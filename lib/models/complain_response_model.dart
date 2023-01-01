import 'dart:convert';

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
  late final String user;
  late final String complainName;
  late final String complainDescription;
  late final String userAddress;
  late final String userContact;
  late final String complainId;

  Dataa({
    required this.user,
    required this.complainName,
    required this.complainDescription,
    required this.userAddress,
    required this.userContact,
    required this.complainId,
  });

  Dataa.fromJson(Map<String, dynamic> json) {
    user = json["user"];
    complainName = json["complainName"];
    complainDescription = json["complainDescription"];
    userAddress = json["userAddress"];
    userContact = json["userContact"];
    complainId = json["complainId"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['userId'] = user;
    _data['complainName'] = complainName;
    _data['usercomplainDescriptionId'] = complainDescription;
    _data['userAddress'] = userAddress;
    _data['userContact'] = userContact;
    _data['complainId'] = complainId;
    return _data;
  }
}
