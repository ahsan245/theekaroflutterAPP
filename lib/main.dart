import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/pages/complain_detail_page.dart';
import 'package:theek_karo/pages/complains_List.dart';
import 'package:theek_karo/pages/dashboard_page.dart';
import 'package:theek_karo/pages/dashboard_tech_page.dart';
import 'package:theek_karo/pages/home_page.dart';
import 'package:theek_karo/pages/login_otp_page.dart';
import 'package:theek_karo/pages/login_page.dart';
import 'package:theek_karo/pages/map.dart';
import 'package:theek_karo/pages/otp_verify_page.dart';
import 'package:theek_karo/pages/passwrod_reset_email.dart';
import 'package:theek_karo/pages/payment.dart';
import 'package:theek_karo/pages/register_page.dart';
import 'package:theek_karo/pages/reset_password.dart';
import 'package:theek_karo/pages/splash_screen.dart';
import 'package:theek_karo/pages/tech_complain_detail.dart';
import 'package:theek_karo/pages/tech_complains_List.dart';
import 'package:theek_karo/pages/tech_details_page.dart';
import 'package:theek_karo/pages/tech_login_page.dart';
import 'package:theek_karo/pages/techs_page.dart';
import 'package:theek_karo/pages/tesst.dart';
import 'package:theek_karo/pages/user_details_page.dart';
import 'package:theek_karo/utils/shared_service.dart';

Widget _defaultHome = const TechLoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Remember to uncomment from the API service file
  ///poora aik din zaya kia tha us comment k chakkar m
  // bool _result = await SharedService.isLoggedIn();

  // if (_result) {
  _defaultHome = const LoginPage();
  // }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theek Karo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: _defaultHome,
      routes: <String, WidgetBuilder>{
        "/": (context) => _defaultHome,
        "/register": (BuildContext context) => const RegisterPage(),
        "/login": (BuildContext context) => const LoginPage(),
        "/tech-login": (BuildContext context) => const TechLoginPage(),
        "/home": (BuildContext context) => const DashboardPage(),
        "/tech-complain-details": (BuildContext context) =>
            const TechComplainDetailPage(),
        "/techs": (BuildContext context) => const TechsPage(),
        "/complain": (BuildContext context) => const TestPage(),
        "/otplogin": (BuildContext context) => const LoginOTPPage(),
        "/otpverify": (BuildContext context) => OTPVerifyPage(),
        "/complain-details": (BuildContext context) => ComplainDetailPage(),
        "/tech-details": (BuildContext context) => const TechDetailsPage(),
        "/user-details": (BuildContext context) => const UserDetailsPage(),
        "/otpemail": (BuildContext context) => const EmailOTPPage(),
        "/resetpassword": (BuildContext context) => const ResetPasswordPage(),
        "/complain-list": (BuildContext context) => Complains(),
        "/tech-home": (BuildContext context) => const TechDashBoardPage(),
        "/payment": (BuildContext context) => const Payment(),
      },
    );
  }
}
