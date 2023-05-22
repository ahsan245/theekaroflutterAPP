import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/components/tech_card.dart';
import 'package:theek_karo/components/tech_short_card.dart';
import 'package:theek_karo/components/widget_col_exp.dart';
import 'package:theek_karo/components/widget_custom_stepper.dart';
import 'package:theek_karo/config.dart';
import 'package:theek_karo/models/complain.dart';
import 'package:theek_karo/models/complain_response_model.dart';
import 'package:theek_karo/pages/dashboard_page.dart';
import 'package:theek_karo/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theek_karo/utils/appcolors.dart';
import 'package:theek_karo/utils/apptext.dart';
import 'package:theek_karo/utils/custombutton.dart';
import 'package:theek_karo/utils/star_rating.dart';

import '../components/tech_short_card.dart';
import '../models/tech.dart';
import '../models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class TechComplainDetailPage extends ConsumerStatefulWidget {
  const TechComplainDetailPage({super.key});

  @override
  _TechComplainDetailPageState createState() => _TechComplainDetailPageState();
}

class _TechComplainDetailPageState
    extends ConsumerState<TechComplainDetailPage> {
  double rating = 3.5;
  String complainId = "";
  String complainName = "";
  String complainDescription = "";
  String userAddress = "";
  String userContact = "";
  String category = "";
  String ahsan = "";
  String assignedTech = "";
  bool isAsyncCallProcess = false;
  String _comments = "";
  bool _value = false;
  List<int> _checkedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: AppColors.deepOrange,
          titleSpacing: 0,
          elevation: 0,
          title: Text(
            "Complain Details",
            style:
                TextStyle(color: AppColors.white, fontSize: Get.height * 0.024),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                "/home",
                arguments: {
                  'complainId': complainId,
                  'userId': user,
                  'assignedTech': assignedTech,
                },
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          )),
      body: ListView(
        padding: EdgeInsets.all(Get.height * 0.024),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: _userDetails(ref),
            ),
          ),
          _complainDetails(ref),
          //roww

          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.dividerColors))),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      complainId = arguments['complainId'];
      assignedTech = arguments['assignedTech'];
      user = arguments['user'];
      //complainName = arguments['complainName'];
      // complainDescription = arguments['complainDescription'];
      // userAddress = arguments['userAddress'];
      // userContact = arguments['userContact'];
      // category = arguments['category'];

      // print(complainName);
      // print(complainDescription);
      // print(userAddress);
      // print(userContact);
      // print(category);
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _checkedItems = [];
  }

  Widget _complainDetails(WidgetRef ref) {
    final details = ref.watch(complainDetailsProvider(complainId));
    return details.when(
      data: (model) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _complainDetailsUI(model!),
          ],
        );
      },
      error: (error, stackTrace) {
        if (error is FormatException) {
          return const Center(
              child: Text(
                  "Invalid response from server. Please try again later."));
        } else {
          return const Center(
              child: Text("An error occurred. Please try again later."));
        }
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _complainDetailsUI(Complain model) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.complainName,
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
                  model.complainStatus ? "Not Active" : "Active",
                  style: TextStyle(
                      color: AppColors.white, fontSize: Get.height * 0.014),
                ),
              ),
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
                fontSize: Get.height * 0.025, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            model.complainDescription,
            style: TextStyle(
                fontSize: Get.height * 0.019, fontWeight: FontWeight.w400),
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
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Text(model.userAddress),
                ],
              ),
              SizedBox(
                width: Get.height * 0.03,
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              'Complain Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: Get.height * 0.005,
            ),
            Text(model.complainCategory),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              const Text(
                'Checklist',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 400,
                        height: 300,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: model.complainCheckList.length,
                                itemBuilder: (context, index) {
                                  return CheckboxListTile(
                                    title: Text(model.complainCheckList[index]),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    value: _checkedItems.contains(index),
                                    onChanged: (bool? value) {
                                      if (value != null && value) {
                                        setState(() {
                                          _checkedItems.add(index);
                                        });
                                      } else {
                                        setState(() {
                                          _checkedItems.remove(index);
                                        });
                                      }
                                    },
                                    activeColor: Colors.deepOrange,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 130, // set the height of the SizedBox here
                        child: TextField(
                          maxLines: 4, // set the number of lines to be shown
                          onChanged: (value) {
                            _comments = value;
                            // handle the text field value change here
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your comments here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
                      if (_checkedItems.length ==
                          model.complainCheckList
                              .length) // Show button if all items are checked
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isAsyncCallProcess = true;
                            });
                            APIService.updateComplainStatus(
                                    complainId, true, _comments)
                                .then((response) {
                              setState(() {
                                isAsyncCallProcess = false;
                              });

                              if (response != null) {
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  Config.appName,
                                  "Complain Resolved Successfully",
                                  "Ok",
                                  () {},
                                );
                              } else {
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  Config.appName,
                                  "Complain not Completed",
                                  "Ok",
                                  () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              }
                            });
                            print(_comments);
                          },
                          child: Text('Complete Complain'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange, // Background color
                            onPrimary: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 11), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  16), // Button border radius
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _userDetails(WidgetRef ref) {
    final details = ref.watch(userDetailsProvider(user));
    return details.when(
        data: (model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userDetailsUI(model!),
            ],
          );
        },
        error: (_, __) => const Center(child: Text("Error")),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _userDetailsUI(User model) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.dividerColors))),
          ),
          const Text(
            "Customer Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Text(model.fullName),
                ],
              ),
              SizedBox(
                width: Get.height * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Text(model.email),
                ],
              ),
              // Container(
              //   height: 100,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25),
              //     image: DecorationImage(
              //       image: NetworkImage(model.fullImagePath),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Contact',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              Text(model.contact),
            ],
          ),
          // Text(
          //   model.fullName,
          //   style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.dividerColors))),
          ),
        ],
      ),
    );
  }
}
