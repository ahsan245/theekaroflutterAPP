import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:theek_karo/pages/register_page.dart';

import '../api/api_service.dart';
import '../config.dart';

class OTPVerifyPage extends StatefulWidget {
  final String? mobileNo;
  final String? otpHash;

  OTPVerifyPage({this.mobileNo, this.otpHash});

  @override
  _OTPVerifyPageState createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  bool enableResendBtn = false;
  String _otpCode = "";
  final int _otpCodeLength = 4;
  bool _enableButton = false;
  //var autoFill;
  late FocusNode myFocusNode;
  bool isAPIcallProcess = false;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    SmsAutoFill().listenForCode.call();

    // autoFill = PinFieldAutoFill(
    //   decoration: UnderlineDecoration(
    //     textStyle: const TextStyle(fontSize: 20, color: Colors.black),
    //     colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
    //   ),
    //   currentCode: _otpCode,
    //   codeLength: _otpCodeLength,
    //   onCodeSubmitted: (code) {},
    //   onCodeChanged: (code) {
    //     print(code);
    //     if (code!.length == _otpCodeLength) {
    //       _otpCode = code;
    //       _enableButton = true;
    //       FocusScope.of(context).requestFocus(FocusNode());
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          child: otpVerify(),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget otpVerify() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          "https://i.imgur.com/6aiRpKT.png",
          height: 180,
          fit: BoxFit.contain,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            "Enter OTP code sent to you mobile \n+92-${widget.mobileNo}",
            maxLines: 2,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          //child: autoFill,
          child: PinFieldAutoFill(
            decoration: UnderlineDecoration(
              textStyle: const TextStyle(fontSize: 20, color: Colors.black),
              colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
            ),
            currentCode: _otpCode,
            codeLength: _otpCodeLength,
            onCodeSubmitted: (code) {},
            onCodeChanged: (code) {
              print(code);
              if (code!.length == _otpCodeLength) {
                _otpCode = code;
                _enableButton = true;
                FocusScope.of(context).requestFocus(FocusNode());
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: FormHelper.submitButton(
            "Continue",
            () {
              if (_enableButton) {
                setState(() {
                  isAPIcallProcess = true;
                });

                APIService.verifyOTP(
                        widget.mobileNo!, widget.otpHash!, _otpCode)
                    .then((response) {
                  setState(() {
                    isAPIcallProcess = false;
                  });

                  if (response.data != null) {
                    //REDIRECT TO HOME SCREEN
                    FormHelper.showSimpleAlertDialog(
                      context,
                      Config.appName,
                      "OTP Verified Successfully",
                      "Ok",
                      () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "/register",
                          arguments: {'mobileNo': widget.mobileNo},
                          (route) => false,
                        );
                      },
                    );
                  } else {
                    FormHelper.showSimpleAlertDialog(
                      context,
                      Config.appName,
                      response.message,
                      "OK",
                      () {
                        Navigator.pop(context);
                      },
                    );
                  }
                });
              }
            },
            borderColor: Colors.yellow.shade900,
            btnColor: Colors.yellow.shade900,
            txtColor: Colors.white,
            borderRadius: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: RichText(
              text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Want to Update Number ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "Go back",
                style: TextStyle(
                  color: Colors.yellow.shade900,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/otplogin",
                      (route) => false,
                    );
                  },
              )
            ],
          )),
        ),
      ],
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }
}

class CodeAutoFillTestPage extends StatefulWidget {
  @override
  _CodeAutoFillTestPageState createState() => _CodeAutoFillTestPageState();
}

class _CodeAutoFillTestPageState extends State<CodeAutoFillTestPage>
    with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: Text("Listening for code"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Text(
              "This is the current app signature: $appSignature",
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Builder(
              builder: (_) {
                if (otpCode == null) {
                  return Text("Listening for code...", style: textStyle);
                }
                return Text("Code Received: $otpCode", style: textStyle);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
