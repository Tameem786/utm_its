import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InternshipCard extends StatefulWidget {
  const InternshipCard({
    Key? key,
    required this.title,
    required this.company,
    required this.location,
  }) : super(key: key);
  final String title;
  final String company;
  final String location;

  @override
  State<InternshipCard> createState() => _InternshipCardState();
}

class _InternshipCardState extends State<InternshipCard> {
  var _notApplied = true;

  void _hasData(String data) async {
    FirebaseFirestore.instance
        .collection("applications")
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
                        try {
                          await FirebaseFirestore.instance
                              .collection('applications')
                              .doc()
                              .set({
                            'name': widget.title,
                            'company': widget.company,
                            'location': widget.location,
                            'student': 'Raoa Faria Karim',
                          }).whenComplete(() {});
                        } catch (err) {
                          print(err);
                        } finally {
                          print('Logbook Submitted');
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
