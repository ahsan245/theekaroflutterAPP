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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theek_karo/utils/appcolors.dart';
import 'package:theek_karo/utils/apptext.dart';
import 'package:theek_karo/utils/custombutton.dart';
import 'package:theek_karo/utils/star_rating.dart';

class ComplainDetailPage extends ConsumerStatefulWidget {
  const ComplainDetailPage({super.key});

  @override
  _ComplainDetailPageState createState() => _ComplainDetailPageState();
}

class _ComplainDetailPageState extends ConsumerState<ComplainDetailPage> {
  double rating = 3.5;
  String complainId = "";
  String complainName = "";
  String complainDescription = "";
  String userAddress = "";
  String userContact = "";
  String ahsan = "";
  bool isAsyncCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: AppColors.deepOrange,
          titleSpacing: 0,
          elevation: 0,
          title: Text(
            AppText.back,
            style:
                TextStyle(color: AppColors.white, fontSize: Get.height * 0.024),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          )),
      body: ListView(
        padding: EdgeInsets.all(Get.height * 0.024),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.height * 1),
                    color: Colors.black12),
                padding: EdgeInsets.all(Get.height * 0.015),
                child: Icon(
                  Icons.home_repair_service,
                  size: Get.height * 0.03,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    complainName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * 0.024),
                  ),
                  SizedBox(height: Get.height * 0.005),
                  Text(
                    'Monday 5th January - 11:50pm',
                    style: TextStyle(
                        color: Colors.black54, fontSize: Get.height * 0.016),
                  )
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.height * 0.02),
                    color: AppColors.deepOrange),
                padding: EdgeInsets.symmetric(
                    horizontal: Get.height * 0.02, vertical: Get.height * 0.01),
                child: Text(
                  'Active',
                  style: TextStyle(
                      color: AppColors.white, fontSize: Get.height * 0.014),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.dividerColors))),
          ),
          Text(
            AppText.complainTitle,
            style: TextStyle(
                fontSize: Get.height * 0.02, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            complainDescription,
            style: TextStyle(
                fontSize: Get.height * 0.016, fontWeight: FontWeight.w400),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.dividerColors))),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  const Text('Mon - 24th June 2023'),
                ],
              ),
              SizedBox(
                width: Get.height * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Text('01:31PM'),
                ],
              )
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.height * 0.005,
            ),
            Text(userAddress),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Text(
                'Total Cost',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              const Text('2000 PKR'),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.dividerColors))),
          ),
          const Text(
            "Technician",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/user.png',
                ),
              ),
              SizedBox(
                width: Get.height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Joseph Aina',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.005),
                  Text(
                    'Professional Health Expert',
                    style: TextStyle(
                        color: Colors.black54, fontSize: Get.height * 0.016),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '<1 mile',
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(height: Get.height * 0.005),
                  StarRating(
                    color: AppColors.deepOrange,
                    rating: rating,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          CustomButton(
            btnAction: () {},
            btnText: 'Confirm Technician',
          )
        ],
      ),
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
