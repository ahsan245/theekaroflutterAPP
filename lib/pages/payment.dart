import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jazzcash_flutter/jazzcash_flutter.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:theek_karo/models/complain.dart';
import 'package:theek_karo/pages/dashboard_page.dart';

import '../api/api_service.dart';
import '../config.dart';

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
            Text("Product Name : Windows Update"),
            Text("Product Price : 1500"),
            ElevatedButton(
              onPressed: () {
                _payViaJazzCash(context);
              },
              child: const Text("Purchase Now !"),
            )
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
        ppAmount: '1500',
        ppBillReference:
            'refbill${date.year}${date.month}${date.day}${date.hour}${date.millisecond}',
        ppDescription: 'Product details  Windows KEy - 1500',
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
        // Process the response and check if payment was successful

        // Navigate to a new page with the referenceBillNo and completion message
        // Make API call
        try {
          setState(() {
            isAsyncCallProcess = true;
          });

          var response = await APIService.updatePaymetStatus(
            complainId,
            true,
            paymentDataModelV1.ppBillReference,
          );

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
        } catch (err) {
          print("Error in API call $err");
          // Handle the API call error
        }
      });
    } catch (err) {
      print("Error in payment $err");
      // Handle the payment error
    }
  }
}
