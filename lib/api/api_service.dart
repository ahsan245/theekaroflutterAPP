import 'dart:convert';
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:theek_karo/config.dart';
import 'package:theek_karo/models/category.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/models/tech_filter.dart';

final apiService = Provider((ref) => APIService());

class APIService {
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

    var url = Uri.http(Config.apiURL, Config.techAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return techsFromJson(data["data"]);
    } else {
      return null;
    }
  }
}
