import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/tech.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var fullName = "";
  var email = "";
  var userId = "";
  var token = "";

  @override
  Widget build(BuildContext context) {
    Data(fullName: fullName, email: email, userId: userId, token: token);
    print(fullName);
    return Container();
  }
}
