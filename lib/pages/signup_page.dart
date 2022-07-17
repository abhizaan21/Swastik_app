import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swastik_app/textPalate.dart';

import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool showSpinner = false;
  bool _isVisible = false;
  late String email;
  late String password;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    const String _title = "Sign Up";
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(_title),
          backgroundColor: Colors.deepPurpleAccent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              )),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/images/nari.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black26.withOpacity(0.8),
                    BlendMode.darken,
                  ))),
          child: Form(
              child: SingleChildScrollView(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "Upgrade your LifeStyle",
                                      style: TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Hurricane",
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Create your account today!",
                                      style: TextStyle(
                                        fontSize: 21,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey
                                                  .withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
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
                                          ),const SizedBox(
                                            height: 8.0,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(21),
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
                                                    prefixIcon: const Icon(
                                                        Icons.lock_sharp,
                                                        color: Colors.white),
                                                    suffixIcon: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            _isVisible =
                                                                !_isVisible;
                                                          });
                                                        },
                                                        icon: _isVisible
                                                            ? const Icon(
                                                                Icons
                                                                    .visibility,
                                                                color: Colors
                                                                    .black,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .visibility_off,
                                                                color:
                                                                    Colors.grey,
                                                              ))),style: kBodyText,),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 24.0,
                                      ),
                                      Container(
                                          height: 50,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: ElevatedButton(
                                              child: const Text('Register',style: TextStyle(fontSize: 16),),
                                              onPressed: () async {
                                                try {
                                                  final newUser = await firebaseAuth
                                                      .createUserWithEmailAndPassword(
                                                          email: email,
                                                          password: password);
                                                  if (newUser != null) {
                                                    Navigator.pushNamed(context,
                                                        "login_screen");
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              21.0))))),
                                      Row(
                                        children: <Widget>[
                                          const Text("Don't have an account?",style: TextStyle(fontSize: 14,color: Colors.white70)),
                                          TextButton(
                                            child: const Text(
                                              'Login here..',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      Colors.white70),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen()),
                                              );
                                              //signup screen
                                            },
                                          )
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ])))),
        ));
  }
}
