import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/config.dart';
import 'package:theek_karo/pages/dashboard_page.dart';
import 'package:geolocator/geolocator.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;
  String? complainName;
  String? complainDescription;
  String? confirmPassword;
  String? userContact;
  String? userAddress;
  String? complainCategory;
  double? lon;
  double? lat;
  void _getLocation(BuildContext context) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location Reterieved Successfully')),
      );
      print(lat);
      print(lon);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to get location')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Complains"),
        ),
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _registerUI(context),
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
      user = arguments["userId"];
      print("merrrr");
      print(user);
    }
    super.didChangeDependencies();
  }

  Widget _registerUI(BuildContext context) {
    print("k");
    print(user);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const Center(
            child: Text(
              "Start Complain ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Complain Title",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.info, color: Colors.black),
              "ComplainTitle",
              "Enter Complain Title", (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "* Required";
            }
            return null;
          }, (onSavedVal) {
            complainName = onSavedVal.toString().trim();
          },
              showPrefixIcon: true,
              borderRadius: 8,
              fontSize: 14,
              borderColor: Colors.grey.shade400,
              prefixIconPaddingLeft: 10,
              prefixIconColor: Colors.black,
              borderFocusColor: Colors.red.shade200),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Description",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
              context,
              Icon(Icons.description, color: Colors.black),
              "ComplainDescription",
              "Enter Description", (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "* Required";
            }
            return null;
          }, (onSavedVal) {
            complainDescription = onSavedVal.toString().trim();
          },
              showPrefixIcon: true,
              borderRadius: 10,
              fontSize: 14,
              borderColor: Colors.grey.shade400,
              prefixIconPaddingLeft: 10,
              prefixIconColor: Colors.black,
              isMultiline: true,
              borderFocusColor: Colors.red.shade200),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "User Address",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.home, color: Colors.black),
              "UserAddress",
              "Enter your Address", (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "* Required";
            }
            return null;
          }, (onSavedVal) {
            userAddress = onSavedVal.toString().trim();
          },
              showPrefixIcon: true,
              borderRadius: 10,
              fontSize: 14,
              borderColor: Colors.grey.shade400,
              prefixIconPaddingLeft: 10,
              prefixIconColor: Colors.black,
              borderFocusColor: Colors.red.shade200),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                _getLocation(context);
              },
              child: Text('Send Your Current Location'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Choose Category",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10, left: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 200, 200, 200),
              ),
              child: DropdownButton(
                value: complainCategory,
                items: [
                  DropdownMenuItem(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.computer_rounded),
                        ),
                        SizedBox(width: 2.0),
                        Text(
                          "Hardware",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                    value: "Hardware",
                  ),
                  DropdownMenuItem(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.upgrade_rounded),
                        ),
                        SizedBox(width: 2.0),
                        Text(
                          "Connectivity",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                    value: "Connectivity",
                  ),
                  DropdownMenuItem(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.cast_connected_rounded),
                        ),
                        SizedBox(width: 2.0),
                        Text(
                          "Software",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                    value: "Software",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    complainCategory = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: FormHelper.submitButton(
              "Submit",
              () {
                if (validateSave()) {
                  setState(() {
                    isAsyncCallProcess = true;
                  });
                  APIService.registerComplain(user, complainName!,
                          complainDescription!, userAddress!, complainCategory!)
                      .then((response) {
                    setState(() {
                      print("afasf");
                      print(response?.complainId);
                      isAsyncCallProcess = false;
                    });

                    if (response != null) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Complain Launched Successfully",
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                            "/complain-details",
                            arguments: {
                              'complainId': response.complainId,
                              'assignedTech': response.assignedTech,
                              // 'complainName': response.complainName,
                              // 'complainDescription':
                              //     response.complainDescription,
                              // 'userAddress': response.userAddress,
                              // 'userContact': response.userContact,
                              // 'complainCategory': response.complainCategory,
                            },
                          );
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Complain not Launched",
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  });
                  //API REQUEST
                }
              },
              btnColor: Colors.deepOrange,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validateSave() {
    final form = globalKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
