import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theek_karo/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theek karo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: AnimatedSplashScreen(
            splash:
                Image.asset('assets/images/logo.png', height: 300, width: 300),
            splashIconSize: 150,
            duration: 3000,
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.white,
            // splash: Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.deepPurple,
            //       ),
            //       Container(
            //         child: Text(
            //           'Splash Screen',
            //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            nextScreen: const LoginPage()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
