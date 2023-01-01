import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/tech.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: APIService.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return Text(data!.fullName);
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
