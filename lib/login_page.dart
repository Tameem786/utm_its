import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/admin_panel.dart';
import 'package:utm_its/google_auth.dart';
import 'package:utm_its/guest_page.dart';
import 'package:utm_its/student_screen.dart';
import 'package:utm_its/view_supervisor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  bool _exist = false;

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  SnackBar snackbar(Color color, String text) {
    return SnackBar(
      backgroundColor: color,
      content: Text(text),
    );
  }

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
                        if (value.length < 5) {
                          return 'Username should be more than 5 character';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please provide valid email address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: myControllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 6) {
                          return 'Password should be more than 6 characters';
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
                    onPressed: () async {
                      if (myControllerUsername.text == 'admin' &&
                          myControllerPassword.text == 'admin') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminPanel(),
                          ),
                        );
                      } else {
                        if (_formKey.currentState!.validate()) {
                          try {
                            var collectionRef = FirebaseFirestore.instance
                                .collection('supervisors');

                            var doc = await collectionRef
                                .doc(myControllerPassword.text)
                                .get();
                            print(doc.exists);
                            if (doc.exists) {
                              if (doc['email'] == myControllerUsername.text &&
                                  doc['password'] ==
                                      myControllerPassword.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  snackbar(
                                    Colors.green,
                                    'Login Successfull',
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Supervisor(
                                      username: myControllerUsername.text,
                                      id: myControllerPassword.text,
                                    ),
                                  ),
                                );
                              } else {
                                print(myControllerPassword.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  snackbar(
                                    Colors.red,
                                    'Login Failed',
                                  ),
                                );
                              }
                            } else {
                              try {
                                var collectionRef = FirebaseFirestore.instance
                                    .collection('students');

                                var doc = await collectionRef
                                    .doc(myControllerPassword.text)
                                    .get();

                                if (doc.exists) {
                                  if (doc['email'] ==
                                          myControllerUsername.text &&
                                      doc['password'] ==
                                          myControllerPassword.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      snackbar(
                                        Colors.green,
                                        'Login Successfull',
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StudentScreen(
                                          id: myControllerPassword.text,
                                          name: doc['name'],
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      snackbar(
                                        Colors.red,
                                        'Login Failed',
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    snackbar(
                                      Colors.red,
                                      'Login Failed',
                                    ),
                                  );
                                }
                              } catch (e) {
                                throw e;
                              }
                              // print(myControllerPassword.text);
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   snackbar(
                              //     Colors.red,
                              //     'Login Failed',
                              //   ),
                              // );
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          if (_formKey.currentState!.validate()) {
                            // try {
                            //   var collectionRef = FirebaseFirestore.instance
                            //       .collection('students');

                            //   var doc = await collectionRef
                            //       .doc(myControllerPassword.text)
                            //       .get();

                            //   if (doc.exists) {
                            //     if (doc['email'] == myControllerUsername.text &&
                            //         doc['password'] ==
                            //             myControllerPassword.text) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         snackbar(
                            //           Colors.green,
                            //           'Login Successfull',
                            //         ),
                            //       );
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => StudentScreen(
                            //             id: myControllerPassword.text,
                            //             name: doc['name'],
                            //           ),
                            //         ),
                            //       );
                            //     } else {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         snackbar(
                            //           Colors.red,
                            //           'Login Failed',
                            //         ),
                            //       );
                            //     }
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       snackbar(
                            //         Colors.red,
                            //         'Login Failed',
                            //       ),
                            //     );
                            //   }
                            // } catch (e) {
                            //   throw e;
                            // }
                          }
                        }
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Color.fromARGB(255, 156, 17, 7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      User? user = await Authentication.signInWithGoogle(
                          context: context);

                      if (user != null) {
                        await FirebaseFirestore.instance
                            .collection('recruiters')
                            .get()
                            .then((value) {
                          for (var doc in value.docs) {
                            Map<String, dynamic> data = doc.data();
                            if (data['email'] == user.email.toString()) {
                              setState(() {
                                _exist = true;
                              });
                              break;
                            }
                          }
                        });
                        if (_exist) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => GuestPage(
                                user: user,
                              ),
                            ),
                          );
                        } else {
                          var string = getRandomString(20);

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
