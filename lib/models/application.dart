import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({
    Key? key,
    required this.company,
    required this.location,
    required this.status,
    required this.id,
    required this.isAdmin,
    required this.applicationID,
  }) : super(key: key);
  final String company;
  final String location;
  final String status;
  final String id;
  final bool isAdmin;
  final String applicationID;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.company.toString()),
              subtitle: Text(widget.location.toString()),
            ),
            Text('Status: ' + widget.status.toString()),
            widget.isAdmin
                ? ElevatedButton(
                    child: Text('Remove'),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('applications')
                          .doc(widget.id)
                          .collection(widget.id)
                          .doc(widget.applicationID)
                          .delete();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
