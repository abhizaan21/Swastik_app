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
    return Material(
      child: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('assets/images/nari.jpeg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black26.withOpacity(0.8),
                        BlendMode.darken,
                      ))),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(25),
              child: Image.asset('assets/images/Swastik.jpg')),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Memories Last Forever",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Hurricane",
                ),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                    fontSize: 28),
              )),const SizedBox(height: 21),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18),
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
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18),
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
                      style: TextStyle(color: Colors.white,fontSize: 16)),
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
                          borderRadius: BorderRadius.circular(20.0))),
                )),
            Row(
              children: <Widget>[
                const Text("Don't have an account?"),
                TextButton(
                  child: const Text(
                    'Sign up here..',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black),
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
      );
  }
}
