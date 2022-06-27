// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/admin_panel.dart';
import 'package:utm_its/google_auth.dart';
import 'package:utm_its/guest_page.dart';
import 'package:utm_its/register_page.dart';
import 'package:utm_its/student_screen.dart';
import 'package:utm_its/view_supervisor.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key, required this.title}) : super(key: key);
  const LoginPage({Key? key}) : super(key: key);
  // final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();

  // var _username = '';
  // final students = FirebaseFirestore.instance.collection('students');

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 99, 174, 234),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              child: Image(
                // height: MediaQuery.of(context).size.height * 0.45,
                // width: MediaQuery.of(context).size.width * 0.15,
                image: AssetImage('assets/title.png'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: myControllerUsername,
                      decoration: InputDecoration(
                        hintText: 'Username(Utm Mail)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      // onSaved: (value) {
                      //   setState(() {
                      //     _username = value.toString();
                      //   });
                      // },
                    ),
                    TextFormField(
                      controller: myControllerPassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (myControllerUsername.text == 'admin' &&
                          myControllerPassword.text == 'admin') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminPanel(),
                          ),
                        );
                      } else if (myControllerUsername.text ==
                              'jungkook@utm.my' &&
                          myControllerPassword.text == 'super') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Supervisor(
                                    username: myControllerUsername.text)));
                      }

                      // final query = students.where("matric", isEqualTo: '');
                      // if (_formKey.currentState!.validate()) {
                      else {
                        _firebaseAuth
                            .signInWithEmailAndPassword(
                                email: myControllerUsername.text,
                                password: myControllerPassword.text)
                            .then((value) {
                          print('Logged in Successfully!');
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentScreen(
                                      username: myControllerUsername.text,
                                    )));
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                  ),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 156, 17, 7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      User? user = await Authentication.signInWithGoogle(
                          context: context);

                      if (user != null) {
                        bool exist = false;
                        FirebaseFirestore.instance
                            .collection('recruiters')
                            .get()
                            .then((value) {
                          for (var doc in value.docs) {
                            Map<String, dynamic> data = doc.data();
                            if (data['email'] == user.email.toString()) {
                              print('Email Found!');
                              exist = true;
                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(
                              //     builder: (context) => GuestPage(
                              //       user: user,
                              //     ),
                              //   ),
                              // );
                            }
                          }
                        });
                        if (exist) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => GuestPage(
                                user: user,
                              ),
                            ),
                          );
                        } else {
                          var string = getRandomString(20);

                          // print('Email: ' + email.toString());
                          FirebaseFirestore.instance
                              .collection('recruiters')
                              .doc(string)
                              .set({
                            'name': user.displayName.toString(),
                            'id': string,
                            'email': user.email.toString(),
                          }).whenComplete(
                            () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => GuestPage(
                                  user: user,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const RegisterPage()));
                    },
                    child: Text('Signin as a Guest Using Google'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
