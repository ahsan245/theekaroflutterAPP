import 'dart:convert';

OtpEmailResponseModel otpmailResponseJson(String str) =>
    OtpEmailResponseModel.fromJson(json.decode(str));

class OtpEmailResponseModel {
  OtpEmailResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final String? data;

  OtpEmailResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}
