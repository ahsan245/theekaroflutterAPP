import 'dart:convert';
import 'package:http/http.dart' as http;

typedef successCallBack = void Function(String);
typedef failCallBack = void Function(String);

class ApiRequest {
  getRequest(var api, successCallBack, failCallBack) async {
    // var token = bo/x.read(AppText.authToken);
    // Map<String, String> TokenHeader = {
    //   'Content-type': 'application/json',
    //   'xt-user-token': '$token'
    // };
    var request = await http.get(Uri.parse(api));
    // print(request.body);
    if (request.statusCode == 200) {
      successCallBack(request.body);
    } else {
      failCallBack(request.body);
    }
  }
}
