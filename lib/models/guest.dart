import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Guest extends StatefulWidget {
  const Guest({
    Key? key,
    required this.name,
    required this.email,
    required this.id,
  }) : super(key: key);
  final String name;
  final String email;
  final String id;

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.name.toString()),
              subtitle: Text(widget.email.toString()),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('recruiters')
                    .doc(widget.id)
                    .delete();
              },
              child: Text('Remove'),
            ),
          ],
        ),
      ),
    );
  }
}
