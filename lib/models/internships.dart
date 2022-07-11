import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InternshipCard extends StatefulWidget {
  const InternshipCard({
    Key? key,
    required this.title,
    required this.company,
    required this.location,
    required this.id,
  }) : super(key: key);
  final String title;
  final String company;
  final String location;
  final String id;

  @override
  State<InternshipCard> createState() => _InternshipCardState();
}

class _InternshipCardState extends State<InternshipCard> {
  var _notApplied = true;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  void _hasData(String data) async {
    FirebaseFirestore.instance
        .collection("applications")
        .doc(widget.id)
        .collection(widget.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                if ((doc.data() as dynamic)['company'] == data) {
                  setState(() {
                    _notApplied = false;
                  });
                }
              })
            });
  }

  void initState() {
    super.initState();
    _hasData(widget.company);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(widget.title.trim()),
              subtitle: Text(widget.company.trim()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(widget.location.trim()),
            ),
            _notApplied
                ? Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: ElevatedButton(
                      child: Text('Apply'),
                      onPressed: () async {
                        var string = getRandomString(20);
                        try {
                          await FirebaseFirestore.instance
                              .collection('applications')
                              .doc(widget.id)
                              .collection(widget.id)
                              .doc(string)
                              .set({
                            'name': widget.title,
                            'company': widget.company,
                            'location': widget.location,
                            'applicationid': string,
                            'studentid': widget.id,
                            'status': 'Applied',
                          }).whenComplete(() {});
                        } catch (err) {
                          print(err);
                        } finally {
                          print('Job Submitted');
                        }
                      },
                    ),
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
