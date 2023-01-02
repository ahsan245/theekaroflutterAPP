import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/components/widget_col_exp.dart';
import 'package:theek_karo/components/widget_custom_stepper.dart';
import 'package:theek_karo/config.dart';
import 'package:theek_karo/models/complain_response_model.dart';
import 'package:theek_karo/providers.dart';

class ComplainDetailPage extends ConsumerStatefulWidget {
  const ComplainDetailPage({super.key});

  @override
  _ComplainDetailPageState createState() => _ComplainDetailPageState();
}

class _ComplainDetailPageState extends ConsumerState<ComplainDetailPage> {
  String complainId = "";
  String complainName = "";
  String complainDescription = "";
  String userAddress = "";
  String userContact = "";
  String ahsan = "";
  bool isAsyncCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      complainId = arguments['complainId'];
      complainName = arguments['complainName'];
      complainDescription = arguments['complainDescription'];
      userAddress = arguments['userAddress'];
      userContact = arguments['userContact'];

      print(complainName);
      print(complainDescription);
      print(userAddress);
      print(userContact);
      print(complainId);
    }
    super.didChangeDependencies();
  }
}
