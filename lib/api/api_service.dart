import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:html';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:theek_karo/config.dart';
import 'package:theek_karo/models/category.dart';
import 'package:theek_karo/models/complain_response_model.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/otp_login_response_mode.dart.dart';
import 'package:theek_karo/models/slider.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/models/tech_filter.dart';
import 'package:theek_karo/models/user.dart';
import 'package:theek_karo/models/user_filter.dart';
import 'package:theek_karo/utils/shared_service.dart';

final apiService = Provider((ref) => APIService());

class APIService {
  static final StreamController<Data> streamController =
      StreamController<Data>.broadcast();
  static Stream<Data> get stream => streamController.stream;
  static var client = http.Client();

  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.categoryAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return categoriesFromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<List<Tech>?> getTechs(
    TechFilterModel techFilterModel,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': techFilterModel.paginationModel.page.toString(),
      'pageSize': techFilterModel.paginationModel.pageSize.toString()
    };

    if (techFilterModel.categoryId != null) {
      queryString["categoryId"] = techFilterModel.categoryId!;
    }

    if (techFilterModel.sortBy != null) {
      queryString["sort"] = techFilterModel.sortBy!;
    }
    if (techFilterModel.techIds != null) {
      queryString["techIds"] = techFilterModel.techIds!.join(",");
    }

    var url = Uri.http(Config.apiURL, Config.techAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return techsFromJson(data["data"]);
    } else {
      return null;
    }
  }

  static Future<bool> registerUser(
    String fullName,
    String email,
    String password,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        {"fullName": fullName, "email": email, "password": password},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Data?> loginUser(
    String email,
    String password,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        {"email": email, "password": password},
      ),
    );
    // print(response.body);

    if (response.statusCode == 200) {
      // SharedService.setLoginDetails(loginResponseJson(response.body));

      final loginResponse = loginResponseJson(response.body);
      final data = loginResponse.data;
      // print(data.toJson());
      streamController.add(data);
      return data;
    } else {
      return null;
    }
  }

  Future<List<SliderModel>?> getSliders(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.sliderAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return slidersFromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<Tech?> getTechDetails(String techId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, '${Config.techAPI}/$techId');
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return Tech.fromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<Dataa?> getComplainDetails(String complainId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, '${Config.complainAPI}/$complainId');
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      final complainResponse = complainResponseJson(response.body);
      final data = complainResponse.data;
      print(data.complainName);
      return data;
    } else {
      return null;
    }
  }

  static Future<Dataa?> registerComplain(
    String userId,
    String complainName,
    String complainDescription,
    String userAddress,
    String userContact,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.complainAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        {
          "user": userId,
          "complainName": complainName,
          "complainDescription": complainDescription,
          "userAddress": userAddress,
          "userContact": userContact,
        },
      ),
    );

    if (response.statusCode == 200) {
      final complainResponse = complainResponseJson(response.body);
      final data = complainResponse.data;
      // print(data.toJson());
      return data;
    } else {
      return null;
    }
  }

  static Future<OtpLoginResponseModel> otpLogin(String mobileNO) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.otpLoginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone": mobileNO}),
    );

    return otploginResponseJson(response.body);
  }

  static Future<OtpLoginResponseModel> verifyOTP(
    String mobileNo,
    String otpHash,
    String otpCode,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.otpVerifyAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone": mobileNo, "otp": otpCode, "hash": otpHash}),
    );

    return otploginResponseJson(response.body);
  }
}
