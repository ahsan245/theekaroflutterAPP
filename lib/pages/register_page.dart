import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/config.dart';

String mobileNo = "";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      mobileNo = arguments["mobileNo"];
      print("MobileNo");
      print(mobileNo);
    }
    super.didChangeDependencies();
  }

  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;
  String? fullName;
  String? password;
  String? confirmPassword;
  String? email;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "TeekKaro App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ],
          ),
          const Center(
            child: Text(
              "Register ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.face, color: Colors.black),
              "Fullname",
              "Enter full Name", (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "* Required";
            }
            return null;
          }, (onSavedVal) {
            fullName = onSavedVal.toString().trim();
          },
              showPrefixIcon: true,
              borderRadius: 10,
              fontSize: 14,
              borderColor: Colors.grey.shade400,
              prefixIconPaddingLeft: 10,
              prefixIconColor: Colors.black,
              borderFocusColor: Colors.grey.shade200),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.email_rounded, color: Colors.black),
              "Email",
              "Enter Email ", (onValidateVal) {
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
          }, (onSavedVal) {
            email = onSavedVal.toString().trim();
          },
              showPrefixIcon: true,
              borderRadius: 10,
              fontSize: 14,
              borderColor: Colors.grey.shade400,
              prefixIconPaddingLeft: 10,
              prefixIconColor: Colors.black,
              borderFocusColor: Colors.grey.shade200),
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

              var hasUppercase = onValidateVal.contains(new RegExp(r'[A-Z]'));
              var hasLowercase = onValidateVal.contains(new RegExp(r'[a-z]'));
              var hasNumber = onValidateVal.contains(new RegExp(r'[0-9]'));
              var hasSpecialChar =
                  onValidateVal.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

              if (!(hasUppercase &&
                  hasLowercase &&
                  hasNumber &&
                  hasSpecialChar)) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Password Error"),
                        content: Text(
                            "Password must contain at least one uppercase letter, one lowercase letter, one number and one special character"),
                        actions: <Widget>[
                          OutlinedButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                return "Password Error";
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
            height: 10,
          ),
          FormHelper.inputFieldWidget(
            context,
            const Icon(Icons.lock_open, color: Colors.black),
            "Confirm Password",
            "Confirm Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "* Required";
              }
              if (onValidateVal != password) {
                return "Confirm Password not Matched";
              }

              return null;
            },
            (onSavedVal) {
              confirmPassword = onSavedVal.toString().trim();
            },
            showPrefixIcon: true,
            borderRadius: 10,
            fontSize: 14,
            borderColor: Colors.grey.shade400,
            prefixIconPaddingLeft: 10,
            prefixIconColor: Colors.black,
            hintFontSize: 14,
            borderFocusColor: Colors.grey.shade200,
            obscureText: hideConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hideConfirmPassword = !hideConfirmPassword;
                });
              },
              color: Colors.redAccent.withOpacity(0.4),
              icon: Icon(hideConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: FormHelper.submitButton(
              "Sign Up",
              () {
                if (validateSave()) {
                  setState(() {
                    isAsyncCallProcess = true;
                  });
                  APIService.registerUser(
                          fullName!, email!, password!, "0$mobileNo")
                      .then((response) {
                    setState(() {
                      isAsyncCallProcess = false;
                    });

                    if (response) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Registration Completed Successfully",
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            "/login",
                            (route) => false,
                          );
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "This Email Already Exist",
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
              btnColor: Colors.yellow.shade900,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                children: <TextSpan>[
                  TextSpan(text: "Already Have an Account?"),
                  TextSpan(
                    text: "Sign In",
                    style: TextStyle(
                      color: Colors.yellow.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "/login",
                          (route) => false,
                        );
                      },
                  ),
                ],
              ),
            ),
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
