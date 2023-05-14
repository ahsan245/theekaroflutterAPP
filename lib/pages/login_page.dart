import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/config.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/user_filter.dart';
import 'package:theek_karo/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late final UserFilterModel model;
  bool isAsyncCallProcess = false;
  String? email;
  String? password;
  bool hidePassword = true;
  bool isRemeber = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _loginUI(),
          ),
          inAsyncCall: isAsyncCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Image.asset(
              "assets/images/login.png",
              width: 180,
              fit: BoxFit.none,
            ),
          ),
          Center(
            child: Text(
              "LOGIN ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.yellow.shade900,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            const Icon(Icons.email_rounded, color: Colors.black),
            "Email",
            "E-Mail",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "* Required";
              }
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(onValidateVal);

              if (!emailValid) {
                return "Email Invalid";
              }
              return null;
            },
            (onSavedVal) {
              email = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            prefixIconPaddingLeft: 10,
            borderRadius: 10,
            fontSize: 14,
            borderColor: Colors.grey.shade400,
            prefixIconColor: Colors.black,
            borderFocusColor: Colors.grey.shade200,
            hintFontSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            const Icon(Icons.lock_open, color: Colors.black),
            "Password",
            "Enter Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "* Required";
              }
              return null;
            },
            (onSavedVal) {
              password = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            borderRadius: 10,
            fontSize: 14,
            borderColor: Colors.grey.shade400,
            prefixIconPaddingLeft: 10,
            prefixIconColor: Colors.black,
            borderFocusColor: Colors.grey.shade200,
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.redAccent.withOpacity(0.4),
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            ),
            onChange: (val) {
              password = val;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: FormHelper.submitButton(
              "Sign In",
              () {
                if (validateSave()) {
                  setState(() {
                    isAsyncCallProcess = true;
                  });
                  APIService.loginUser(email!, password!).then((res) {
                    setState(() {
                      print(res?.userId);
                      isAsyncCallProcess = false;
                    });

                    if (res != null) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "User Logged In Successfully",
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home',
                            arguments: {'userId': res.userId},
                            (route) => false,
                          );
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Invalid Username/Password",
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  });
                }
              },
              btnColor: Colors.yellow.shade900,
              borderColor: Colors.white,
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
                  text: "Login as Tech? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Login In",
                  style: TextStyle(
                    color: Colors.yellow.shade900,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        // "/otplogin",
                        "/tech-login",
                        (route) => false,
                      );
                    },
                )
              ],
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
                text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Forget Password?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Click Here",
                  style: TextStyle(
                    color: Colors.yellow.shade900,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        // "/otplogin",
                        "/otpemail",
                        (route) => false,
                      );
                    },
                )
              ],
            )),
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
