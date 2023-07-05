import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/config.dart';
import 'package:theek_karo/pages/ot_email_verify.dart';
import 'package:theek_karo/pages/otp_verify_page.dart';

class EmailOTPPage extends StatefulWidget {
  const EmailOTPPage({super.key});

  @override
  State<EmailOTPPage> createState() => _EmailOTPPageState();
}

class _EmailOTPPageState extends State<EmailOTPPage> {
  String email = '';
  bool isAPICallProcess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          child: loginUI(),
          inAsyncCall: isAPICallProcess,
          opacity: .3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  loginUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://i.imgur.com/bOCEVJg.png",
          height: 160,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              "Reset Password Through Email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Enter email to send OTP",
            style: TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: TextFormField(
                  maxLines: 1,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: "Enter your Email Here",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  onChanged: (String value) {
                    if (value.length > 9) {
                      email = value;
                    }
                  },
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: FormHelper.submitButton(
            "Continue",
            () async {
              if (email.length > 8) {
                setState(() {
                  isAPICallProcess = true;
                });

                APIService.otpEmailLogin(email).then((response) async {
                  setState(() {
                    isAPICallProcess = false;
                  });

                  if (response.data != null) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPEmailVerifyPage(
                          otpHash: response.data,
                          email: email,
                        ),
                      ),
                      (route) => false,
                    );
                  }
                });
              } else {
                FormHelper.showSimpleAlertDialog(
                  context,
                  Config.appName,
                  "Please Enter a Valid Email",
                  "Ok",
                  () {
                    Navigator.of(context).pop();
                  },
                );
              }
            },
            borderColor: Colors.yellow.shade900,
            btnColor: Colors.yellow.shade900,
            txtColor: HexColor("#000000"),
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
                text: "Back to Login ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "Login In",
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/login",
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
}
