import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/pages/home_page.dart';
import 'package:theek_karo/pages/register_page.dart';
import 'package:theek_karo/pages/techs_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theek Karo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      routes: <String, WidgetBuilder>{
        "/register": (BuildContext context) => const RegisterPage(),
        '/techs': (BuildContext context) => const TechsPage(),
      },
    );
  }
}
