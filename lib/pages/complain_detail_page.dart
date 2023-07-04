import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:theek_karo/pages/payment.dart';
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
  String category = "";
  String ahsan = "";
  String assignedTech = "";
  bool isAsyncCallProcess = false;

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImageFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No image taken');
    }
  }

  Future<void> uploadImage(String complaintId) async {
    setState(() {
      showSpinner = true;
    });

    var request = http.MultipartRequest(
      'PUT', // Use PUT for update function
      Uri.parse('https://theek-karo-api.herokuapp.com/api/complain/' +
          complaintId), // Replace with your API URL and append the complaint ID
    );

    request.files.add(await http.MultipartFile.fromPath(
      'complainImage',
      image!.path,
    ));

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print('Image uploaded successfully');
    } else {
      print('Image upload failed');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
            backgroundColor: AppColors.deepOrange,
            titleSpacing: 0,
            elevation: 0,
            title: Text(
              "Complain Details",
              style: TextStyle(
                  color: AppColors.white, fontSize: Get.height * 0.024),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  "/complain-list",
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
                  border: Border(
                      bottom: BorderSide(color: AppColors.dividerColors))),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _techDetails(ref),
                    // const Text(
                    //   'Joseph Aina',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(height: Get.height * 0.005),
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
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      complainId = arguments['complainId'];
      assignedTech = arguments['assignedTech'];
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

      print(complainId);
      print(user);
      print("Tech");
      print(assignedTech);
    }
    super.didChangeDependencies();
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
      error: (_, __) => const Center(child: Text("Error")),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  Widget _complainDetailsUI(Complain model) {
    bool paymentStatus = model.paymentStatus;
    String refBillNo = model.refBill;
    complainId = model.complainId;
    print(complainId);

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
                  color: Colors.black12,
                ),
                padding: EdgeInsets.all(Get.height * 0.015),
                child: Icon(
                  Icons.home_repair_service,
                  size: Get.height * 0.03,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.complainName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.height * 0.024,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.005),
                  Text(
                    model.createdAt,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Get.height * 0.016,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.height * 0.02),
                  color: AppColors.deepOrange,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Get.height * 0.02,
                  vertical: Get.height * 0.01,
                ),
                child: Text(
                  paymentStatus ? "Completed" : "In Progress",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Get.height * 0.014,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.01),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.height * 0.02),
              color: AppColors.green,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.02,
              vertical: Get.height * 0.01,
            ),
            child: Text(
              !model.startComplain
                  ? "Complain Not Started"
                  : "Complain In Progress",
              style: TextStyle(
                color: AppColors.white,
                fontSize: Get.height * 0.014,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: AppColors.dividerColors)),
            ),
          ),
          Text(
            AppText.complainTitle,
            style: TextStyle(
              fontSize: Get.height * 0.02,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            model.complainDescription,
            style: TextStyle(
              fontSize: Get.height * 0.016,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: AppColors.dividerColors)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Get.height * 0.005),
                  Text(model.userAddress),
                ],
              ),
              SizedBox(
                width: Get.height * 0.06,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (model.complainImage == "")
                    GestureDetector(
                      onTap: () {
                        getImageFromCamera();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 100, top: 10),
                        child: Container(
                          child: image == null
                              ? Center(
                                  child: Text('Take Picture'),
                                )
                              : Container(
                                  child: Center(
                                    child: Image.file(
                                      File(image!.path).absolute,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (model.complainImage == "")
                    GestureDetector(
                      onTap: () {
                        // Pass the complaint ID here
                        uploadImage(model.complainId);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                        ),
                        child: Container(
                          height: 30,
                          width: 100,
                          color: Colors.green,
                          child: Center(child: Text('Upload')),
                        ),
                      ),
                    ),
                  if (model.complainImage != "")
                    SizedBox(
                      child: Image.network(
                        model.fullImagePath,
                        fit: BoxFit.fitHeight,
                      ),
                      height: 100,
                      width: 200,
                    ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.02),
              const Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.005),
              Text(model.complainCategory),
            ],
          ),
          Column(
            children: [
              if (!paymentStatus &&
                  model.completeUpdate) // If paymentStatus is false
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      "/payment",
                      arguments: {
                        'complainId': model.complainId,
                      },
                    );
                  },
                  child: const Text('Pay Now'),
                ),
              if (paymentStatus &&
                  model
                      .completeUpdate) // If paymentStatus is true and complainUpdate is true
                Text(
                  'Payment is Paid. RefBill: ${model.refBill} Amount Paid:${model.billAmount}Rs',
                  style: TextStyle(
                    fontSize: Get.height * 0.016,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if (!model
                  .completeUpdate) // If paymentStatus is false and complainUpdate is false
                Text(
                  'Technician Working',
                  style: TextStyle(
                    fontSize: Get.height * 0.016,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _techDetails(WidgetRef ref) {
    final details = ref.watch(techDetailsProvider(assignedTech));
    return details.when(
        data: (model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _techDetailsUI(model!),
            ],
          );
        },
        error: (_, __) => const Center(child: Text("Error")),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _techDetailsUI(Tech model) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTech(
            model: model,
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
