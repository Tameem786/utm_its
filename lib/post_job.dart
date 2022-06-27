import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/guest_page.dart';

class PostJobForm extends StatefulWidget {
  const PostJobForm({Key? key}) : super(key: key);

  @override
  State<PostJobForm> createState() => _PostJobFormState();
}

class _PostJobFormState extends State<PostJobForm> {
  final _formKey = GlobalKey<FormState>();
  final myControllerDate = TextEditingController();
  final myControllerDay = TextEditingController();
  final myControllerActivity = TextEditingController();
  // User user = FirebaseAuth.instance.currentUser!;

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Job'),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 99, 174, 234),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      controller: myControllerDate,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Job Title',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      controller: myControllerDay,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Company Title',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      controller: myControllerActivity,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Description (Salary, Position etc...)',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var string = getRandomString(20);
                      try {
                        await FirebaseFirestore.instance
                            .collection('jobposts')
                            .doc(string)
                            .set({
                          'title': myControllerDay.text,
                          'company': myControllerDate.text,
                          'description': myControllerActivity.text,
                          'approval': false,
                          'id': string,
                        }).whenComplete(
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestPage(
                                        user:
                                            FirebaseAuth.instance.currentUser!,
                                      ))),
                        );
                      } catch (err) {
                        print(err);
                      } finally {
                        print('Logbook Submitted');
                      }
                    },
                    child: Text('Post'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
