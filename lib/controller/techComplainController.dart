import 'dart:convert';
import 'package:get/get.dart';
import 'package:theek_karo/api/api_requests.dart';
import 'package:theek_karo/models/complain_model.dart';
import 'package:theek_karo/pages/dashboard_tech_page.dart';

class TechComplainController extends GetxController {
  List<ComplainModel> complainList = [];

  var isLoad = false;

  getUserComplains() {
    isLoad = true;
    update();
    var jsonData;
    ApiRequest().getRequest(
        'https://theek-karo-api.herokuapp.com/api/findbytechId/$techID',
        (success) {
      jsonData = json.decode(success);

      complainList.clear();

      for (var a in jsonData['data']) {
        complainList.add(ComplainModel(
            id: a['complainId'] ?? '',
            name: a['complainName'] ?? '',
            desc: a['complainDescription'] ?? '',
            status: a['complainStatus'] ?? '',
            assignedTech: a['assignedTech']['techId'] ?? '',
            userid: a['user']['userId'] ?? '',
            // categoryassigned: a['categoryassigned']['categoryId'] ?? '',
            address: a['userAddress'] ?? ''));
      }
      print(success);

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
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
}
