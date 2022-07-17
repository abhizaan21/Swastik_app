import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swastik_app/pages/signup_page.dart';

import '../textPalate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;
  late String email;
  late String password;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/images/nari.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black26.withOpacity(0.6),
                BlendMode.darken,
              ))),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Swastik.jpg'),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: const Text(
                "Log In",textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Hurricane"),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: kBodyText,
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      )),
                  style: kBodyText,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: TextField(
                  obscureText: !_isVisible,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      hintStyle: kBodyText,
                      prefixIcon:
                          const Icon(Icons.lock_sharp, color: Colors.white),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ))),
                  style: kBodyText,
                ),
              ),
            ]),
            const SizedBox(
              height: 24.0,
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  onPressed: () async {
                    try {
                      final user =
                          await firebaseAuth.signInWithEmailAndPassword(
                              email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, "intro_screen");
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.0))),
                )),
            Row(
              children: <Widget>[
                const Text("Don't have an account?",style:TextStyle(color: Colors.white70)),
                TextButton(
                  child: const Text(
                    'Sign up here..',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white70),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                    );
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ]),
    ));
  }
}
