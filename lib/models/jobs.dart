import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Jobs extends StatefulWidget {
  const Jobs({
    Key? key,
    required this.title,
    required this.company,
    required this.desc,
    required this.id,
  }) : super(key: key);
  final String title;
  final String company;
  final String desc;
  final String id;

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  var _notapplied = true;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.title.toString()),
              subtitle: Text(widget.company.toString()),
            ),
            Text(widget.desc.toString()),
            _notapplied
                ? ElevatedButton(
                    child: Text('Apply'),
                    onPressed: () async {
                      var string = getRandomString(20);
                      try {
                        await FirebaseFirestore.instance
                            .collection('applications')
                            .doc(widget.id)
                            .collection(widget.id)
                            .doc()
                            .set({
                          'name': widget.title,
                          'company': widget.company,
                          'location': widget.desc,
                          'studentid': widget.id,
                          'status': 'Applied',
                          'approval': false,
                          'applicationid': string,
                        }).whenComplete(() {
                          setState(() {
                            _notapplied = false;
                          });
                        });
                      } catch (err) {
                        print(err);
                      } finally {
                        print('Applications Submitted');
                      }
                    },
                  )
                : Text('Applied'),
          ],
        ),
      ),
    );
  }
}
