import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/pages/dashboard_page.dart';
import 'package:theek_karo/pages/home_page.dart';
import 'package:theek_karo/pages/login_page.dart';
import 'package:theek_karo/pages/register_page.dart';
import 'package:theek_karo/pages/tech_details_page.dart';
import 'package:theek_karo/pages/techs_page.dart';
import 'package:theek_karo/utils/shared_service.dart';

Widget _defaultHome = const HomePage();
void main() //async
{
  WidgetsFlutterBinding.ensureInitialized();
  // bool _result = await SharedService.isLoggedIn();

  // if (_result) {
  //   _defaultHome = const HomePage();
  // }
  _defaultHome = const DashboardPage();
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
        "/home": (BuildContext context) => const HomePage(),
        "/techs": (BuildContext context) => const TechsPage(),
        "/tech-details": (BuildContext context) => const TechDetailsPage(),
      },
    );
  }
}
