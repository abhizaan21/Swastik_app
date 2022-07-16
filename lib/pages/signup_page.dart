import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                color: Colors.black,
              )),
        ),
        body: Form(
            child: SingleChildScrollView(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Upgrade your LifeStyle",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Hurricane",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Create an Account,Its free",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textAlign: TextAlign.start,
                                        onChanged: (value) {
                                          email = value;
                                        },
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                hintText: 'Enter your email',
                                                prefixIcon: const Icon(
                                                  Icons.person,
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                ))),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    TextField(
                                        obscureText: !_isVisible,
                                        textAlign: TextAlign.start,
                                        onChanged: (value) {
                                          password = value;
                                        },
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                hintText: 'Enter your Password',
                                                prefixIcon: const Icon(
                                                    Icons.security,
                                                    color: Colors
                                                        .deepPurpleAccent),
                                                suffixIcon: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _isVisible =
                                                            !_isVisible;
                                                      });
                                                    },
                                                    icon: _isVisible
                                                        ? const Icon(
                                                            Icons.visibility,
                                                            color: Colors.black,
                                                          )
                                                        : const Icon(
                                                            Icons
                                                                .visibility_off,
                                                            color: Colors.grey,
                                                          )))),
                                    const SizedBox(
                                      height: 24.0,
                                    ),
                                    Container(
                                        height: 50,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: ElevatedButton(
                                            child: const Text('Register'),
                                            onPressed: () async {
                                              setState(() {
                                                showSpinner = true;
                                              });
                                              try {
                                                final newUser = await firebaseAuth
                                                    .createUserWithEmailAndPassword(
                                                        email: email,
                                                        password: password);
                                                if (newUser != null) {
                                                  Navigator.pushNamed(
                                                      context, "login_screen");
                                                }
                                              } catch (e) {
                                                print(e);
                                              }
                                              setState(() {
                                                showSpinner = false;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary:
                                                    Colors.deepPurpleAccent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0))))),
                                    Row(
                                      children: <Widget>[
                                        const Text("Don't have an account?"),
                                        TextButton(
                                          child: const Text(
                                            'Login here..',
                                            style: TextStyle(
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.black),
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
                        ])))));
  }
}

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
