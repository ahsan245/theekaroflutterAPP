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
  String ahsan = "";
  bool isAsyncCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Form(
            child: _techDetails(ref),
          ),
          inAsyncCall: isAsyncCallProcess,
          opacity: .3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      complainId = arguments["complainId"];
      print(complainId);
    }
    super.didChangeDependencies();
  }

  Widget _techDetails(WidgetRef ref) {
    final details = ref.watch(complainDetailsProvider(complainId));
    return details.when(
        data: (model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model!.complainDescription),
              SizedBox(
                height: 10,
              )
            ],
          );
        },
        error: (_, __) => const Center(child: Text("Error")),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _techDetailsUI(Dataa model) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.complainName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Status: ${model.complainDescription}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Number of Hours you Want to Book",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomStepper(
                lowerLimit: 1,
                upperLimit: 20,
                stepValue: 1,
                iconSize: 22.0,
                value: 1,
                onChanged: (value) {},
              ),
              TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                icon: const Icon(
                  Icons.mobile_friendly_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  "Book Now",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ColExpand(
            title: "TECNICIAN DESCRIPTION",
            content: model.userAddress,
          ),
        ],
      ),
    );
  }
}
