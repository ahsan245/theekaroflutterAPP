import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jazzcash_flutter/jazzcash_flutter.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:theek_karo/models/complain.dart';
import 'package:theek_karo/pages/dashboard_page.dart';
import 'package:theek_karo/utils/apptext.dart';

import '../api/api_service.dart';
import '../config.dart';
import '../providers.dart';
import '../utils/appcolors.dart';

bool isAsyncCallProcess = false;

class Payment extends ConsumerStatefulWidget {
  const Payment({super.key});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends ConsumerState<Payment> {
  String paymentStatus = "pending";
  String integritySalt = "62337x452h";
  String merchantID = "MC56908";
  String merchantPassword = "uuv3ws0zx9";
  String transactionUrl = "www.zaibten.com";

  @override
  Widget build(BuildContext context) {
    print(complainId);
    return Scaffold(
      appBar: AppBar(
        title: Text("JazzCash Flutter Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _complainDetails(ref),
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

      print(complainId);
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
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _complainDetailsUI(Complain model) {
    Future _payViaJazzCash(BuildContext c) async {
      try {
        JazzCashFlutter jazzCashFlutter = JazzCashFlutter(
          merchantId: merchantID,
          merchantPassword: merchantPassword,
          integritySalt: integritySalt,
          isSandbox: true,
        );

        DateTime date = DateTime.now();

        JazzCashPaymentDataModelV1 paymentDataModelV1 =
            JazzCashPaymentDataModelV1(
          ppAmount: model.billAmount,
          ppBillReference:
              'refbill${date.year}${date.month}${date.day}${date.hour}${date.millisecond}',
          ppDescription: model.complainName,
          ppMerchantID: merchantID,
          ppPassword: merchantPassword,
          ppReturnURL: transactionUrl,
        );

        jazzCashFlutter
            .startPayment(
          paymentDataModelV1: paymentDataModelV1,
          context: context,
        )
            .then((_response) async {
          print("response from jazzcash $_response");
          try {
            setState(() {
              isAsyncCallProcess = true;
            });

            var response = await APIService.updatePaymetStatus(complainId, true,
                paymentDataModelV1.ppBillReference, model.billAmount);

            setState(() {
              isAsyncCallProcess = false;
            });

            if (response != null) {
              FormHelper.showSimpleAlertDialog(
                context,
                Config.appName,
                "Amount Paid Successfully",
                "Ok",
                () {
                  Navigator.of(context).pushNamed(
                    "/home",
                    arguments: {
                      'userId': user,
                    },
                  );
                },
              );
            } else {
              FormHelper.showSimpleAlertDialog(
                context,
                Config.appName,
                "Transaction not Completed",
                "Ok",
                () {
                  Navigator.of(context).pushNamed(
                    "/home",
                    arguments: {
                      'userId': user,
                    },
                  );
                },
              );
            }
          } catch (err) {
            print("Error in API call $err");
            // Handle the API call error
          }
          // Process the response and check if payment was successful

          // Navigate to a new page with the referenceBillNo and completion message
          // Make API call
        });
      } catch (err) {
        print("Error in payment $err");
        // Handle the payment error
      }
    }

    bool paymentStatus = model.paymentStatus;
    String refBillNo = model.refBill;
    complainId = model.complainId;
    print(complainId);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                      'Monday 5th January - 11:50pm',
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
                SizedBox(height: Get.height * 0.02),
                const Text(
                  'Checklist',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.005),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.complainCheckList.length,
                  itemBuilder: (context, index) {
                    return Text(model.complainCheckList[index]);
                  },
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            const Text(
              'Tech Comments',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.techComment,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: Get.height * 0.005),
                    Text(model.userAddress),
                  ],
                ),
                SizedBox(width: Get.height * 0.03),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Amount to Be Paid ${model.billAmount}Rs',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _payViaJazzCash(context);
                  },
                  child: const Text("Pay Now"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
