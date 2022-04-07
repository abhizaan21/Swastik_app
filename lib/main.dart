import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:swastik_app/pages/home_page.dart';
import 'package:swastik_app/pages/login_page.dart';
import 'package:swastik_app/pages/signup_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "Login Page",
      routes: {
        'login_screen': (context) => const LoginScreen(),
        'signup_page': (context) => const SignupPage(),
        'home_screen': (context) => Home(),
      },
      home: const IntroScreen(),
      );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        useLoader: true,
        loadingTextPadding: const EdgeInsets.all(0),
        loadingText: const Text(""),
        navigateAfterSeconds: const LoginScreen(),
        seconds: 3,
        title: const Text(
          'Swastik, Inspire Others',
          style: TextStyle(fontSize: 28,
            fontWeight:FontWeight.w600,
            fontFamily: "Hurricane",),
        ),
        image: Image.asset('assets/images/Swastik.jpg', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: const TextStyle(),
        photoSize: 88,
        loaderColor: Colors.orange);
  }
}