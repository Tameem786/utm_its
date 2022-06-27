import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utm_its/st_log.dart';

class Student extends StatefulWidget {
  const Student({
    Key? key,
    required this.name,
    required this.email,
    required this.matric,
    required this.id,
  }) : super(key: key);
  final String name;
  final String email;
  final String matric;
  final String id;

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
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
            Text(widget.matric.toString()),
            ElevatedButton(
              child: Text('View'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentLog()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
