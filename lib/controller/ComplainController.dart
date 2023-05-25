import 'dart:convert';
import 'package:get/get.dart';
import 'package:theek_karo/api/api_requests.dart';
import 'package:theek_karo/models/complain_model.dart';
import 'package:theek_karo/pages/dashboard_page.dart';

class ComplainController extends GetxController {
  List<ComplainModel> complainList = [];

  var isLoad = false;

  getUserComplains() {
    isLoad = true;
    update();
    var jsonData;
    ApiRequest().getRequest(
        'https://theek-karo-api.herokuapp.com/api/findbyuserId/$user',
        (success) {
      jsonData = json.decode(success);

      complainList
          .clear(); // Clear existing complainList before adding new data

      for (var a in jsonData['data']) {
        complainList.add(ComplainModel(
            id: a['complainId'] ?? '',
            name: a['complainName'] ?? '',
            desc: a['complainDescription'] ?? '',
            status: a['complainStatus'] ?? '',
            assignedTech: a['assignedTech']['techId'] ?? '',
            userid: a['user']['userId'] ?? '',
            address: a['userAddress'] ?? ''));
      }

      isLoad = false;
      update();
    }, (fail) {
      isLoad = false;
      update();
      print(fail);
    });
  }

  void fetchData() {
    getUserComplains();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
