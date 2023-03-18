import 'dart:convert';
import 'package:get/get.dart';
import 'package:theek_karo/api/api_requests.dart';
import 'package:theek_karo/models/complain_model.dart';
import 'package:theek_karo/pages/dashboard_page.dart';

class ComplainController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getUserComplains();
  }

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

      for (var a in jsonData['data']) {
        complainList.add(ComplainModel(
            id: a['complainId'] ?? '',
            name: a['complainName'] ?? '',
            desc: a['complainDescription'] ?? '',
            status: a['complainStatus'] ?? '',
            assignedTech: a['assignedTech']['techId'] ?? '',
            userid: a['user']['userId'] ?? '',
            address: a['userAddress'] ?? ''));

        update();
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
}
